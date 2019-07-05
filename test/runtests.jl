using SingleFloats
using Test

@test Float64(sqrt(Single32(2))_ == sqrt(2.0)
@test Float32(sqrt(Single32(2.0))) == Float32(sqrt(Float64(2.0)))

@test sum(cot.(Single32.(collect(1.0:20)))) == sum(cot.(reverse(Single32.(collect(1.0:20)))))
