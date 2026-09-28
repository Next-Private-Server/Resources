precision mediump float;			// Set the default precision to medium. We don't need as high of a precision in the fragment shader.
uniform lowp sampler2D u_Texture;	// The input texture.
varying lowp vec4 v_Color;			// This is the color from the vertex shader interpolated across the triangle per fragment.
varying vec2 v_TexCoordinate;		// Interpolated texture coordinate per fragment.

uniform vec2 u_MaxUV;
uniform float intensity;


vec3 applyGrey(vec3 color) {
	float grey = 0.21 * color.r 
		+ 0.71 * color.g 
		+ 0.07 * color.b;

	return vec3(grey, grey, grey);
}

vec3 applySepia(vec3 color) {
    float r = color.r;
    float g = color.g;
    float b = color.b;

    return vec3(
        r * 0.393 + g * 0.769 + b * 0.189,
        r * 0.349 + g * 0.686 + b * 0.168,
        r * 0.272 + g * 0.534 + b * 0.131
    );
}

void main()
{
	// --- Vignette Controls ---
	float radius = 0.45;  // Where the darkening starts
	float softness = 0.25; // How blurred the edge is
	vec3 vignetteColor = vec3(0.0, 0.0, 0.0);

	lowp vec4 textureSample = texture2D(u_Texture, v_TexCoordinate);	
	//vec3 result = applyGrey(textureSample.rgb, blackIntensity);
	vec3 result = mix(textureSample.rgb, applySepia(textureSample.rgb), intensity);

	float dist = distance(v_TexCoordinate, u_MaxUV * 0.5);
	float vignette = smoothstep(radius, radius - softness, dist);

	//vec3 finalColor = mix(vignetteColor, result, vignette);
	vec3 finalColor = result;
	
	gl_FragColor = vec4(finalColor, textureSample.a);


}
