precision mediump float;            // Set the default precision to medium. We don't need as high of a precision in the fragment shader.

uniform lowp sampler2D u_Texture;    // The input texture.
uniform lowp sampler2D u_alpha;        // The alpha image
varying lowp vec4 v_Color;            // This is the color from the vertex shader interpolated across the triangle per fragment.
varying vec2 v_TexCoordinate;        // Interpolated texture coordinate per fragment.

uniform lowp sampler2D u_TextureFlippyOrange;
uniform lowp sampler2D u_TextureFlippyAlphaOrange;
uniform lowp sampler2D u_TextureFlippyYellow;
uniform lowp sampler2D u_TextureFlippyAlphaYellow;

uniform int u_isOrange;

uniform vec4 u_ClipRect;

float getClipping(vec2 position, vec4 clipRect)
{
    vec2 inside = step(clipRect.xy, position.xy) * step(position.xy, clipRect.zw);
    return inside.x * inside.y;
}

void main()
{
    float clipping = getClipping(gl_FragCoord.xy, u_ClipRect);

    float alpha = 0.0;
    lowp vec4 final = vec4(0.0, 0.0, 0.0, 0.0);
	
	if(u_isOrange == 1){
		alpha = texture2D(u_TextureFlippyAlphaOrange, v_TexCoordinate).a;
		final = texture2D(u_TextureFlippyOrange, v_TexCoordinate) * v_Color * alpha;
	} else {
		alpha = texture2D(u_TextureFlippyAlphaYellow, v_TexCoordinate).a;
		final = texture2D(u_TextureFlippyYellow, v_TexCoordinate) * v_Color * alpha;
	}
    
    gl_FragColor = vec4(final.rgb, alpha) * clipping;
}