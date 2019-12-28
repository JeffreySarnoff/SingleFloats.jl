Random.rand(::Type{Single32}) = Single32(rand(Float32))
Random.rand(::Type{Single32}, n::Integer=1) = map(Single32, rand(Float32, max(0,n)))
