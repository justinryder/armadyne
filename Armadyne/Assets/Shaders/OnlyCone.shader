// Upgrade NOTE: replaced 'glstate.matrix.modelview[0]' with 'UNITY_MATRIX_MV'
// Upgrade NOTE: replaced 'glstate.matrix.mvp' with 'UNITY_MATRIX_MVP'

Shader "Custom/RelaxedconeMappping" 
{
	Properties 
	{
		
		ambient_color 	("Ambient",  Color) = (0.2, 0.2, 0.2)
		diffuse_color 	("Diffuse",  Color) = (1, 1, 1)
		specular_color 	("Specular", Color) = (0.75,0.75,0.75)
		
		shine 	("Shine", Float) = 32
		tile 	("Tile Factor", Float) = 1
		depth 	("Depth Factor", Float) = 0.1
				
		color_map 				("color_map", 2D	) = "white" {}
		relaxedcone_relief_map 	("relaxedcone", 2D	) = "white" {}
		_BumpMap                ("Normal Map", 2D ) = "bump" {}
		
		lightpos ("PointLight", Vector) = (-10, 10, -10)
	}
	
	SubShader 	
	{
		Pass
		{
		Cull Back
		AlphaTest GEqual 16
		
CGPROGRAM //-----------
#pragma target 3.0
#pragma vertex 		vertex_shader
#pragma fragment pixel_shader_relaxedcone 
#pragma profileoption MaxTexIndirections=64
#include "UnityCG.cginc"

#define DEPTH_BIAS
#define BORDER_CLAMP

float3 ambient_color;
float3 diffuse_color;
float3 specular_color;
float shine;

float tile;
float depth;
float relief_mode;
float depth_bias;
float border_clamp;

sampler2D color_map;
sampler2D relaxedcone_relief_map;
sampler2D _BumpMap;
float3 lightpos;

struct a2v 
{
	float4 vertex 		: POSITION;
	float4 tangent		: TANGENT; 
	float3 normal		: NORMAL; 
	float2 texCoord		: TEXCOORD0; 
};

struct v2f
{
	float4 hpos		: POSITION;
	float3 eye		: TEXCOORD0;
	float3 light	: TEXCOORD1;
	float2 texcoord : TEXCOORD2;
};

v2f vertex_shader(a2v IN) 
{ 
	v2f OUT;
	
	// vertex position IN object space
	float4 pos = float4(IN.vertex.xyz, 1.0);
	
	// vertex position IN clip space
	OUT.hpos 		= mul(UNITY_MATRIX_MVP, pos);
	
	// copy color and texture coordINates
	OUT.texcoord 	= IN.texCoord.xy*tile;;	

	// compute modelview rotation only part
	float3x3 modelviewrot	=float3x3(UNITY_MATRIX_MV);

	// tangent vectors IN view space	
	float3 IN_bINormal 		= cross( IN.normal, IN.tangent.xyz )*IN.tangent.w;	
	float3 tangent			= mul(modelviewrot,IN.tangent.xyz);
	float3 bINormal			= mul(modelviewrot,IN_bINormal.xyz);
	float3 normal			= mul(modelviewrot,IN.normal);
	float3x3 tangentspace	= float3x3(tangent,bINormal,normal);
	
	// vertex position IN view space (with model transformations)
	float3 vpos=mul(UNITY_MATRIX_MV,pos).xyz;
		
	// view and light IN tangent space
	OUT.eye=mul(tangentspace,vpos);
	
	// light position IN tangent space
	OUT.light=mul(tangentspace,lightpos.xyz-vpos);		
	//OUT.light=mul(tangentspace,glstate.light[0].position.xyz -vpos);	
	
	return OUT; 
}

// setup ray pos and dir based on view vector
// and apply depth bias and depth factor
void setup_ray(v2f IN,out float3 p,out float3 v)
{
	p = float3(IN.texcoord,0);
	v = normalize(IN.eye);
	
	v.z = abs(v.z);
	
#ifdef DEPTH_BIAS
		float db = 1.0-v.z; db*=db; db*=db; db=1.0-db*db;
		v.xy *= db;
#endif

	v.xy *= depth;
}

// do normal mapping using given texture coordinate
// tangent space phong lighting with optional border clamp
// normal X and Y stored in red and green channels
float4 normal_mapping(
	sampler2D color_map,
	sampler2D normal_map,
	float2 texcoord,
	v2f IN)
{
	// color map
	float4 color = tex2D(color_map,texcoord);
	
	// normal map
	float4 normal = tex2D(normal_map,texcoord);
	normal.xy = 2*normal.xy - 1;
	normal.y = -normal.y;
	normal.z = sqrt(1.0 - dot(normal.xy,normal.xy));

	// light and view in tangent space
	float3 l = normalize(IN.light);
	float3 v = normalize(IN.eye);

	// compute diffuse and specular terms
	float diff = saturate(dot(l,normal.xyz));
	float spec = saturate(dot(normalize(l-v),normal.xyz));

	// attenuation factor
	float att = 1.0 - max(0,l.z); 
	att = 1.0 - att*att;

	// border clamp
	float alpha=1;	
#ifdef BORDER_CLAMP
	if (texcoord.x<0) 	 alpha=0;
	if (texcoord.y<0) 	 alpha=0;
	if (texcoord.x>tile) alpha=0;
	if (texcoord.y>tile) alpha=0;
#endif

	// compute final color
	float4 finalcolor;
	finalcolor.xyz = ambient_color*color.xyz +
		att*(color.xyz*diffuse_color*diff +
		specular_color*pow(spec,shine));
	finalcolor.w = alpha;
	return finalcolor;
}

// ray intersect depth map using binary cone space leaping
// depth value stored in alpha channel (black is at object surface)
// and cone ratio stored in blue channel
void ray_intersect_relaxedcone(
	sampler2D relaxedcone_relief_map,
	inout float3 p,
	inout float3 v)
{
	const int cone_steps=15;
	const int binary_steps=5;
	
	float3 p0 = p;

	v /= v.z;
	
	float dist = length(v.xy);
	
	for( int i=0;i<cone_steps;i++ )
	{
		float4 tex = tex2D(relaxedcone_relief_map, p.xy);

		float height = saturate(tex.w - p.z);
		
		float cone_ratio = tex.z;
		
		p += v * (cone_ratio * height / (dist + cone_ratio));
	}

	v *= p.z*0.5;
	p = p0 + v;

	for( int i=0;i<binary_steps;i++ )
	{
		float4 tex = tex2D(relaxedcone_relief_map, p.xy);
		v *= 0.5;
		if (p.z<tex.w)
			p+=v;
		else
			p-=v;
	}
}


float4 pixel_shader_relaxedcone(v2f IN):COLOR
{
	float3 p,v;	
	setup_ray(IN,p,v);
	ray_intersect_relaxedcone(relaxedcone_relief_map,p,v);
	
	return normal_mapping(color_map,_BumpMap,p.xy,IN);
}

ENDCG //----------
		} // Pass 
	} // SubShader 
} // Shader
