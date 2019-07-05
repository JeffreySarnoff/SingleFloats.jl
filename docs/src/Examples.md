# Examples

```julia
julia> using SingleFloats, LinearAlgebra, Random
julia> Random.seed!(7865)
julia> mat_f32 = rand(Float32, 100, 100);
julia> mat_s32 = Single32.(mat_f32);
julia> mat_bf  = BigFloat.(mat_f32);
julia> detinv = Float32(det(inv(mat_bf)));
julia> detinv_f32 = det(inv(mat_f32));
julia> detinv_s32 = det(inv(mat_s32));
julia> detinv - det_f32, detinv - det_s32

using SingleFloats, LinearAlgebra, Random
Random.seed!(7865);
mat_f32 = rand(Float32, 100, 100);
mat_s32 = Single32.(mat_f32);
mat_bf  = BigFloat.(mat_f32);
detinv = Float32(det(inv(mat_bf)));
detinv_f32 = det(inv(mat_f32));
detinv_s32 = det(inv(mat_s32));
detinv - detinv_f32, detinv - detinv_s32

(detinv - detinv_f32)/detinv, (detinv - detinv_s32)/detinv
(3.4411963f-7, 1.8847325f-8)

eps(1.0f0)
1.1920929f-7


julia> mat_f32 = rand(Float32, 7, 7);
julia> mat_s32 = Single32.(mat_f32);
julia> mat_bf  = BigFloat.(mat_f32);
julia> detinv = Float32(det(inv(mat_bf)));
julia> detinv_f32 = det(inv(mat_f32));
julia> detinv_s32 = det(inv(mat_s32));
julia> (detinv - detinv_f32)/detinv, (detinv - detinv_s32)/detinv
(-9.082436f-8, -1.1799976f-8)
julia>  round(Int, 100*ans[1]/ans[2])/100
7.7
