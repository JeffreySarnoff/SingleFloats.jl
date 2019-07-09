*(a::Matrix{Single32}, b::Matrix{Single32}) = view(a,:,:) * view(b,:,:)

LinearAlgebra.exp!(x::Array{Complex{Single32},2}) = Complex{Single32}.(LinearAlgebra.exp!(Complex{Float64}.(x)))

for Op in (:iszero, :isone, :isdiag, :issymmetric, :ishermitian,
           :isposdef, :isposdef!, :istril, :istriu)
    @eval $Op(x::Array{Single32,2}) = $Op(view(x,:,:))
end

for Op in (:rank, :cond, :opnorm)
    @eval $Op(x::Array{Single32,2}) = Single32($Op(Float64.(x)))
end

for Op in (:norm, :det, :tr)
    @eval $Op(x::Array{Single32,2}) = Single32($Op(view(x,:,:)))
end
 
for Op in (:transpose, :adjoint, :inv, :pinv)
    @eval $Op(x::Array{Single32,2}) = Single32.($Op(Float64.(x)))
end

#=
for Op in (:lu, :lu!, :qr, :qr!, :schur, :schur!)
    @eval $Op(x::Array{Single32,2}) = Single32.($Op(Float64.(x)))
end

for Op in (:cholesky, :cholesky!, :hessenberg, :hessenberg!, :factorize)
    @eval $Op(x::Array{Single32,2}) = Single32.($Op(Float64.(x)))
end
=#

for Op in (:eigvals, :eigvals!, :svdvals, :svdvals!, :svd)
    @eval $Op(x::Array{Single32,2}) = Single32.($Op(Float64.(x)))
end

for Op in (:eigvals, :eigvecs, :svdvals, :svd)
    @eval $Op(x::Array{Single32,2}, y::Array{Single32,2}) = Single32.($Op(Float64.(x), Float64.(y)))
end

for Op in (:sqrt, :exp, :log,
           :sin, :cos, :tan, :csc, :sec, :cot, 
           :asin, :acos, :atan, :acsc, :asec, :acot,            
           :sinh, :cosh, :tanh, :csch, :sech, :coth, 
           :asinh, :acosh, :atanh, :acsch, :asech, :acoth)
    @eval $Op(x::Array{Single32,2}) = Single32.($Op(Float64.(x)))
end
