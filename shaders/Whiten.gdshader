shader_type canvas_item;

uniform bool active = false;

void fragment() {
	vec4 prev = texture(TEXTURE, UV);
	if (active) {
		vec4 white = vec4(1.0, 1.0, 1.0, prev.a);
		COLOR = white;
	}
}
