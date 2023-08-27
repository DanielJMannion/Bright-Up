shader_type canvas_item;
render_mode unshaded;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
	vec4 rgba = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0).rgba;
	rgba.r = 1.0 - rgba.r;
	rgba.g = 1.0 - rgba.g;
	rgba.b = 1.0 - rgba.b;
	
	COLOR.rgba = rgba;
}
