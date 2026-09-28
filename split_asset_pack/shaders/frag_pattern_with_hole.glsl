precision mediump float;

uniform lowp sampler2D u_Texture;	// The input texture.
uniform lowp sampler2D u_alpha;		// The alpha image

uniform vec4 u_ClipRect;
uniform float u_Time;
uniform float u_dX;
uniform float u_dY;
uniform vec4 u_TexParams;

uniform vec2 u_Resolution;

uniform vec2 u_HolePos;
uniform float u_HoleRadius;

varying lowp vec4 v_Color;			// This is the color from the vertex shader interpolated across the triangle per fragment.
varying vec2 v_TexCoordinate;		// Interpolated texture coordinate per fragment.

float getClipping(vec2 position, vec4 clipRect)
{
	vec2 inside = step(clipRect.xy, position.xy) * step(position.xy, clipRect.zw);
	return inside.x * inside.y;
}

void main()
{
	float clipping = getClipping(gl_FragCoord.xy, u_ClipRect);

	vec2 aspect = u_TexParams.xy / u_Resolution;

	vec2 texCoord = (v_TexCoordinate / aspect) * u_TexParams.zw;

	texCoord.xy -= v_TexCoordinate.xy + 100.0*(u_Time/60.0) * vec2(u_dX, u_dY);
	
	vec2 hole_uv = gl_FragCoord.xy / u_Resolution.xy;
	
	// account for stretching
	hole_uv.x *= u_Resolution.x / u_Resolution.y;
	hole_uv.x += (1.0 - u_Resolution.x / u_Resolution.y) / 2.0;

	vec2 fixedHolePos = u_HolePos;
	fixedHolePos.x *= u_Resolution.x / u_Resolution.y;
	fixedHolePos.x += (1.0 - u_Resolution.x / u_Resolution.y) / 2.0;

	//flip y
	hole_uv.y = 1.0 - hole_uv.y;

	float distance = length(hole_uv - fixedHolePos);
	float holeAlpha = smoothstep(u_HoleRadius, u_HoleRadius + 0.01, distance);
	
	lowp vec4 color = texture2D(u_Texture, texCoord);
	color.a = texture2D(u_alpha, texCoord).a;
	
	//the border makes the ring seem a bit more opaque and less like a glow
	//float borderWidth = 0.05; //slightly thinker than glow border
	//float border = smoothstep(u_HoleRadius, u_HoleRadius + borderWidth, distance); //smooth border
	//float border = 1.0 - step(u_HoleRadius + borderWidth, distance); //hard border - this is neat it makes a cool 3d ring effect	
	//float border = step(u_HoleRadius + borderWidth, distance); // hard border
	//holeAlpha = holeAlpha * border;


	//fade color as we get further away to make it appear lit
	color = mix(color, vec4(0.0, 0.0, 0.0, 1.0), distance * distance);
	
	//gl_FragColor = v_Color * vec4(color.rgb, holeAlpha) * clipping;
	gl_FragColor = v_Color * color * holeAlpha * clipping;
}