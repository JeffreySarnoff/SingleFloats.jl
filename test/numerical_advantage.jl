#=
    These tests demonstrate the presence or abscense of advantageous relative accuracy
    using some arithmetic and elementary numerics.
=#

using Base.Math.MathConstants

setprecision(BigFloat, 128)

abserr(x, y) = abs(x - y)
relerr(x, y) = abserr(x, y) / abs(x)
geomerr(x, y) = sqrt(abserr(x,y) * relerr(x, y))

function evalerr(b32, s32, f32)
    s32err = geomerr(b32, s32)
    f32err = geomerr(b32, f32)
    result = AbstractFloat # accuracies are indistinguishable
    if s32err < f32err
        result = Single32 # Single32 is more accurate than Float32
    elseif s32err > f32err
         reult = Float32 # Float32 is more accurate than Single32 
    end
    return result
end


golden_big = BigFloat(golden)
golden_f64 = Float64(golden)
golden_f32 = Float32(golden)
golden_s32 = Single32(golden)

catalan_big = BigFloat(catalan)
catalan_f64 = Float64(catalan)
catalan_f32 = Float32(catalan)
catalan_s32 = Single32(catalan)


bigfloat = Float32( cbrt(golden_big) / sqrt(catalan_big) )
single32 = Float32( cbrt(golden_s32) / sqrt(catalan_s32) )
float32  = Float32( cbrt(golden_f32) / sqrt(catalan_f32) )

result = evalerr(bigfloat, single32, float32)
@test result == Single32


bigfloat = Float32( cos(golden_big) - (catalan_big^4) )
single32 = Float32( cos(golden_s32) - (catalan_s32^4) )
float32  = Float32( cos(golden_f32) - (catalan_f32^4) )

result = evalerr(bigfloat, single32, float32)
@test result == Single32
