using Nonograms
using Test
import Nonograms: run_length_encode
@testset "RLE" begin
    @test 0 == length(run_length_encode([]))
    @test [(0, 2), (1, 1), (0, 3)] == run_length_encode([0,0,1,0,0,0])
end
