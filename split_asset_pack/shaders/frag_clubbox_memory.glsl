precision mediump float;			// Set the default precision to medium. We don't need as high of a precision in the fragment shader.
uniform lowp sampler2D u_Texture;	// The input texture.
varying lowp vec4 v_Color;			// This is the color from the vertex shader interpolated across the triangle per fragment.
varying vec2 v_TexCoordinate;		// Interpolated texture coordinate per fragment.

uniform vec2 u_MaxUV;
uniform float u_Intensity;
uniform float u_Time;
uniform vec2 u_Resolution;
uniform float u_Random;

#define CURVE 
#define SCANS
#define DIRTY
#define VIG
#define VIG_FLICKER
//#define CHROMA

float FREQUENCY = 12.0;

// Generates a pseudo-random float between 0.0 and 1.0 based on a 2D coordinate
float rand2d(vec2 co) 
{
	return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}


// Simulate the physical bulge of a CRT glass monitor
vec2 uv_curve(vec2 uv) 
{
	uv = (uv - 0.5) * 2.0;
	uv *= 1.2;	
	uv.x *= 1.0 + pow((abs(uv.y) / 5.0), 2.0);
	uv.y *= 1.0 + pow((abs(uv.x) / 4.0), 2.0);
    uv /= 1.15;
	uv  = (uv / 2.0) + 0.5;
	return uv;
}

// sampleUV: texture space [0..u_MaxUV]
// curvedUV: screen space [0..1] after warp
vec3 chromaticAberration(
    sampler2D tex,
    vec2 sampleUV,
    vec2 curvedUV,
    float amount
){
    vec2 center = vec2(0.5);
    vec2 dir = normalize(curvedUV - center);
    float dist = distance(curvedUV, center);

    // offset defined in screen space, converted to texture space
    vec2 offsetScreen = dir * amount * dist;
    vec2 offsetSample = offsetScreen * u_MaxUV;

    float r = texture2D(tex, sampleUV + offsetSample).r;
    float g = texture2D(tex, sampleUV).g;
    float b = texture2D(tex, sampleUV - offsetSample).b;

    return vec3(r, g, b);
}

// vec3 blur4(sampler2D tex, vec2 uv, vec2 texel)
// {
//     return (
//         texture2D(tex, uv + texel * vec2( 1.0,  0.0)).rgb +
//         texture2D(tex, uv + texel * vec2(-1.0,  0.0)).rgb +
//         texture2D(tex, uv + texel * vec2( 0.0,  1.0)).rgb +
//         texture2D(tex, uv + texel * vec2( 0.0, -1.0)).rgb
//     ) * 0.25;
// }


void main()
{
    float t = float(int(u_Time * FREQUENCY));
    
    vec2 uv = v_TexCoordinate / u_MaxUV;
	
#ifdef CURVE
    uv = uv_curve(uv);

	if (uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0 || uv.y > 1.0) 
	{
		vec4 BORDER_COLOR = vec4(0.05, 0.05, 0.1, 1.0);
        gl_FragColor = BORDER_COLOR;
        return; 
    }
#endif

	vec2 sampleUV = uv * u_MaxUV;
                   
    float falloff = (uv.x * (1.0-uv.x) * uv.y * (1.0-uv.y));

#ifdef CHROMA	
	float edgeMask = 1.0 - smoothstep(0.0, 1.0, falloff * 20.0);
	float shift = edgeMask * 0.01;
	//shift *= 0.5 + 0.5 * sin(u_Time * 2.0);
	vec3 color = chromaticAberration(u_Texture, sampleUV, uv, shift); 
#else
	vec3 color = texture2D(u_Texture, sampleUV).rgb;
#endif    

#ifdef SCANS
	float scanline = sin(uv.y * u_Resolution.y) * 0.1;
    color -= scanline * 0.5;
#endif
        
#ifdef VIG
	float vig = falloff * 44.0;
#ifdef VIG_FLICKER	
	float flicker = mix(0.8, 0.9, u_Random);
	vig *= flicker;
#endif	
	float smoothVig = smoothstep(0.0, 1.0, vig);
	color *= mix(0.6, 1.0, smoothVig);	
#endif
     
#ifdef DIRTY
    color *= 1.0 + rand2d(uv + t * .01) * 0.2;	
#endif

    gl_FragColor = vec4(color, 1.0);
}
