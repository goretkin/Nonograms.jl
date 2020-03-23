import Nonograms
import Nonograms: ndnotation, get_margin_clue, combine

Nonograms.run_length_encode([0,0,1,0,0,0])

r = Nonograms._get_absolute(4, [
  [0,0,1,1],
  [1,0,0,1],
])

Nonograms.ndnotation.(Nonograms._trival.(r...))


e = Union{Missing, Nothing, Bool}[missing for _ in 1:20]

function sequence_infer(margin, evidence)
  n = length(evidence)
  s = sum(margin)
  p = Union{Missing, Nothing, Bool}[missing for _ in 1:n]
  for i in 0:(2^n-1)
    a = digits(i, base=2, pad=n)
    if sum(a) != s
      continue # just an optimization
    end
    if Nonograms.get_margin_clue(a) == margin # consistent with margin
      if !any(combine.(evidence, a) .=== nothing)  # consistent with work so far
        p .= combine.(p, a)
      end
    end
  end
  p[p .=== nothing] .= missing
  return p
end

row_margins = [
[4, 3, 6, 1],
[5, 2, 3, 1],
[1, 3, 3, 2, 3],
[1, 3, 1, 2, 1],
[1, 2, 1, 1, 1],

[1, 2, 1, 3, 2, 2],
[1, 1, 2, 7],
[1, 2, 1, 2, 1, 1],
[1, 1, 2, 3, 1, 1, 1],
[1, 1, 3, 3, 1, 2, 1],

[1, 1, 1, 1, 3, 1, 1, 1],
[1, 1, 2, 3, 3, 1, 1],
[1, 2, 2, 2, 3, 2],
[1, 1, 3, 1, 5],
[1, 2, 2, 2, 2, 1],

[1, 1, 2, 1, 1, 2, 1],
[1, 1, 2, 1, 2, 1, 2, 1],
[1, 2, 1, 3, 1, 1],
[1, 2, 2, 2, 1],
[1, 1, 2, 2, 2, 2]
]

column_margins = [
[5],
[7, 4],
[2, 6, 3],
[6 ,2, 2],
[11, 1],

[3, 3, 6],
[1, 3, 11],
[1, 2, 3, 3, 1],
[3, 2, 2, 5],
[2, 1, 7, 2],

[1, 4, 1, 1],
[1, 2, 2, 4],
[1, 2, 1, 2, 1],
[1, 3, 3, 1],
[2, 9, 1, 1],

[3, 1, 4, 2],
[3, 4, 6],
[5, 4, 2],
[2, 4, 1, 1],
[3, 6]
]

image = convert(Matrix{Union{Missing, Bool}}, fill(missing, length(row_margins), length(column_margins)))

# TODO there is a better way to do this that is dimension independent
function row_or_column(dim, i)
  if dim == 1
    return (i, Colon())
  elseif dim == 2
    return (Colon(), i)
  end
end

function make_string(image)
  return join(
    (join(
      Nonograms.ndnotation.(image[i, :]),
      " ")
    for i = 1:size(image, 1)), "\n")
end

margins = [row_margins, column_margins]

function solve_nonogram!(image, margins)
  for i_pass = 1:prod(size(image))
    for dim = 1:2
      for i = 1:size(image, dim)
        if sum(ismissing.(image[row_or_column(dim, i)...])) == 0
          continue  # this sequence is already specified!
        end
        @show sum(ismissing.(image))
        @show i_pass i dim
        println(make_string(image))
        evidence = image[row_or_column(dim, i)...]
        post = sequence_infer(margins[dim][i], evidence)
        image[row_or_column(dim, i)...] .= post

        if sum(ismissing.(image)) == 0
          return
        end
      end
    end
  end
  nothing
end

solve_nonogram!(image, margins)
