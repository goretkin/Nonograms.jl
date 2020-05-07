import Nonograms
import Nonograms: solve_nonogram, make_string

include("nancy_drew_booklet.jl")
image = solve_nonogram(row_margins, column_margins)

println("\n\nresult:")
println(make_string(image))
