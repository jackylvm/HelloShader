Shader "Jacky/MyShader01"
{
    Properties
    {
        _Color("Color",Color)=(1,1,1,1)
        _Vector("Vector",Vector)=(1,2,3,4)
        _Int("Int",Int)=1234
        _Float("Float",Float)=1234.5678
        _Range("Range",Range(0,10))=5
        _2D("2D",2D)="white"{}
        _Texture("Texture",2D)="white"{}
        _Cube("Cube",Cube)="white"{}
        _3D("3D",3D)="white"{}
    }
    SubShader
    {
        Pass
        {
            CGPROGRAM
            float4 _Color;
            float4 _Vector;
            int _Int;
            float _Float;
            float _Range;
            sampler2D _2D;
            sampler2D _Texture;
            samplerCUBE _Cube;
            sampler3D _3D;
            ENDCG
        }
    }
    Fallback "Diffuse"
}