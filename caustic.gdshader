shader_type canvas_item;

uniform sampler2D dissolveNoise;
uniform vec4 glow_color : source_color = vec4(1.0, 0.84, 0.0, 1.0); // gold
uniform float glow_speed : hint_range(0.0, 5.0) = 1.2;
uniform float sliver_density : hint_range(1.0, 10.0) = 4.0;
uniform float sliver_width : hint_range(0.0, 0.5) = 0.12;
uniform float noise_strength : hint_range(0.0, 1.0) = 0.25;
uniform float wave_amplitude : hint_range(0.0, 0.1) = 0.03;
uniform float wave_frequency : hint_range(0.0, 20.0) = 8.0;

// Size of the repeat region in pixels
uniform vec2 tile_size = vec2(256.0, 256.0);

void fragment() {
    vec4 base = texture(TEXTURE, UV);

    // Convert UV to pixel space
    vec2 texture_size = vec2(1.0) / TEXTURE_PIXEL_SIZE;
    vec2 pixel_uv = UV * texture_size;

    // Wrap inside the tile region for seamless repetition
    vec2 tiled_uv = fract(pixel_uv / tile_size);

    // Sample noise
    float noise = texture(dissolveNoise, tiled_uv * 1.5).r;

    // Diagonal direction (1.0, 0.5)
    vec2 flow_dir = normalize(vec2(1.0, 0.5));

    // Time-based motion
    float time_shift = TIME * glow_speed;

    // Wavy distortion (slight shimmering)
    float wave_x = sin(tiled_uv.y * wave_frequency + TIME * glow_speed) * wave_amplitude;
    float wave_y = cos(tiled_uv.x * wave_frequency * 0.8 + TIME * glow_speed * 0.8) * wave_amplitude;
    vec2 warped_uv = tiled_uv + vec2(wave_x, wave_y);

    // Generate repeating diagonal wave pattern
    float wave = fract(dot(warped_uv, flow_dir) * sliver_density + time_shift + noise * noise_strength);

    // Sliver mask — defines where the gold band is visible
    float sliver_mask = smoothstep(sliver_width, 0.0, abs(wave - 0.5));

    // Strength of the glow (softer falloff near edges)
    float glow_strength = pow(sliver_mask, 1.2); // tweak exponent for sharper or softer glow

    // Mix gold color based on glow strength
    vec3 final_color = glow_color.rgb * glow_strength;

    // Make invisible outside of wave
    float alpha = base.a * glow_strength;

    COLOR = vec4(final_color, alpha);
}



