module MajoranaReps_MathLink

if !@isdefined(TabLevel)
    TabLevel = ""
end
println(TabLevel*"Open MajoranaReps_MathLink.jl")
TabLevel=TabLevel*"    "


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



import Base.isreal
isreal(::MathLink.WTypes) = false  ##Do not assume real

import Base.length
length(::MathLink.WTypes) = 1 ##We treat them as scalars

import Base.iterate
iterate(x::MathLink.WTypes) =  (x, nothing)
function iterate(x::MathLink.WTypes, state)
    if state == nothing
        return nothing
    else
        error("state = $state")
    end
end

TabLevel=TabLevel[1:end-4]
println(TabLevel*"Close MajoranaReps_MathLink.jl")


end
