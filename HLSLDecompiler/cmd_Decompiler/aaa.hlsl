// ---- Created with 3Dmigoto v1.3.16 on Thu Aug 12 18:26:59 2021
Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0)
{
  float4 cb0[9];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_Target0,
  out float4 o1 : SV_Target1,
  out float oDepth : SV_Depth)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = v2.zxyw + v1.xxyy;
  r1.yz = r0.xw;
  r2.xyzw = t1.Gather(s0_s, v1.xy).wxyz;
  r0.w = cmp(r2.z < r2.y);
  r1.x = r2.z;
  r0.x = r2.y;
  r0.xyz = r0.www ? r1.xyz : r0.xyz;
  r0.w = cmp(r2.w < r0.x);
  r1.xyzw = v3.zxyw + v1.xxyy;
  r2.yz = r1.xw;
  r1.x = r2.w;
  r0.xyz = r0.www ? r1.xyz : r0.xyz;
  r0.w = cmp(r2.x < r0.x);
  r0.xyz = r0.www ? r2.xyz : r0.xyz;
  r0.w = cb0[8].x * r0.x + cb0[8].y;
  o0.xyzw = float4(1,1,1,1) / r0.wwww;
  o1.xyzw = t0.Sample(s1_s, r0.yz).xyzw;
  oDepth = r0.x;
  return;
}