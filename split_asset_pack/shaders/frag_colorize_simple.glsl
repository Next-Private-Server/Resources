precision mediump float;			// Set the default precision to medium. We don't need as high of a precision in the fragment shader.
uniform lowp sampler2D u_Texture;	// The input texture.
uniform lowp sampler2D u_alpha;		// The alpha image
varying lowp vec4 v_Color;			// This is the color from the vertex shader interpolated across the triangle per fragment.

varying vec2 v_TexCoordinate;		// Interpolated texture coordinate per fragment.

uniform vec4 u_ClipRect; // = vec4(100, 100, 200, 200); // clip is in viewport space; y = 0 is bottom of screen 


float getClipping(vec2 position, vec4 clipRect)
{
	vec2 inside = step(clipRect.xy, position.xy) * step(position.xy, clipRect.zw);
	return inside.x * inside.y;
}

// Just use the color from the vertex shader, multiplied by the alpha texture.

void main()
{
	float clipping = getClipping(gl_FragCoord.xy, u_ClipRect);

	vec4 alphaSample = texture2D(u_alpha, v_TexCoordinate);

	gl_FragColor = v_Color * alphaSample.a * clipping;
}
