module MajoranaReps_MathLink

if !@isdefined(TabLevel)
    TabLevel = ""
end
println(TabLevel*"Open MajoranaReps_MathLink.jl")
TabLevel=TabLevel*"    "


println("Loading")
using MathLink
using MajoranaReps

import Base.*

*(x::MathLink.WTypes,y::MajoranaReps.MajTypes) = OpScale(x,y)
*(x::MajoranaReps.MajTypes,y::MathLink.WTypes) = OpScale(y,x)


function ScaleToStr(scale::MathLink.WTypes,tex::Bool,KetState::Bool,NumOps::Int,FirstTerm::Bool)
    if FirstTerm
        return "$(scale)*"
    else
        return "+ $(scale)*"
    end
end





TabLevel=TabLevel[1:end-4]
println(TabLevel*"Close MajoranaReps_MathLink.jl")


end
