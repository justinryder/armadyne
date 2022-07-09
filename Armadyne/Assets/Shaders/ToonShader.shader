//Modifed from 
//http://www.unifycommunity.com/wiki/index.php?title=TeamFortress2Shader

Shader "Custom/RampToonColSpec" {
    Properties {
        _Color ("Main Color", Color) = (1,1,1,1)
		_OutlineColor ("Outline Color", Color) = (0,0,0,1)
		_Outline ("Outline width", Float) = 0.01 
		_Spec ("Specular Strength", Float) = 1.0
		_Cutoff ("Alphatest Cutoff", Range(0, 1)) = 0.5
        _MainTex ("Diffuse (RGB) Alpha (A)", 2D) = "white" {}
        //_BumpMap ("NormalMap (Normal)", 2D) = "bump" {}
		_SpecMap ("Specular Color Map (RGB) Gloss (A)",2D) = "gray" {}
        _RampTex ("Toon Ramp (RGB)", 2D) = "white" {}
    }	
		
    SubShader
	{
        Tags 
		{"RenderType" = "Opaque" }
		
		CGINCLUDE
			struct Input
			{
				float2 uv_MainTex : TEXCOORD0;
				float4 pos : SV_POSITION;
				float4 color : COLOR;
				//INTERNAL_DATA
			};
		   
		   //surface output structure without unity structure
		   struct MySurfaceOutput 
		   {
				half3 Albedo;
				half3 Normal;
				half3 GlossColor;
				half3 Emission;
				half Specular;
				half Gloss;
				half Alpha;
			};
			
		ENDCG
			
        CGPROGRAM
            #pragma surface surf RAMP alphatest:_Cutoff
            #pragma target 3.0
			
            uniform float4 _Color;
			uniform float _Spec;
			sampler2D _MainTex, _RampTex,_SpecMap;
			
			void surf (Input IN, inout MySurfaceOutput o)
            {
                o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb * _Color.rgb;
				
                o.Alpha = tex2D(_MainTex, IN.uv_MainTex).a * _Color.a;
				
                //o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_MainTex));
				
				float4 specInfo = tex2D(_SpecMap,IN.uv_MainTex);
				o.GlossColor = specInfo.rgb;
				
				//make this a slider for power
                o.Specular = _Spec;
				
				//tightness of gloss
                o.Gloss = specInfo.a;
            }
					
			half4 LightingRAMP_PrePass (MySurfaceOutput wiggler, half4 light)
			{
					half3 spec = light.a * wiggler.GlossColor * wiggler.Gloss;
					half d = Luminance(light.rgb) * 0.9;//Change this perhaps
					half3 ramp = tex2D (_RampTex, float2(d,d)).rgb;

					half4 c;
					c.rgb = wiggler.Albedo * light.rgb * ramp + (light.rgb * spec.rgb);
					c.a = wiggler.Specular;//flip???
					return c;
			}
			
			inline fixed4 LightingRAMP (MySurfaceOutput s, fixed3 lightDir, fixed3 viewDir, fixed atten)
            {
                fixed3 h = normalize (lightDir + viewDir);
               
                fixed NdotL = dot(s.Normal, lightDir) * 0.5 + 0.5;
                fixed3 ramp = tex2D(_RampTex, float2(NdotL * atten)).rgb;
               
                float nh = max (0, dot (s.Normal, h));
                float spec = pow (nh, s.Gloss * 128) * s.Specular;
               
                fixed4 c;
                c.rgb = ((s.Albedo * ramp * _LightColor0.rgb + _LightColor0.rgb * spec) * (atten * 2));
                c.a = s.Alpha;
                return c;
            }
	  
        ENDCG
		
		Blend SrcAlpha OneMinusSrcAlpha // Normal
		//Blend One One // Additive
		//Blend One OneMinusDstColor // Soft Additive
        //Blend DstColor Zero // Multiplicative
        //Blend DstColor SrcColor // 2x Multiplicative
		Cull Front

			
		CGPROGRAM
			#pragma surface surfCustom WORMS vertex:vert
			#pragma target 3.0
				
			float _Outline;
			float4 _OutlineColor;
			
			void surfCustom (Input IN, inout MySurfaceOutput o)
			{
				o.Albedo = _OutlineColor;
				o.Alpha = _OutlineColor.a;
			}
			
			void vert (inout appdata_full v) 
			{
				v.vertex.xyz += v.normal * _Outline;
			}
					
			half4 LightingWORMS_PrePass (MySurfaceOutput wiggler, half4 light)
			{
				return _OutlineColor;
			}
		ENDCG
    }
	Fallback "Specular"
}