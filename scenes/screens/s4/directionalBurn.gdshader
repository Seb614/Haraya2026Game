shader_type canvas_item;

uniform float burn_progress : hint_range(0.0, 1.0) = 0.0;
uniform float edge_thickness : hint_range(0.001, 0.5) = 0.06;

float burn_pattern(vec2 uv) {
    // uv.x goes 0 → 1 left to right
    float x = uv.x;

    // sine-based "fake noise" for wavy burn
    float w1 = sin(uv.y * 12.0 + x * 6.0);
    float w2 = sin(uv.y * 25.0 - x * 3.0) * 0.5;
    float w3 = sin(uv.x * 40.0 + uv.y * 8.0) * 0.3;

    float wave = w1 + w2 + w3;

    // add distortion to x
    x += wave * 0.04;

    return x;
}

void fragment() {
    vec4 tex = texture(TEXTURE, UV);

    float p = burn_pattern(UV);

    float t = mix(0.0, 1.2, burn_progress);
    float e = max(edge_thickness, 0.001);

    // reveal mask
    float s = smoothstep(t - e, t + e, p);
    float reveal = 1.0 - s;

    float final_alpha = tex.a * reveal;

    // edge mask: flame lives only at active frontier
    float dist = abs(p - t);
    float edge_mask = clamp(1.0 - dist / e, 0.0, 1.0);
    edge_mask *= smoothstep(t + e, t - e * 0.25, p);

    vec3 fire_col = vec3(1.0, 0.6, 0.12);
    vec3 final_rgb = tex.rgb * reveal + fire_col * edge_mask;

    COLOR = vec4(final_rgb, final_alpha);
}
