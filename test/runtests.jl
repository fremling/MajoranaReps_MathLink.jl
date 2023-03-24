#include("../src/MajoranaReps.jl")
using MajoranaReps
using MathLink
using MajoranaReps_MathLink
using Test


@testset "Majorana Operators and MathLink Expressions" begin
    @test W"a" * Ket() == Ket() * W"a"
    @test W"a" * c(1) == c(1) * W"a"

    @test (W"a" * c(1) + W"b" * c(2)) == ( W"b" * c(2) + W"a" * c(1))


    @test W"a"*bx(1) == W"a"*bx(1)
    @test W"a"*W"b"*bx(1) == W`a b`*bx(1)
    
    
    @test W"a"*bx(1)*Ket() == W"a"*bx(1)*Ket()
    @test W"a"*W"b"*bx(1)*Ket() == W`a b`*bx(1)*Ket()
    
end

