import Nonograms
import Nonograms: ndnotation, get_margin_clue

Nonograms.run_length_encode([0,0,1,0,0,0])

r = Nonograms.get_absolute(4, [
  [0,0,1,1],
  [1,0,0,1],
])

Nonograms.ndnotation.(r...)

p = []
(a for i in 0:(2^20-1) )
for i in 0:(2^20-1)
  a = digits(i, base=2, pad=20)
  if Nonograms.get_margin_clue(a) == [1, 1, 3, 1, 5]
    push!(p, a)
  end
end

join(Nonograms.ndnotation.(Nonograms.get_absolute(20, p)...), " ")
