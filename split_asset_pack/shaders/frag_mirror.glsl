precision mediump float;

uniform float u_Time;
uniform vec3 u_Resolution;

uniform lowp sampler2D u_Texture;	// The input texture.
uniform lowp sampler2D u_alpha;		// The alpha image

uniform float u_Blend;
uniform lowp sampler2D u_Pattern;

varying lowp vec4 v_Color;			// This is the color from the vertex shader interpolated across the triangle per fragment.
varying vec2 v_TexCoordinate;		// Interpolated texture coordinate per fragment.
varying vec3 v_WorldPosition;

void main()
{
	vec2 uv = v_WorldPosition.xy / u_Resolution.xy;

	float angle = 0.7;
	float nomalizedPos = cos(angle) * uv.x + sin(angle) * uv.y;

	float location = mod(u_Time * 0.4, 3.0);

	float width = 0.7;
	float softness = 1.0;
	float brightness = 0.1;
	float gloss = 1.5;

	vec4 baseColor = texture2D(u_Texture, v_TexCoordinate);
	baseColor.a = texture2D(u_alpha, v_TexCoordinate).a;
	
	vec4 color = baseColor;

	//make the color greyscale
	vec3 toGrey = vec3(0.299, 0.587, 0.114);	
	color.rgb = mix(vec3(dot(color.rgb, toGrey)), color.rgb, 0.4);
	
	float contrast = 1.2; // Contrast factor (e.g., 1.0 for no change, >1.0 for increased contrast)
	color.rgb = ((color.rgb - 0.5) * max(contrast, 0.0)) + 0.5;
	
	//pump up the blue (night time?)
	//color.rgb *= vec3(0.7, 0.9, 1.2);
	
	//pump up the pruplish red?
	color.rgb *= vec3(0.9, 0.694, 0.925);
	
	//make the color negative
	//color.rgb = (vec3(1.0) - color.rgb) * color.a;

	//make the color sepia
	//color.rgb = vec3(dot(color.rgb, vec3(0.393, 0.769, 0.189)), dot(color.rgb, vec3(0.349, 0.686, 0.168)), dot(color.rgb, vec3(0.272, 0.534, 0.131)));

	vec3 originAlpha = vec3(color.a);
	color *= v_Color;

	float normalized = 1.0 - clamp(abs((nomalizedPos - location) / width), 0.0, 1.0);
	float shinePower = smoothstep(0.0, softness*2.0, normalized);
	vec3 reflectColor = mix(vec3(1.0), color.rgb * 10.0, gloss);

	vec4 mirrorColor = vec4(color.rgb + originAlpha * (shinePower / 2.0) * brightness * reflectColor, color.a);
	
	//get the pattern color
	vec4 patternColor = texture2D(u_Pattern, uv);

	//float timeBlend = sin(u_Time * 0.5) * 0.5 + 0.5;
	
	vec4 baseDissolveColor = baseColor * step(u_Blend, patternColor) * v_Color.a;
	vec4 mirrorDissolveColor = mirrorColor * (1.0 - step(u_Blend, patternColor));
	
	//gl_FragColor = mix(baseColor, mirrorDissolveColor, timeBlend);
	gl_FragColor =  mirrorDissolveColor + baseDissolveColor;
	//gl_FragColor = vec4(timeBlend, 0, 0, 1.0);



}