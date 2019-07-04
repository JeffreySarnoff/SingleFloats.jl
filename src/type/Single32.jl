import Base: cmp, ==, !=, >=, >, <=, <, isless, isequal

primitive type Single32 <: AbstractFloat 64 end

const IEEEFloats = Union{Single32, Float64, Float32, Float16}

Single32(x::Single32) = x

@inline Single32(x::Float64) = reinterpret(Single32, x)
@inline Single32(x::Float32) = reinterpret(Single32, Float64(x))
Single32(x::BigFloat) = Single32(Float64(x))
@inline Single32(x::T) where {T<:Integer} = Single32(Float64(x))

@inline Float64(x::Single32) = reinterpret(Float64, x)
@inline Float32(x::Single32) = Float32(reinterpret(Float64, x))
BigFloat(x::Single32) = BigFloat(Float64(x))
Base.Int128(x::Single32) = Int128(Float64(x))
Base.Int64(x::Single32) = Int64(Float64(x))
Base.Int32(x::Single32) = Int32(Float64(x))
Base.Int16(x::Single32) = Int16(Float64(x))


convert(::Type{Single32}, x::Float64) = Single32(x)
convert(::Type{Single32}, x::Float32) = Single32(x)
convert(::Type{Single32}, x::BigFloat) = Single32(x)
convert(::Type{Float64}, x::Single32) = Float64(x)
convert(::Type{Float32}, x::Single32) = Float32(x)
convert(::Type{BigFloat}, x::Single32) = BigFloat(x)

Base.show(io::IO, x::Single32) = show(io, Float32(x))
Base.string(x::Single32) = string(Float32(x))
Base.repr(x::Single32) = string("Single32(",repr(Float64(x)),")")

Base.hash(x::Single32) = hash(Float64(x))
Base.hash(x::Single32, h::UInt64) = hash(Float64(x), h)


# comparisons
for Op in (:cmp, :(==), :(!=), :(>=), :(<=), :(>), :(<), :isless, :isequal)
    @eval begin
        $Op(x::Single32, y::Single32) = $Op(Float64(x), Float64(y))
        $Op(x::Single32, y::Float64) = $Op(Float64(x), y)
        $Op(x::Float64, y::Single32) = $Op(x, Float64(y))
        $Op(x::Single32, y::Float32) = $Op(Float64(x), Float64(y))
        $Op(x::Float32, y::Single32) = $Op(Float64(x), Float64(y))
        $Op(x::Single32, y::Float16) = $Op(Float64(x), Float64(y))
        $Op(x::Float16, y::Single32) = $Op(Float64(x), Float64(y))
        $Op(x::Single32, y::BigFloat) = $Op(Float64(x), Float64(y))
        $Op(x::BigFloat, y::Single32) = $Op(Float64(x), Float64(y))
        $Op(x::Single32, y::Int64) = $Op(Float64(x), Float64(y))
        $Op(x::Int64, y::Single32) = $Op(Float64(x), Float64(y))
        $Op(x::Single32, y::Int32) = $Op(Float64(x), Float64(y))
        $Op(x::Int32, y::Single32) = $Op(Float64(x), Float64(y))
        $Op(x::Single32, y::Int16) = $Op(Float64(x), Float64(y))
        $Op(x::Int16, y::Single32) = $Op(Float64(x), Float64(y))
        $Op(x::Single32, y::Int128) = $Op(Float64(x), Float64(y))
        $Op(x::Int128, y::Single32) = $Op(Float64(x), Float64(y))
    end
end
