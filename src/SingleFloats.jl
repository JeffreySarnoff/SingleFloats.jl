module SingleFloats

export FloatWK

import Base: promote_rule, convert 

include("type/FloatWK.jl")
include("math/FloatWK.jl")

end # SingleFloats
