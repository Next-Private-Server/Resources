precision mediump float;

uniform lowp sampler2D u_Texture;
uniform lowp sampler2D u_alpha;
uniform lowp sampler2D u_RenderTexture;

varying lowp vec4 v_Color;
varying vec2 v_TexCoordinate;

uniform vec4 u_SpriteBounds; // x,y = scale, z,w = offset
uniform vec2 u_MaxUV; //RT max UVs
uniform vec4 u_AspectCorrection;

uniform vec4 u_ClipRect;

float getClipping(vec2 position, vec4 clipRect)
{
	vec2 inside = step(clipRect.xy, position.xy) * step(position.xy, clipRect.zw);
	return inside.x * inside.y;
}

void main()
{
    float clipping = getClipping(gl_FragCoord.xy, u_ClipRect);
    float alpha    = texture2D(u_alpha, v_TexCoordinate).a;

	// Calculate 0.0 to 1.0 "Local UV" of the spritesheet quad
    // This turns the sheet coordinates (e.g. 267/1024) into 0.0
    vec2 localUV = (v_TexCoordinate.xy - u_SpriteBounds.xy) / (u_SpriteBounds.zw - u_SpriteBounds.xy);

	// Apply aspect correction
    localUV = (localUV - 0.5) * u_AspectCorrection.xy + 0.5;
    
    // Scale it by MaxUV to map it to the usable Render Texture area
    vec2 rtUV = localUV * u_MaxUV;

    // Flip Y
    rtUV.y = u_MaxUV.y - rtUV.y;

    lowp vec4 final = texture2D(u_RenderTexture, rtUV) * v_Color;
	gl_FragColor = final * alpha * clipping;
}
