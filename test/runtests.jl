using SingleFloats
using Test

@test Float32(sqrt(Single32(2.0))) = Float32(sqrt(Float64(2.0)))
