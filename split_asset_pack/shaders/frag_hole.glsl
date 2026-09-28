precision mediump float;

uniform vec2 u_Resolution;

uniform vec2 u_HolePos;
uniform float u_HoleRadius;

uniform lowp sampler2D u_Texture;	// The input texture.
uniform lowp sampler2D u_alpha;		// The alpha image

varying lowp vec4 v_Color;			// This is the color from the vertex shader interpolated across the triangle per fragment.
varying vec2 v_TexCoordinate;		// Interpolated texture coordinate per fragment.
varying vec3 v_WorldPosition;

void main()
{
	// render a circle at the given position and account for stretching
	vec2 uv = gl_FragCoord.xy / u_Resolution.xy;
	
	// account for stretching
	uv.x *= u_Resolution.x / u_Resolution.y;
	uv.x += (1.0 - u_Resolution.x / u_Resolution.y) / 2.0;

	vec2 fixedHolePos = u_HolePos;
	fixedHolePos.x *= u_Resolution.x / u_Resolution.y;
	fixedHolePos.x += (1.0 - u_Resolution.x / u_Resolution.y) / 2.0;

	//flip y
	uv.y = 1.0 - uv.y;

	float distance = length(uv - fixedHolePos);

	float alpha = smoothstep(u_HoleRadius, u_HoleRadius + 0.01, distance);
	vec4 color = texture2D(u_Texture, v_TexCoordinate);

	//render a white border on the edge of the hole
	float borderWidth = 0.03;
	vec3 borderColor = color.rgb * 2.0 * alpha; //brighten
	//vec3 borderColor = vec3(1.0) * alpha; //white
	//vec3 borderColor = vec3(0.0) * alpha; //black


	float border = 1.0 - smoothstep(u_HoleRadius, u_HoleRadius + borderWidth, distance); //smooth border
	//float border = 1.0 - step(u_HoleRadius + borderWidth, distance); //hard border
	color.rgb = mix(color.rgb, borderColor, border);

	//fade color as we get further away to make it appear lit
	color = mix(color, vec4(0.0, 0.0, 0.0, 1.0), distance * distance);

	gl_FragColor = vec4(color.rgb, alpha);
}