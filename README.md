# SingleFloats.jl
Float32 results are computed using Float64s

#### Copyright © 2015-2019 by Jeffrey Sarnoff.
####  This work is released under The MIT License.

----
[![Travis Build Status](https://travis-ci.org/JeffreySarnoff/SingleFloats.jl.svg?branch=master)](https://travis-ci.org/JeffreySarnoff/SingleFloats.jl)
----

```
using SingleFloats

julia> sum(sin.(collect(1.0:20))),sum(sin.(reverse(collect(1.0:20))))
(0.9982218844197817, 0.9982218844197821)

julia> nextfloat(ans[1],4), prevfloat(ans[2],4)
(0.9982218844197821, 0.9982218844197817)

julia> sum(sin.(Float32.(collect(1.0:20)))),sum(sin.(reverse(Float32.(collect(1.0:20)))))
(0.99822176f0, 0.9982218f0)

julia> nextfloat(ans[1],1), prevfloat(ans[2],1)
(0.9982218f0, 0.99822176f0)

julia> sum(sin.(Single32.(collect(1.0:20)))),sum(sin.(reverse(Single32.(collect(1.0:20)))))
(0.9982219f0, 0.9982219f0)





julia> invfactorials(::Type{T}) where T = map(inv, map(T, map(factorial, 0:20)));

julia> sum(invfactorials(Float32)), sum(reverse(invfactorials(Float32)))
(2.718282f0, 2.7182817f0)

julia> sum(invfactorials(Float64)), sum(reverse(invfactorials(Float64)))
(2.7182818284590455, 2.718281828459045)

julia> Float64(sum(invfactorials(BigFloat))), Float64(sum(reverse(invfactorials(BigFloat))))
(2.718281828459045, 2.718281828459045)

julia> Float32(sum(invfactorials(BigFloat))), Float32(sum(reverse(invfactorials(BigFloat))))
(2.7182817f0, 2.7182817f0)

julia> sum(invfactorials(Single32)), sum(reverse(invfactorials(Single32)))
(2.7182817f0, 2.7182817f0)

julia> Float32(sum(invfactorials(Float64))), Float32(sum(reverse(invfactorials(Float64))))
(2.7182817f0, 2.7182817f0)
```
