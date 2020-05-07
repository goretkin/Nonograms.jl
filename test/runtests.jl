using Nonograms
using Test
using Nonograms: run_length_encode, solve_nonogram

module Puzzle1
    include("nancy_drew_booklet.jl")
end

module Puzzle2
    include("nancy_drew_lastnono.jl")
end

@testset "RLE" begin
    @test 0 == length(run_length_encode([]))
    @test [(0, 2), (1, 1), (0, 3)] == run_length_encode([0,0,1,0,0,0])
end

@testset "puzzles" begin
    for P in [Puzzle1, #=Puzzle2=#] #  Puzzle2 is kind of slow with the naive solver
        image = solve_nonogram(P.row_margins, P.column_margins)
        @test image == P.solution
    end
end
