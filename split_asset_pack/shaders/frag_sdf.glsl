precision mediump float;

uniform sampler2D 	u_Texture;
uniform vec4 		u_ClipRect;  // clip is in viewport space; y = 0 is bottom of screen 
uniform float 		u_Dilate;
uniform vec3 		u_FaceColor;
uniform float 		u_OutlineThickness;
uniform vec3 		u_OutlineColor;
uniform float		u_PixelSize;
uniform float		u_RenderSize;

varying vec4 v_Color;
varying vec2 v_TexCoordinate;
varying float v_Softness;

float getClipping(vec2 position, vec4 clipRect)
{
	vec2 inside = step(clipRect.xy, position.xy) * step(position.xy, clipRect.zw);
	return inside.x * inside.y;
}

void main()
{
	float clipping = getClipping(gl_FragCoord.xy, u_ClipRect);

	float scale = u_RenderSize / u_PixelSize;
	float scaledSoftness = v_Softness * scale;
		
	float d = texture2D(u_Texture, v_TexCoordinate).a;
	float outline = smoothstep(u_OutlineThickness - scaledSoftness, u_OutlineThickness + scaledSoftness, d);
	d = smoothstep(1.0 - u_Dilate - scaledSoftness, 1.0 - u_Dilate + scaledSoftness, d);
		
	vec4 finalFaceColor = vec4(u_FaceColor * v_Color.rgb, v_Color.a);
	vec4 finalOutlineColor = vec4(u_OutlineColor, v_Color.a);
	vec4 fillColor = mix(finalOutlineColor, finalFaceColor, outline);

	gl_FragColor = vec4(fillColor * d) * clipping;

 }