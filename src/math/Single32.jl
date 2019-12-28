#=
 "abs_float"
 "add_float"
 "copysign_float"
 "div_float"
 "eq_float"
 "fma_float"
 "le_float"
 "lt_float"
 "mul_float"
 "muladd_float"
 "ne_float"
 "neg_float"
 "rem_float"
 "sub_float"
=#

const Zero_Single32 = zero(Single32)
const One_Single32 = one(Single32)

Base.eq(x::Single32, y::Single32) = Core.Intrinsics.eq_float(x, y)
Base.ne(x::Single32, y::Single32) = Core.Intrinsics.ne_float(x, y)
Base.lt(x::Single32, y::Single32) = Core.Intrinsics.lt_float(x, y)
Base.le(x::Single32, y::Single32) = Core.Intrinsics.le_float(x, y)

Base.:(==)(x::Single32, y::Single32) = Core.Intrinsics.eq_float(x, y)
Base.:(!=)(x::Single32, y::Single32) = Core.Intrinsics.ne_float(x, y)
Base.:(<)(x::Single32, y::Single32) = Core.Intrinsics.lt_float(x, y)
Base.:(<=)(x::Single32, y::Single32) = Core.Intrinsics.le_float(x, y)
Base.:(>)(x::Single32, y::Single32) = Core.Intrinsics.lt_float(y, x)
Base.:(>=)(x::Single32, y::Single32) = Core.Intrinsics.le_float(y, x)


Base.eq(x::Single32, y::Float64) = Core.Intrinsics.eq_float(x, Single32(y))
Base.ne(x::Single32, y::Float64) = Core.Intrinsics.ne_float(x, Single32(y))
Base.lt(x::Single32, y::Float64) = Core.Intrinsics.lt_float(x, Single32(y))
Base.le(x::Single32, y::Float64) = Core.Intrinsics.le_float(x, Single32(y))

Base.eq(x::Single32, y::Float32) = Core.Intrinsics.eq_float(x, Single32(y))
Base.ne(x::Single32, y::Float32) = Core.Intrinsics.ne_float(x, Single32(y))
Base.lt(x::Single32, y::Float32) = Core.Intrinsics.lt_float(x, Single32(y))
Base.le(x::Single32, y::Float32) = Core.Intrinsics.le_float(x, Single32(y))

Base.eq(x::Float64, y::Single32) = Core.Intrinsics.eq_float(Single32(x), y)
Base.ne(x::Float64, y::Single32) = Core.Intrinsics.ne_float(Single32(x), y)
Base.lt(x::Float64, y::Single32) = Core.Intrinsics.lt_float(Single32(x), y)
Base.le(x::Float64, y::Single32) = Core.Intrinsics.le_float(Single32(x), y)

Base.eq(x::Float32, y::Single32) = Core.Intrinsics.eq_float(Single32(x), y)
Base.ne(x::Float32, y::Single32) = Core.Intrinsics.ne_float(Single32(x), y)
Base.lt(x::Float32, y::Single32) = Core.Intrinsics.lt_float(Single32(x), y)
Base.le(x::Float32, y::Single32) = Core.Intrinsics.le_float(Single32(x), y)


Base.:(==)(x::Single32, y::Float64) = Core.Intrinsics.eq_float(x, Single32(y))
Base.:(!=)(x::Single32, y::Float64) = Core.Intrinsics.ne_float(x, Single32(y))
Base.:(<)(x::Single32, y::Float64) = Core.Intrinsics.lt_float(x, Single32(y))
Base.:(<=)(x::Single32, y::Float64) = Core.Intrinsics.le_float(x, Single32(y))
Base.:(>)(x::Single32, y::Float64) = Core.Intrinsics.lt_float(Single32(y), x)
Base.:(>=)(x::Single32, y::Float64) = Core.Intrinsics.le_float(Single32(y), x)

Base.:(==)(x::Single32, y::Float32) = Core.Intrinsics.eq_float(x, Single32(y))
Base.:(!=)(x::Single32, y::Float32) = Core.Intrinsics.ne_float(x, Single32(y))
Base.:(<)(x::Single32, y::Float32) = Core.Intrinsics.lt_float(x, Single32(y))
Base.:(<=)(x::Single32, y::Float32) = Core.Intrinsics.le_float(x, Single32(y))
Base.:(>)(x::Single32, y::Float32) = Core.Intrinsics.lt_float(Single32(y), x)
Base.:(>=)(x::Single32, y::Float32) = Core.Intrinsics.le_float(Single32(y), x)

Base.:(==)(x::Float64, y::Single32) = Core.Intrinsics.eq_float(Single32(x), y)
Base.:(!=)(x::Float64, y::Single32) = Core.Intrinsics.eq_float(Single32(x), y)
Base.:(<)(x::Float64, y::Single32) = Core.Intrinsics.lt_float(Single32(x), y)
Base.:(<=)(x::Float64, y::Single32) = Core.Intrinsics.le_float(Single32(x), y)
Base.:(>)(x::Float64, y::Single32) = Core.Intrinsics.lt_float(Single32(x), y)
Base.:(>=)(x::Float64, y::Single32) = Core.Intrinsics.le_float(Single32(x), y)

Base.:(==)(x::Float32, y::Single32) = Core.Intrinsics.eq_float(Single32(x), y)
Base.:(!=)(x::Float32, y::Single32) = Core.Intrinsics.eq_float(Single32(x), y)
Base.:(<)(x::Float32, y::Single32) = Core.Intrinsics.lt_float(Single32(x), y)
Base.:(<=)(x::Float32, y::Single32) = Core.Intrinsics.le_float(Single32(x), y)
Base.:(>)(x::Float32, y::Single32) = Core.Intrinsics.lt_float(Single32(x), y)
Base.:(>=)(x::Float32, y::Single32) = Core.Intrinsics.le_float(Single32(x), y)



Base.:(+)(x::Single32) = x
Base.:(-)(x::Single32) = Core.Intrinsics.neg_float(x)
Base.abs(x::Single32) = Core.Intrinsics.abs_float(x)

Base.copysign(x::Single32, y::Single32) = Core.Intrinsics.copysign_float(x, y)
Base.flipsign(x::Single32, y::Single32) = Core.Intrinsics.lt_float(y, Zero_Single32) ? Core.Intrinsics.neg_float(x) : x

Base.:(+)(x::Single32, y::Single32) = Core.Intrinsics.add_float(x, y)
Base.:(-)(x::Single32, y::Single32) = Core.Intrinsics.sub_float(x, y)
Base.:(*)(x::Single32, y::Single32) = Core.Intrinsics.mul_float(x, y)
Base.:(/)(x::Single32, y::Single32) = Core.Intrinsics.div_float(x, y)
Base.rem(x::Single32, y::Single32) = Core.Intrinsics.rem_float(x, y)

Base.muladd(x::Single32, y::Single32, z::Single32) = Core.Intrinsics.muladd_float(x, y, z)
Base.fma(x::Single32, y::Single32, z::Single32) = Core.Intrinsics.fma_float(x, y, z)

Base.copysign(x::Single32, y::Float64) = Core.Intrinsics.copysign_float(x, Single32(y))
Base.flipsign(x::Single32, y::Float64) = Core.Intrinsics.lt_float(y, zero(Float64)) ? Core.Intrinsics.neg_float(x) : x

Base.:(+)(x::Single32, y::Float64) = Core.Intrinsics.add_float(x, Single32(y))
Base.:(-)(x::Single32, y::Float64) = Core.Intrinsics.sub_float(x, Single32(y))
Base.:(*)(x::Single32, y::Float64) = Core.Intrinsics.mul_float(x, Single32(y))
Base.:(/)(x::Single32, y::Float64) = Core.Intrinsics.div_float(x, Single32(y))
Base.rem(x::Single32, y::Float64) = Core.Intrinsics.rem_float(x, Single32(y))

Base.copysign(x::Single32, y::Float32) = Core.Intrinsics.copysign_float(x, Single32(y))
Base.flipsign(x::Single32, y::Float32) = Core.Intrinsics.lt_float(y, zero(Float32)) ? Core.Intrinsics.neg_float(x) : x

Base.:(+)(x::Single32, y::Float32) = Core.Intrinsics.add_float(x, Single32(y))
Base.:(-)(x::Single32, y::Float32) = Core.Intrinsics.sub_float(x, Single32(y))
Base.:(*)(x::Single32, y::Float32) = Core.Intrinsics.mul_float(x, Single32(y))
Base.:(/)(x::Single32, y::Float32) = Core.Intrinsics.div_float(x, Single32(y))
Base.rem(x::Single32, y::Float32) = Core.Intrinsics.rem_float(x, Single32(y))

Base.copysign(x::Float64, y::Single32) = Core.Intrinsics.copysign_float(Single32(x), y)
Base.flipsign(x::Float64, y::Single32) = Core.Intrinsics.lt_float(y, Zero_Single32) ? Core.Intrinsics.neg_float(x) : x

Base.:(+)(x::Float64, y::Single32) = Core.Intrinsics.add_float(Single32(x), y)
Base.:(-)(x::Float64, y::Single32) = Core.Intrinsics.sub_float(Single32(x), y)
Base.:(*)(x::Float64, y::Single32) = Core.Intrinsics.mul_float(Single32(x), y)
Base.:(/)(x::Float64, y::Single32) = Core.Intrinsics.div_float(Single32(x), y)
Base.rem(x::Float64, y::Single32) = Core.Intrinsics.rem_float(Single32(x), y)

Base.copysign(x::Float32, y::Single32) = Core.Intrinsics.copysign_float(Single32(x), y)
Base.flipsign(x::Float32, y::Single32) = Core.Intrinsics.lt_float(y, Zero_Single32) ? Core.Intrinsics.neg_float(x) : x

Base.:(+)(x::Float32, y::Single32) = Core.Intrinsics.add_float(Single32(x), y)
Base.:(-)(x::Float32, y::Single32) = Core.Intrinsics.sub_float(Single32(x), y)
Base.:(*)(x::Float32, y::Single32) = Core.Intrinsics.mul_float(Single32(x), y)
Base.:(/)(x::Float32, y::Single32) = Core.Intrinsics.div_float(Single32(x), y)
Base.rem(x::Float32, y::Single32) = Core.Intrinsics.rem_float(Single32(x), y)


Base.muladd(x::Single32, y::Single32, z::Float64) = muladd_float(x, y, Single32(z))
Base.muladd(x::Single32, y::Float64, z::Single32) = muladd_float(x, Single32(y), z)
Base.muladd(x::Float64, y::Single32, z::Single32) = muladd_float(Single32(x), y, z)

Base.muladd(x::Single32, y::Float64, z::Float64) = muladd_float(x, Single32(y), Single32(z))
Base.muladd(x::Float64, y::Single32, z::Float64) = muladd_float(Single32(x), y, Single32(z))
Base.muladd(x::Float64, y::Float64, z::Single32) = muladd_float(Single32(x), Single32(y), z)

Base.muladd(x::Single32, y::Single32, z::Float32) = muladd_float(x, y, Single32(z))
Base.muladd(x::Single32, y::Float32, z::Single32) = muladd_float(x, Single32(y), z)
Base.muladd(x::Float32, y::Single32, z::Single32) = muladd_float(Single32(x), y, z)

Base.muladd(x::Single32, y::Float32, z::Float32) = muladd_float(x, Single32(y), Single32(z))
Base.muladd(x::Float32, y::Single32, z::Float32) = muladd_float(Single32(x), y, Single32(z))
Base.muladd(x::Float32, y::Float32, z::Single32) = muladd_float(Single32(x), Single32(y), z)

Base.fma(x::Single32, y::Single32, z::Float64) = muladd_float(x, y, Single32(z))
Base.fma(x::Single32, y::Float64, z::Single32) = muladd_float(x, Single32(y), z)
Base.fma(x::Float64, y::Single32, z::Single32) = muladd_float(Single32(x), y, z)

Base.fma(x::Single32, y::Float64, z::Float64) = muladd_float(x, Single32(y), Single32(z))
Base.fma(x::Float64, y::Single32, z::Float64) = muladd_float(Single32(x), y, Single32(z))
Base.fma(x::Float64, y::Float64, z::Single32) = muladd_float(Single32(x), Single32(y), z)

Base.fma(x::Single32, y::Single32, z::Float32) = muladd_float(x, y, Single32(z))
Base.fma(x::Single32, y::Float32, z::Single32) = muladd_float(x, Single32(y), z)
Base.fma(x::Float32, y::Single32, z::Single32) = muladd_float(Single32(x), y, z)

Base.fma(x::Single32, y::Float32, z::Float32) = muladd_float(x, Single32(y), Single32(z))
Base.fma(x::Float32, y::Single32, z::Float32) = muladd_float(Single32(x), y, Single32(z))
Base.fma(x::Float32, y::Float32, z::Single32) = muladd_float(Single32(x), Single32(y), z)


# unary
for Op in (:+, :cbrt, :rad2deg, :deg2rad, :mod2pi, :rem2pi, :abs, :abs2, :sign)
    @eval $Op(x::Single32) = Single32($Op(Float64(x)))
end
for Op in (:exp2, :exp10, :expm1, :log2, :log10, :log1p)
    @eval $Op(x::Single32) = Single32($Op(Float64(x)))
end
# binary
for Op in (:\, :^, :div, :rem, :fld, :mod, :cld, :hypot, :min, :max, :minmax, :divrem, :fldmod, :copysign, :flipsign)
    @eval $Op(x::Single32, y::Single32) = Single32($Op(Float64(x), Float64(y)))
end
# trinary
for Op in (:clamp,)
    @eval $Op(x::Single32, y::Single32, z::Single32) = Single32($Op(Float64(x), Float64(y), Float64(z)))
end

Base.fma(x::Single32, y::Single32, z::Single32) = Single32(fma(Float64(x), Float64(y), Float64(z)))
Base.fma(x::Single32, y::Single32, z::T) where {T<:IEEEFloat} = Single32(fma(Float64(x), Float64(y), Float64(z)))
Base.fma(x::Single32, y::T, z::Single32) where {T<:IEEEFloat} = Single32(fma(Float64(x), Float64(y), Float64(z)))
Base.fma(x::T, y::Single32, z::Single32) where {T<:IEEEFloat} = Single32(fma(Float64(x), Float64(y), Float64(z)))
Base.fma(x::Single32, y::T, z::T) where {T<:IEEEFloat} = Single32(fma(Float64(x), Float64(y), Float64(z)))
Base.fma(x::T, y::Single32, z::T) where {T<:IEEEFloat} = Single32(fma(Float64(x), Float64(y), Float64(z)))
Base.fma(x::T, y::T, z::Single32) where {T<:IEEEFloat} = Single32(fma(Float64(x), Float64(y), Float64(z)))


for Op in (:sqrt, :exp, :log,
           :sin, :cos, :tan, :csc, :sec, :cot, 
           :asin, :acos, :atan, :acsc, :asec, :acot,            
           :sinh, :cosh, :tanh, :csch, :sech, :coth, 
           :asinh, :acosh, :atanh, :acsch, :asech, :acoth)
    @eval $Op(x::Single32) = Single32($Op(Float64(x)))
end
