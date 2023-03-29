#include("../src/MajoranaReps.jl")
using MajoranaReps
using MathLink
using MajoranaReps_MathLink
using Test

MathLink.set_GreedyEval(true)

@testset "Majorana Operators and MathLink Expressions" begin
    @test W"a" * Ket() == Ket() * W"a"
    @test W"a" * c(1) == c(1) * W"a"

    @test (W"a" * c(1) + W"b" * c(2)) == ( W"b" * c(2) + W"a" * c(1))


    @test W"a"*bx(1) == W"a"*bx(1)
    @test W"a"*W"b"*bx(1) == W`a b`*bx(1)
    
    
    @test W"a"*bx(1)*Ket() == W"a"*bx(1)*Ket()
    @test W"a"*W"b"*bx(1)*Ket() == W`a b`*bx(1)*Ket()

    @test "$(W"a"*Ket())" == "(a) |0>"
    @test "$((W"a"+W"a")*Ket())" == "(W\"Times\"(2, W\"a\")) |0>"
    @test "$((W"a"+W"b")*Ket())" == "(W\"Plus\"(W\"a\", W\"b\")) |0>"


    @test length(W"a") == 1
    @test length(W"a"+W"b") == 1

    @test collect(W"a") == Any[W"a"]
    @test collect(W"a"+W"b") == Any[W"a"+W"b"]

    @test W"a" .* fill(1) == [W"a"]
    @test W"a" .* fill(1,1) == [W"a"]
    @test W"a" .* fill(1,2) == [W"a",W"a"]   
end

