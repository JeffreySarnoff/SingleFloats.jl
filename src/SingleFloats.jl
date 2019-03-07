module SingleFloats

export FloatWK

using Base: IEEEFloat
import Base: promote_rule, convert

using LinearAlgebra
import LinearAlgebra: rank, cond, norm, opnorm, det, tr, inv, pinv. 
                      transpose, adjoint, eigvals, eigvals!, svdvals, svdvals!, svd,
                      iszero, isone, isdiag, issquare, issymmetric, ishermitian,
                      isposdef, isposdef!, istril, istriu,
                      lu, lu!, qr, qr!,
                      schur, schur!, hessenberg, hessenberg!,
                      cholesky, cholesky!, factorize

include("type/FloatWK.jl")
include("math/FloatWK.jl")

end # SingleFloats
