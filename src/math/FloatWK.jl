import Base.Operators: +, -, *, /, \, %, √, ÷
import Base.Math: ^, sqrt, cbrt, ∛, div, rem, fld, mod, cld, hypot, min, max, minmax, rad2deg, deg2rad, mod2pi, rem2pi
import Base: abs, abs2, sign, copysign, flipsign, floor, ceil, trunc, round, divrem, fldmod, clamp

# unary
for Op in (:+, :-, :sqrt, :cbrt, :rad2deg, :deg2rad, :mod2pi, :rem2pi, :abs, :abs2, :sign, :floor, :ceil, :trunc, :round)
    @eval $Op(x::FloatWK) = FloatWK($Op(Float64(x)))
end
# binary
for Op in (:+, :-, :*, :/, :\, :^, :div, :rem, :fld, :mod, :cld, :hypot, :min, :max, :minmax, :divrem, :fldmod, :copysign, :flipsign)
    @eval $Op(x::FloatWK, y::FloatWK) = FloatWK($Op(Float64(x), Float64(y)))
end
# trinary
for Op in (:clamp,)
    @eval $Op(x::FloatWK, y::FloatWK, z::FloatWK) = FloatWK($Op(Float64(x), Float64(y), Float64(z)))
end
