module SingleFloats

export Single32

using Base: IEEEFloat
import Base: promote_rule, promote_type, convert, hash, show, string, repr, parse, tryparse,
    cmp, ==, !=, >=, >, <=, <, isless, isequal, iseven, isfinite, isnan, isodd, issubnormal,
    +, -, *, /, \, %, √, ÷, inv,
    prevfloat, nextfloat, eps, exponent, significand, zero, one, iszero, isone, isinteger, decompose,
    typemin, typemax, floatmin, floatmax, maxintfloat, widen, precision,
    ^, sqrt, cbrt, ∛, div, rem, fld, mod, cld, hypot, min, max, minmax, maximum, minimum, rad2deg, deg2rad, mod2pi, rem2pi,
    abs, abs2, signbit, sign, copysign, flipsign, floor, ceil, trunc, round, divrem, fldmod, clamp
    
import Base.Math: exp, exp2, exp10, expm1, log, log2, log10, log1p, 
    sin, cos, tan, csc, sec, cot, asin, acos, atan, acsc, asec, acot,
    sinh, cosh, tanh, csch, sech, coth, asinh, acosh, atanh, acsch, asech, acoth

using LinearAlgebra
import LinearAlgebra: rank, cond, norm, opnorm, det, tr, inv, pinv, 
                      transpose, adjoint, eigvals, eigvals!, svdvals, svdvals!, svd,
                      iszero, isone, isdiag, issymmetric, ishermitian,
                      isposdef, isposdef!, istril, istriu,
                      lu, lu!, qr, qr!,
                      schur, schur!, hessenberg, hessenberg!,
                      cholesky, cholesky!, factorize
using Random


include("type/Single32.jl")

Base.zero(::Type{Single32}) = Single32( zero(Float64)) )
Base.one(::Type{Single32})  = Single32( one(Float64)) )
Base.zeros(::Type{Single32}, n::Int) = map(Single32, zeros(Float64, n))
Base.ones(::Type{Single32}, n::Int) = map(Single32, one(Float64, n))

# these consts are used internally for a slime throughput advantage in cases heavily used
const Zero_Single32 = zero(Single32) 
const One_Single32 = one(Single32)

include("type/random.jl")

include("math/arith.jl")
include("math/elementary.jl")
include("math/linearalgebra.jl")

end # SingleFloats
