Base.:(*)(x::Matrix{Single32}, y::Matrix{Single32}) =
    reinterpret(Single32, reinterpret(Float64, x) * reinterpret(Float64, y))
    

function LinearAlgebra.mul!(m1::Matrix{Single32}, m2::Matrix{Single32}, m3::Matrix{Single32})
    m1 = reinterpret(Single32, reinterpret(Float64, m2) * reinterpret(Float64, m3))
    return m1
end

function LinearAlgebra.rmul!(m1::Matrix{Single32}, m2::Matrix{Single32})
    m1 = reinterpret(Single32, reinterpret(Float64, m1) * reinterpret(Float64, m2))
    return m1
end

function LinearAlgebra.lmul!(m1::Matrix{Single32}, m2::Matrix{Single32})
    m2 = reinterpret(Single32, reinterpret(Float64, m1) * reinterpret(Float64, m2))
    return m2
end

LinearAlgebra.exp!(x::Array{Complex{Single32},2}) = Complex{Single32}.(LinearAlgebra.exp!(Complex{Float64}.(x)))

for Op in (:iszero, :isone, :isdiag, :issymmetric, :ishermitian,
           :isposdef, :isposdef!, :istril, :istriu)
    @eval $Op(x::Array{Single32,2}) = $Op(reinterpret(Float64,x))
    end

for Op in (:rank, :cond, :opnorm)
    @eval $Op(x::Array{Single32,2}) = Single32($Op(reinterpret(Float64,x)))
end

for Op in (:norm, :det, :tr)
    @eval $Op(x::Array{Single32,2}) = Single32($Op(reinterpret(Float64,x)))
end
 
for Op in (:transpose, :adjoint, :inv, :pinv)
    @eval $Op(x::Array{Single32,2}) = Single32.($Op(reinterpret(Float64,x)))
end

lu(x::Array{Single32,2}) = lu(reinterpret(Float64,x))
qr(x::Array{Single32,2}) = qr(reinterpret(Float64,x))

#=
for Op in (:lu, :lu!, :qr, :qr!, :schur, :schur!)
    @eval $Op(x::Array{Single32,2}) = Single32.($Op(Float64.(x)))
end
for Op in (:cholesky, :cholesky!, :hessenberg, :hessenberg!, :factorize)
    @eval $Op(x::Array{Single32,2}) = Single32.($Op(Float64.(x)))
end
=#

for Op in (:eigvals, :eigvals!, :svdvals, :svdvals!, :svd)
    @eval $Op(x::Array{Single32,2}) = reinterpret(Single32, $Op(reinterpret(Float64,x)))
end

for Op in (:eigvals, :eigvecs, :svdvals, :svd)
    @eval $Op(x::Array{Single32,2}, y::Array{Single32,2}) =
        reinterpret(Single32, $Op(reinterpret(Float64,x), reinterpret(Float64,y)))
end

for Op in (:sqrt, :exp, :log,
           :sin, :cos, :tan, :csc, :sec, :cot, 
           :asin, :acos, :atan, :acsc, :asec, :acot,            
           :sinh, :cosh, :tanh, :csch, :sech, :coth, 
           :asinh, :acosh, :atanh, :acsch, :asech, :acoth)
    @eval $Op(x::Array{Single32,2}) = reinterpret(Single32,$Op(reinterpret(Float64,x)))
end
