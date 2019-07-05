# SingleFloats.jl
Float32 results are computed using Float64s

#### Copyright © 2015-2019 by Jeffrey Sarnoff.
####  This work is released under The MIT License.

----
[![Travis Build Status](https://travis-ci.org/JeffreySarnoff/SingleFloats.jl.svg?branch=master)](https://travis-ci.org/JeffreySarnoff/SingleFloats.jl)&nbsp;&nbsp;&nbsp;[![Docs](https://img.shields.io/badge/docs-stable-blue.svg)](http://jeffreysarnoff.github.io/SingleFloats.jl/stable/)
----

```
using SingleFloats

fwdxs(::Type{T}) where T  = T.(collect(1.0:20.0))
fwdys(::Type{T}) where T  = cot.(fwdxs(T))
fwdsum(::Type{T}) where T = sum(fwdys(T))

revxs(::Type{T}) where T  = reverse(fwdxs(T))
revys(::Type{T}) where T  = cot.(revxs(T))
revsum(::Type{T}) where T = sum(revys(T))

function muddybits(::Type{T}) where T
   fwd = fwdsum(T)
   rev = revsum(T)
   epsavg = eps((fwd + rev)/2)
   muddy = round(Int32, abs(fwd - rev) / epsavg)
   lsbits = 31 - leading_zeros(muddy)
   return max(0, lsbits)
end


(Single32 = muddybits(Single32),
 Float32  = muddybits(Float32),
 Float64  = muddybits(Float64))

(Single32 = 0, Float32 = 6, Float64 = 7)


```
