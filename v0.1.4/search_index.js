var documenterSearchIndex = {"docs": [

{
    "location": "#",
    "page": "Overview",
    "title": "Overview",
    "category": "page",
    "text": ""
},

{
    "location": "#SingleFloats.jl-1",
    "page": "Overview",
    "title": "SingleFloats.jl",
    "category": "section",
    "text": ""
},

{
    "location": "Examples/#",
    "page": "Examples",
    "title": "Examples",
    "category": "page",
    "text": ""
},

{
    "location": "Examples/#Examples-1",
    "page": "Examples",
    "title": "Examples",
    "category": "section",
    "text": "using SingleFloats\n\nfwdxs(::Type{T}) where T  = T.(collect(1.0:20.0))\nfwdys(::Type{T}) where T  = cot.(fwdxs(T))\nfwdsum(::Type{T}) where T = sum(fwdys(T))\n\nrevxs(::Type{T}) where T  = reverse(fwdxs(T))\nrevys(::Type{T}) where T  = cot.(revxs(T))\nrevsum(::Type{T}) where T = sum(revys(T))\n\nfunction muddybits(::Type{T}) where T\n   fwd = fwdsum(T)\n   rev = revsum(T)\n   epsavg = eps((fwd + rev)/2)\n   muddy = round(Int32, abs(fwd - rev) / epsavg)\n   lsbits = 31 - leading_zeros(muddy)\n   return max(0, lsbits)\nend\n\n\n(Single32 = muddybits(Single32),\n Float32  = muddybits(Float32),\n Float64  = muddybits(Float64))\n\n(Single32 = 0, Float32 = 6, Float64 = 7)using SingleFloats, LinearAlgebra, Random\nRandom.seed!(7865);\n\nmat_f32 = rand(Float32, 7, 7);\nmat_s32 = Single32.(mat_f32);\nmat_big  = BigFloat.(mat_f32);\n\ndetinv_big = Float32(det(inv(mat_big)));\ndetinv_f32 = det(inv(mat_f32));\ndetinv_s32 = det(inv(mat_s32));\n\njulia> (detinv_big - detinv_f32), (detinv_big - Float32.(detinv_s32))\n(1.5258789f-5, 0.0f0)"
},

]}
