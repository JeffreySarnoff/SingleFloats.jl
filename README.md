# SingleFloats.jl
Float32 results are computed using Float64s

#### Copyright © 2015-2019 by Jeffrey Sarnoff.
####  This work is released under The MIT License.

----
[![Travis Build Status](https://travis-ci.org/JeffreySarnoff/SingleFloats.jl.svg?branch=master)](https://travis-ci.org/JeffreySarnoff/SingleFloats.jl)
----

```
using SingleFloats

julia> sum(cot.(Float64.(collect(1.0:20)))),sum(cot.(reverse(Float64.(collect(1.0:20)))))
(-0.03787685043096911, -0.03787685043097011)
julia> ans[1] == nextfloat(ans[2], 144)
true
 
julia> sum(cot.(Float32.(collect(1.0:20)))),sum(cot.(reverse(Float32.(collect(1.0:20)))))
(-0.03787771f0, -0.03787744f0)

julia> sum(cot.(Float32.(collect(1.0:20)))),sum(cot.(reverse(Float32.(collect(1.0:20)))))
(-0.03787771f0, -0.03787744f0)
julia> Int( abs(ans[1]-ans[2]) / eps((ans[1]+ans[2])/2) )
72
julia> sum(cot.(Float32.(collect(1.0:20)))),sum(cot.(reverse(Float32.(collect(1.0:20)))))
(-0.03787771f0, -0.03787744f0)
julia>  ans[1] == prevfloat(ans[2], 72)
true

julia> sum(cot.(Single32.(collect(1.0:20)))),sum(cot.(reverse(Single32.(collect(1.0:20)))))
(-0.03787685f0, -0.03787685f0)
julia> ans[1] == ans[2]
true

```
