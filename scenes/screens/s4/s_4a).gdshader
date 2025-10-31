shader_type canvas_item;

uniform float burn_progress : hint_range(0.0, 1.0) = 0.0;
uniform float edge_thickness : hint_range(0.001, 0.5) = 0.06;

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
    float threshold = mix(0.0, 1.6, burn_progress);
    float e = max(edge_thickness, 0.001);
    float s = smoothstep(threshold - e, threshold + e, pattern);
    float reveal = 1.0 - s;
    float final_alpha = tex.a * reveal;
    float dist = abs(pattern - threshold);
    float edge_mask = clamp(1.0 - dist / e, 0.0, 1.0);
    edge_mask *= smoothstep(threshold + e, threshold - e*0.25, pattern);
    vec3 fire_col = vec3(1.0, 0.6, 0.12);
    vec3 final_rgb = tex.rgb * reveal + fire_col * edge_mask;
    COLOR = vec4(final_rgb, final_alpha);
}
