module SingleFloats

export Single32

using Base: IEEEFloat
import Base: promote_rule, convert, hash, show, string, repr
import Base: cmp, ==, !=, >=, >, <=, <, isless, isequal
import Base: +, -, *, /, \, %, √, ÷, inv
import Base: prevfloat, nextfloat, eps, exponent, significand, zero, one, iszero, isone, decompose
import Base: typemin, typemax, floatmin, floatmax, maxintfloat, widen
import Base: ^, sqrt, cbrt, ∛, div, rem, fld, mod, cld, hypot, min, max, minmax, rad2deg, deg2rad, mod2pi, rem2pi
import Base: abs, abs2, sign, copysign, flipsign, floor, ceil, trunc, round, divrem, fldmod, clamp
import Base: exp, exp2, exp10, expm1, log, log2, log10, log1p, 
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
include("math/Single32.jl")
include("math/linearalgebra.jl")

end # SingleFloats
