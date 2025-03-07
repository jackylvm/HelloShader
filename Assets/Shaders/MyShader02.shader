// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Jacky/MyShader02"
{
    Properties {}
    SubShader
    {
        Pass
        {
            CGPROGRAM
            // 顶点函数
            // 作用是: 将顶点坐标从模型空间转换到裁剪空间,从顶点着色器传递到片元着色器,从游戏环境转换到视野相机屏幕
            #pragma vertex vert
            // 片元函数
            // 作用是: 返回模型对应的屏幕上的每个像素的颜色
            #pragma fragment frag

            // 顶点输入结构体,application to vertex:从应用到顶点
            struct a2v
            {
                // POSITION 语义: 顶点位置
                float4 vertex : POSITION; // 顶点位置
                float3 normal : NORMAL; // 法线方向
                float4 texcoord : TEXCOORD0; // 纹理坐标
            };

            // 顶点输出结构体,vertex to fragment:从顶点到片元
            struct v2f
            {
                // SV_POSITION 语义: 返回值,说明返回值是剪裁空间下的顶点坐标
                float4 pos:SV_POSITION; // 顶点位置
                float3 normal : NORMAL; // 法线方向
                float3 color : COLOR; // 颜色
            };

            // 顶点函数
            // 顶点函数返回顶点
            v2f vert(a2v v)
            {
                v2f o;
                // UnityObjectToClipPos等同于mul(UNITY_MATRIX_MVP, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                o.normal = v.normal;
                o.color = v.normal * 0.5 + fixed3(0.5, 0.5, 0.5);
                return o;
            }

            // 片元函数
            // 片元函数返回颜色
            fixed4 frag(v2f f) : SV_Target
            {
                return fixed4(f.color, 1.0);
                // return fixed4(f.normal, 1.0);
                // return fixed4(1.0, 1.0, 1.0, 1.0);
            }
            ENDCG
        }
    }
    Fallback "Diffuse"
}