Random.rand(::Type{Single32}) = Single32(rand(Float32))
Random.rand(::Type{Single32}, n::Integer=1) = map(Single32, rand(Float32, max(0,n)))
Random.rand(::Type{Single32}, a=1,b=1) = map(Single32, rand(Float32, max(0,a), max(0, b)))
Random.rand(::Type{Single32}, xs::Vararg{Int,N}) where {N} = map(Single32, rand(Float32, map(z->max(0,z), xs)...,))

