shader_type spatial;
render_mode specular_disabled, ambient_light_disabled;

uniform sampler2D DEPTH_TEXTURE : hint_depth_texture, filter_linear_mipmap;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_nearest;

float GetLinearDepth(vec2 sUV, sampler2D depthTexture, mat4 invProjectionMat, float mask){
	// Raw depth to linear depth code from:
	// https://docs.godotengine.org/en/latest/tutorials/shaders/advanced_postprocessing.html
	float depth = texture(depthTexture, sUV).x * mask;
	vec3 ndc = vec3(sUV * 2.0 - 1.0, depth);
    vec4 view = invProjectionMat * vec4(ndc, 1.0);
	view.xyz /= view.w;
	return -view.z;
}

void vertex(){
  POSITION = vec4(VERTEX.xy, 1.0, 1.0);
}

void fragment(){
	vec2 texelSize = 1.0 / VIEWPORT_SIZE.xy;

	// UV offsets
	vec2 UVOffsets[4];
	UVOffsets[0] = SCREEN_UV + vec2(0.0, -1.0) * texelSize;
	UVOffsets[1] = SCREEN_UV + vec2(0.0, 1.0) * texelSize;
	UVOffsets[2] = SCREEN_UV + vec2(1.0, 0.0) * texelSize;
	UVOffsets[3] = SCREEN_UV + vec2(-1.0, 0.0) * texelSize;

	ALBEDO = texture(SCREEN_TEXTURE, SCREEN_UV).rgb;
}