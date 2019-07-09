using LinearAlgebra.BLAS

function BLAS.axpy!(a::Single32, X::T, Y::T) where {T<:AbstractArray}
    axpy!(Float64(a), X, Y)
    return Single32.(Y)
end

