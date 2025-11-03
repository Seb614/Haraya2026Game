shader_type canvas_item;

uniform float burn_progress : hint_range(0.0, 1.0) = 0.0;
uniform float edge_thickness : hint_range(0.001, 0.5) = 0.06;
uniform float glow : hint_range(0.0, 1.0) = 0.0;
uniform float red_glow : hint_range(0.0, 1.0) = 0.0;
float burn_pattern(vec2 uv) {
    vec2 c = uv * 2.0 - 1.0;
    float r = length(c);
    float w1 = sin(c.x * 10.0 + c.y * 5.0);
    float w2 = sin(c.y * 12.0 - c.x * 7.0);
    float w3 = sin(c.x * 22.0 + c.y * 3.0) * 0.5;
    float wave = (w1 + w2 * 0.8 + w3 * 0.6);
    r += wave * 0.06;
    return r;
}

void fragment() {
    vec4 tex = texture(TEXTURE, UV);
    float pattern = burn_pattern(UV);
    float threshold = mix(-1.0, 1.6, burn_progress);
    float e = max(edge_thickness, 0.001);
    float s = smoothstep(threshold - e, threshold + e, pattern);
    float reveal = 1.0 - s;
    float final_alpha = tex.a * reveal;
    float dist = abs(pattern - threshold);
    float edge_mask = clamp(1.0 - dist / e, 0.0, 1.0);
    edge_mask *= smoothstep(threshold + e, threshold - e*0.25, pattern);
    vec3 fire_col = vec3(1.0, 0.6, 0.12);
    vec3 final_rgb = tex.rgb * reveal + fire_col * edge_mask;
	vec3 yellow = vec3(1.0, .9, 0.2);
	float burned = step(0.98, reveal); // threshold so soft reveal is excluded
	// Radial red overlay growth
	float red_radius = mix(0.0, 1.6, red_glow);
		float red_mask = smoothstep(red_radius + 0.05, red_radius - 0.05, pattern);

	// Ensure no red at 0 glow (remove center speck)
	red_mask *= red_glow;

	vec3 red_col = vec3(1.0, 0.0, 0.0);

	final_rgb = mix(final_rgb, yellow, glow * burned);
	final_rgb = mix(final_rgb, red_col, red_mask);
    COLOR = vec4(final_rgb, final_alpha);
}
