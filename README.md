# SingleFloats.jl
Float32 results are computed using Float64s

#### Copyright © 2015-2019 by Jeffrey Sarnoff.
####  This work is released under The MIT License.

----
[![Travis Build Status](https://travis-ci.org/JeffreySarnoff/SingleFloats.jl.svg?branch=master)](https://travis-ci.org/JeffreySarnoff/SingleFloats.jl) [![codecov](https://codecov.io/gh/JeffreySarnoff/SingleFloats.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/JeffreySarnoff/SingleFloats.jl)
----

### Showing the additional reliability that comes with using `Simple32s`.

```
using SingleFloats

xs_fwd(::Type{T}) where T = T.(collect(1.0:20.0))
ys_fwd(::Type{T}) where T = cot.(xs_fwd(T))
sumfwd(::Type{T}) where T = sum(ys_fwd(T))

xs_rev(::Type{T}) where T = reverse(xs_fwd(T))
ys_rev(::Type{T}) where T = cot.(xs_rev(T))
sumrev(::Type{T}) where T = sum(ys_rev(T))

epsmax(a, b) = eps(max(a, b))

function muddybits(::Type{T}) where T
   fwd = sumfwd(T)
   rev = sumrev(T)
   muddy = round(Int32, abs(fwd - rev) / epsmax(fwd, rev))

   lsbits = 31 - leading_zeros(muddy)
   return max(0, lsbits)
end


(Single32 = muddybits(Single32),
 Float32  = muddybits(Float32),
 Float64  = muddybits(Float64))

(Single32 = 0, Float32 = 6, Float64 = 7)


```
