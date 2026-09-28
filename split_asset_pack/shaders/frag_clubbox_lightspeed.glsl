precision mediump float;

uniform lowp sampler2D u_Texture;
varying vec2 v_TexCoordinate;

uniform float u_Offset;
uniform float u_Brightness;
uniform float u_Speed;
uniform float u_Time;
uniform vec2 u_Resolution;

float noise(vec2 p) 
{
    return fract(sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453);
}

vec2 rotatePos(vec2 pos, float angle)
{
	float cosA = cos(angle);
	float sinA = sin(angle);
	vec2 rotatedPos = vec2(
    	pos.x * cosA - pos.y * sinA,
    	pos.x * sinA + pos.y * cosA
	);

	return rotatedPos;
}

void main()
{
    float rawOffset = u_Offset;   
    float speed2 = u_Speed;
    float speed = speed2 + 0.3;
    
	float brightness = u_Brightness;
    vec3 col2 = texture2D(u_Texture, v_TexCoordinate).rgb;

    if (brightness < 0.005) {
        gl_FragColor = vec4(col2, 1.0);
        return;
    }

    float offset = rawOffset * 2.0;

    vec2 uv = gl_FragCoord.xy / u_Resolution.xy;
    vec3 ray;
    ray.xy = uv * 2.0 - 1.0;
    ray.y -= 0.75;
    ray.z = 1.0;
   
    float maxAxis = max(abs(ray.x), abs(ray.y));
    vec3 stp = ray * (1.0 / maxAxis);
    vec3 pos = 2.0 * stp + 0.5;
    
    vec3 col = vec3(0.0);
    float invSpeed = 1.0 / speed;
    
    for (int i = 0; i < 10; i++)
    {   
		vec2 stepPos = pos.xy;
		//vec2 stepPos = rotatePos(pos.xy, 0.75);

        float z = noise(floor(stepPos));   
        z = fract(z - offset);
        float d = 20.0 * z - pos.z;
        
        vec2 starCenter = fract(stepPos) - 0.5;
        float distToCenter = length(starCenter);
        float w = pow(max(0.0, 1.0 - 2.0 * distToCenter), 4.5);

		//if w if to close to 0 it makes kinda ugly streaks on the x/y axis
		float threshold = 0.05; 
		if (abs(ray.x) < threshold || abs(ray.y) < threshold) {
    		w = 0.0;
		}

        vec3 c = vec3(
            1.0 - abs(d + speed2 * 0.5) * invSpeed,
            1.0 - abs(d) * invSpeed,
            1.0 - abs(d * 0.5) * invSpeed
        );
        c = max(vec3(0.0), c);
        
        col += 1.5 * (1.0 - z) * c * w;
        pos += stp;
    }
    
    vec3 finalColor = mix(col * brightness, col2, 1.0 - brightness);
    gl_FragColor = vec4(finalColor, 1.0);
}