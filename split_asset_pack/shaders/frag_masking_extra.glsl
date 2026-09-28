precision mediump float;			// Set the default precision to medium. We don't need as high of a precision in the fragment shader.

uniform lowp sampler2D u_Texture;	// The input texture.
uniform lowp sampler2D u_alpha;		// The alpha image
varying lowp vec4 v_Color;			// This is the color from the vertex shader interpolated across the triangle per fragment.
varying vec2 v_TexCoordinate;		// Interpolated texture coordinate per fragment.

uniform lowp sampler2D u_MaskTexture;
uniform float u_Factor;
uniform vec3 u_TargetColor;

//same as frag_masking, but with offset and scale
//so we can adjust the placement of the image within the mask
uniform vec2 u_ImageOffset;
uniform vec2 u_ImageScale;

void main()
{	
	float clipping = texture2D(u_MaskTexture, v_TexCoordinate).r;
	
	vec2 imageUV = v_TexCoordinate * u_ImageScale + u_ImageOffset;

	vec4 textureSample = texture2D(u_Texture, imageUV);
	vec4 alphaSample = texture2D(u_alpha, imageUV);
	vec4 base = vec4(textureSample.rgb, alphaSample.a);
	
	vec4 targetColor = vec4(u_TargetColor * base.a, base.a); //premult target color

	vec4 mixedColor = mix(v_Color * base, targetColor, u_Factor);
	
	gl_FragColor = mixedColor * clipping;
}
