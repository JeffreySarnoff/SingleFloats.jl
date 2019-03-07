import Base: cmp, ==, !=, >=, >, <=, <, isless, isequal
import Base: +, -, *, /, \, %, √, ÷
import Base.Math: ^, sqrt, cbrt, ∛, div, rem, fld, mod, cld, hypot, min, max, minmax, rad2deg, deg2rad, mod2pi, rem2pi
import Base: abs, abs2, sign, copysign, flipsign, floor, ceil, trunc, round, divrem, fldmod, clamp

# comparisons
for Op in (:cmp, :(==), :(!=), :(>=), :(<=), :(>), :(<), :isless, :isequal)
    @eval begin
        $Op(x::FloatWK, y::FloatWK) = FloatWK($Op(Float64(x), Float64(y)))
        $Op(x::FloatWK, y::Float64) = FloatWK($Op(Float64(x), y))
        $Op(x::Float64, y::FloatWK) = FloatWK($Op(x, Float64(y)))
        $Op(x::FloatWK, y::Float32) = FloatWK($Op(Float64(x), Float64(y)))
        $Op(x::Float32, y::FloatWK) = FloatWK($Op(Float64(x), Float64(y)))
        $Op(x::FloatWK, y::Float16) = FloatWK($Op(Float64(x), Float64(y)))
        $Op(x::Float16, y::FloatWK) = FloatWK($Op(Float64(x), Float64(y)))
        $Op(x::FloatWK, y::BigFloat) = FloatWK($Op(Float64(x), Float64(y)))
        $Op(x::BigFloat, y::FloatWK) = FloatWK($Op(Float64(x), Float64(y)))
        $Op(x::FloatWK, y::Int64) = FloatWK($Op(Float64(x), Float64(y)))
        $Op(x::Int64, y::FloatWK) = FloatWK($Op(Float64(x), Float64(y)))
        $Op(x::FloatWK, y::Int32) = FloatWK($Op(Float64(x), Float64(y)))
        $Op(x::Int32, y::FloatWK) = FloatWK($Op(Float64(x), Float64(y)))
        $Op(x::FloatWK, y::Int16) = FloatWK($Op(Float64(x), Float64(y)))
        $Op(x::Int16, y::FloatWK) = FloatWK($Op(Float64(x), Float64(y)))
        $Op(x::FloatWK, y::Int128) = FloatWK($Op(Float64(x), Float64(y)))
        $Op(x::Int128, y::FloatWK) = FloatWK($Op(Float64(x), Float64(y)))
    end
end

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
