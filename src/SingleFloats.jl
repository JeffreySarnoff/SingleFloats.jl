module SingleFloats

export FloatWK

import Base: IEEEFloat, promote_rule, convert 

include("type/FloatWK.jl")
include("math/FloatWK.jl")

end # SingleFloats
