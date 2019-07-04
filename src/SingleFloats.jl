module SingleFloats

export Single32

using Base: IEEEFloat
import Base: promote_rule, convert

using LinearAlgebra
import LinearAlgebra: rank, cond, norm, opnorm, det, tr, inv, pinv, 
                      transpose, adjoint, eigvals, eigvals!, svdvals, svdvals!, svd,
                      iszero, isone, isdiag, issymmetric, ishermitian,
                      isposdef, isposdef!, istril, istriu,
                      lu, lu!, qr, qr!,
                      schur, schur!, hessenberg, hessenberg!,
                      cholesky, cholesky!, factorize

include("type/Single32.jl")
include("math/Single32.jl")
include("math/linearalgebra.jl")

end # SingleFloats
