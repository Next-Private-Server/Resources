//Render a full screen quad with a glitch effect based on progress (0.0 - 1.0)
#version 100
precision mediump float;

uniform lowp sampler2D u_Texture;	// The input texture.
uniform lowp sampler2D u_alpha;		// The alpha image
varying lowp vec4 v_Color;			// This is the color from the vertex shader interpolated across the triangle per fragment.
varying vec2 v_TexCoordinate;		// Interpolated texture coordinate per fragment.

uniform float u_Time;
uniform float u_Progress;
uniform lowp sampler2D u_GlitchTex; // The glitch texture
uniform float u_Steps;
uniform float u_Strength;

// Helper function for desaturate (equivalent to Unity's DesaturateOpNode)
vec3 desaturate(vec3 color, float amount) {
    float gray = dot(color, vec3(0.299, 0.587, 0.114));
    return mix(color, vec3(gray), amount);
}

void main()
{
    float SteppedProgress = floor(u_Progress * u_Steps) / u_Steps;
    
    // Animated glitch UV
    vec2 glitchUV = v_TexCoordinate * vec2(0.1, 0.25) + vec2(sin(u_Time * 3.0) * 0.01, u_Progress);
    vec4 glitchSample = texture2D(u_GlitchTex, glitchUV);
    
    // offset with horizontal bias
    vec2 offset = (vec2(glitchSample.r, glitchSample.g) - 0.5) * 0.1 * SteppedProgress;
    offset.x *= 3.0; // Stronger horizontal glitching
    
    vec2 finalUV = mix(v_TexCoordinate, v_TexCoordinate + offset, SteppedProgress);
    
	vec4 originalSample = texture2D(u_Texture, v_TexCoordinate) * v_Color;

    // RGB channel separation
    float chromatic = 0.01 * SteppedProgress;
    vec4 redSample = texture2D(u_Texture, finalUV + vec2(chromatic, 0.0));
    vec4 greenSample = texture2D(u_Texture, finalUV);
    vec4 blueSample = texture2D(u_Texture, finalUV - vec2(chromatic, 0.0));
    
    vec4 mainSample = vec4(redSample.r, greenSample.g, blueSample.b, greenSample.a) * v_Color;
    
    // Color shift
    vec4 colorShift = vec4(-0.3, 0.4, 0.2, 0.0) * SteppedProgress * SteppedProgress;
    vec4 Blit = mainSample + colorShift;
    
    // Noise
    float staticNoise = fract(sin(dot(v_TexCoordinate * 100.0, vec2(12.9898, 78.233))) * 43758.5453) * SteppedProgress;
    Blit.rgb += staticNoise * 0.1;
    
    // Desaturate
    vec3 desaturated = desaturate(Blit.rgb, Blit.r);
    vec3 stepped = step(desaturated, vec3(SteppedProgress));
    vec4 finalColor = mix(Blit, vec4(stepped, 0.0), SteppedProgress);
    
    // Quantize colors
    float colorSteps = 12.0;
    finalColor.rgb = floor(finalColor.rgb * colorSteps) / colorSteps;
    
    // Scanlines
    float scanline = sin(v_TexCoordinate.y * 800.0) * 0.05 * SteppedProgress;
    finalColor.rgb += scanline;
    
	//Mix original and glitch based on u_Strength
	finalColor = mix(originalSample, finalColor, u_Strength);

    // Output with vertex alpha
    float finalAlpha = v_Color.a;
    vec3 premultRGB = finalColor.rgb * finalAlpha;
    gl_FragColor = vec4(premultRGB, finalAlpha);
}