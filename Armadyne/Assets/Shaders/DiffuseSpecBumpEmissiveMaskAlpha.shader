Shader "DiffuseSpecEmissive"
{
	Properties 
	{
_MainTex("Base (RGB) Alpha (A)", 2D) = "white" {}
_BumpMap("Normalmap", 2D) = "bump" {}
_EmissionStrength("Overall Emissive power", Float) = 0
_EmissiveMap("Color (RGB) Strength (A)", 2D) = "black" {}
_GlossStrength("Shininess", Float) = 0
_GlossMap("_GlossMap", 2D) = "white" {}
_MaskingStrength("_MaskingStrength", Float) = 0
_GlossMask("_GlossMask", 2D) = "black" {}
_HighlightTightnes("_HighlightTightnes", Float) = 0
_SpecularMap("_SpecularMap", 2D) = "black" {}

	}
	
	SubShader 
	{
		Tags
		{
"Queue"="Geometry"
"IgnoreProjector"="False"
"RenderType"="Opaque"

		}

		
Cull Off
ZWrite On
ZTest LEqual
ColorMask RGBA
Fog{
}


		CGPROGRAM
#pragma surface surf BlinnPhongEditor  vertex:vert
#pragma target 2.0


sampler2D _MainTex;
sampler2D _BumpMap;
float _EmissionStrength;
sampler2D _EmissiveMap;
float _GlossStrength;
sampler2D _GlossMap;
float _MaskingStrength;
sampler2D _GlossMask;
float _HighlightTightnes;
sampler2D _SpecularMap;

			struct EditorSurfaceOutput {
				half3 Albedo;
				half3 Normal;
				half3 Emission;
				half3 Gloss;
				half Specular;
				half Alpha;
				half4 Custom;
			};
			
			inline half4 LightingBlinnPhongEditor_PrePass (EditorSurfaceOutput s, half4 light)
			{
half3 spec = light.a * s.Gloss;
half4 c;
c.rgb = (s.Albedo * light.rgb + light.rgb * spec);
c.a = s.Alpha;
return c;

			}

			inline half4 LightingBlinnPhongEditor (EditorSurfaceOutput s, half3 lightDir, half3 viewDir, half atten)
			{
				half3 h = normalize (lightDir + viewDir);
				
				half diff = max (0, dot ( lightDir, s.Normal ));
				
				float nh = max (0, dot (s.Normal, h));
				float spec = pow (nh, s.Specular*128.0);
				
				half4 res;
				res.rgb = _LightColor0.rgb * diff;
				res.w = spec * Luminance (_LightColor0.rgb);
				res *= atten * 2.0;

				return LightingBlinnPhongEditor_PrePass( s, res );
			}
			
			struct Input {
				float2 uv_MainTex;
float2 uv_BumpMap;
float2 uv_EmissiveMap;
float2 uv_GlossMap;
float2 uv_GlossMask;
float2 uv_SpecularMap;

			};

			void vert (inout appdata_full v, out Input o) {
float4 VertexOutputMaster0_0_NoInput = float4(0,0,0,0);
float4 VertexOutputMaster0_1_NoInput = float4(0,0,0,0);
float4 VertexOutputMaster0_2_NoInput = float4(0,0,0,0);
float4 VertexOutputMaster0_3_NoInput = float4(0,0,0,0);


			}
			

			void surf (Input IN, inout EditorSurfaceOutput o) {
				o.Normal = float3(0.0,0.0,1.0);
				o.Alpha = 1.0;
				o.Albedo = 0.0;
				o.Emission = 0.0;
				o.Gloss = 0.0;
				o.Specular = 0.0;
				o.Custom = 0.0;
				
float4 Tex2D0=tex2D(_MainTex,(IN.uv_MainTex.xyxy).xy);
float4 Tex2DNormal0=float4(UnpackNormal( tex2D(_BumpMap,(IN.uv_BumpMap.xyxy).xy)).xyz, 1.0 );
float4 Tex2D1=tex2D(_EmissiveMap,(IN.uv_EmissiveMap.xyxy).xy);
float4 Multiply1=Tex2D1 * Tex2D1.aaaa;
float4 Multiply0=Multiply1 * _EmissionStrength.xxxx;
float4 Tex2D2=tex2D(_GlossMap,(IN.uv_GlossMap.xyxy).xy);
float4 Tex2D3=tex2D(_GlossMask,(IN.uv_GlossMask.xyxy).xy);
float4 Add2_1_NoInput = float4(0,0,0,0);
float4 Add2=Tex2D3 + Add2_1_NoInput;
float4 Add0=Add2 + _MaskingStrength.xxxx;
float4 Multiply3=_GlossStrength.xxxx * Add0;
float4 Multiply2=Tex2D2 * Multiply3;
float4 Tex2D4=tex2D(_SpecularMap,(IN.uv_SpecularMap.xyxy).xy);
float4 Add1_1_NoInput = float4(0,0,0,0);
float4 Add1=Tex2D4 + Add1_1_NoInput;
float4 Multiply4=Add1 * _HighlightTightnes.xxxx;
float4 Master0_7_NoInput = float4(0,0,0,0);
float4 Master0_6_NoInput = float4(1,1,1,1);
o.Albedo = Tex2D0;
o.Normal = Tex2DNormal0;
o.Emission = Multiply0;
o.Specular = Multiply2;
o.Gloss = Multiply4;
o.Alpha = Tex2D0.aaaa;

				o.Normal = normalize(o.Normal);
			}
		ENDCG
	}
	Fallback "Diffuse"
}