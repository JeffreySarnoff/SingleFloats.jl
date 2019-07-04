for Op in (:iszero, :isone, :isdiag, :issymmetric,
           :ishermitian, :isposdef, :isposdef!, :istril, :istriu)
    @eval $Op(x::Array{Single32,2}) = $Op(Float64.(x))
end

for Op in (:rank, :cond, :norm, :opnorm, :det, :tr)
    @eval $Op(x::Array{Single32,2}) = Single32($Op(Float64.(x)))
end
 
for Op in (:transpose, :adjoint, :inv, :pinv)
    @eval $Op(x::Array{Single32,2}) = Single32.($Op(Float64.(x)))
end
 
for Op in (:eigvals, :eigvals!, :svdvals, :svdvals!)
    @eval $Op(x::Array{Single32,2}) = Single32.($Op(Float64.(x)))
end
