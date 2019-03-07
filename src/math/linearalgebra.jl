#=
svd,
                      lu, lu!, qr, qr!,
                      schur, schur!, hessenberg, hessenberg!,
                      cholesky, cholesky!, factorize
=#

for Op in (:iszero, :isone, :isdiag, :issquare, :issymmetric,
           :ishermitian, :isposdef, :isposdef!, :istril, :istriu)
    @eval $Op(x::Array{FloatWK,2}) = $Op(Float64.(x))
end

for Op in (:rank, :cond, :norm, :opnorm, :det, :tr)
    @eval $Op(x::Array{FloatWK,2}) = FloatWK($Op(Float64.(x)))
end
 
for Op in (:transpose, :adjoint, :inv, :pinv)
    @eval $Op(x::Array{FloatWK,2}) = FloatWK.($Op(Float64.(x)))
end
 
for Op in (:eigvals, :eigvals!, :svdvals, :svdvals!)
    @eval $Op(x::Array{FloatWK,2}) = FloatWK.($Op(Float64.(x)))
end

