Shader "Custom/Posterize" {
    Properties {
        _Color ("Main Color", Color) = (1,1,1,1)
		_OutlineColor ("Outline Color", Color) = (0,0,0,1)
		_Outline ("Outline width", Float) = 0.01 
		_LightMulti ("Lighting Multiplier", Float) = 1.0
		_LightOn ("Mix Lighting",Range(0,1)) = 0
		_Cutoff ("Alphatest Cutoff", Range(0, 1)) = 0.5
        _MainTex ("Diffuse (RGB) Alpha (A)", 2D) = "white" {}
        _GradientTex ("Posterize Gradient (RGB)", 2D) = "white" {}
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
            #pragma surface surf Plight alphatest:_Cutoff
            #pragma target 3.0
			
            uniform float4 _Color,_OutlineColor;
			uniform float _LightMulti,_LightOn;
			sampler2D _MainTex, _GradientTex;
			
			float RGBToLuminanceCheap (float4 color)
			{
			   float4 lumCoeff = float4(0.299,0.587,0.114,0.0);
			   float luminance = dot(color, lumCoeff);
			   return luminance;
			}
			
			void surf (Input IN, inout MySurfaceOutput o)
            {
                o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb * _Color.rgb;
				
                o.Alpha = tex2D(_MainTex, IN.uv_MainTex).a * _Color.a;
            }
			
		
			inline half4 LightingPlight_PrePass (MySurfaceOutput wiggler, half4 light)
			{
					float lumValue = RGBToLuminanceCheap(light);
					
					lumValue = clamp(lumValue,0.01,.99);
					
					half3 post = tex2D (_GradientTex, float2(lumValue,0.0));
					
					half4 c;
					
					if(_LightOn > .5)
						c.rgb = wiggler.Albedo * post * (light.rgb * _LightMulti);
					else
						c.rgb = wiggler.Albedo * post;
					c.a = 0.0;
					return c;
			}
			
			inline half4 LightingPlight (MySurfaceOutput wiggler, fixed3 lightDir, fixed3 viewDir, fixed atten)
            {
			
					#ifndef USING_DIRECTIONAL_LIGHT
					lightDir = normalize(lightDir);
					#endif

					float lumValue = RGBToLuminanceCheap(_LightColor0);
					
					lumValue = clamp(lumValue,0.01,.99);
					
					half3 post = tex2D (_GradientTex, float2(lumValue,0.0));
					
					half4 c;
					
					c.rgb = wiggler.Albedo * post * _LightColor0.rgb * (atten * 2);
					c.a = 0.0;
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
				
			
			half4 LightingWORMS (MySurfaceOutput s, fixed3 lightDir, fixed3 viewDir, fixed atten)
			{
				return _OutlineColor;
			}
			
			half4 LightingWORMS_PrePass (MySurfaceOutput wiggler, half4 light)
			{
				return _OutlineColor;
			}
		ENDCG
    }
	Fallback "Specular"
}