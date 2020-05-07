import Nonograms
import Nonograms: ndnotation, get_margin_clue, combine

function sequence_infer(margin, evidence)
  n = length(evidence)
  s = sum(margin)
  p = Union{Missing, Nothing, Bool}[missing for _ in 1:n]

  n_missing = mapreduce(ismissing, +, evidence)
  if n_missing == 0
    return evidence
  end
  do_mask = n_missing < n
  if do_mask
    search_mask = ismissing.(evidence)
    l = sum(search_mask)
    a = copy(evidence)
    s_confirmed = sum(isequal.(true, evidence))
  else
    l = n
  end

  for i in 0:(2^l-1)
    _a = digits(i, base=2, pad=l)
    if do_mask && sum(_a) + s_confirmed != s
      continue # just an optimization
    end
    if !do_mask && sum(_a) != s
      continue # just an optimization
    end
    if do_mask
      copy!(a, evidence)
      a[search_mask] .= _a
    else
      a = _a
    end
    if Nonograms.get_margin_clue(a) == margin # consistent with margin
      if !any(combine.(evidence, a) .=== nothing)  # consistent with work so far
        p .= combine.(p, a)
        #=
        if 0 == sum(ismissing.(p))
          # all positions assigned or have contradiction (`nothing`)
          break
        end
        =#
      end
    end
  end
  p[p .=== nothing] .= missing
  return p
end

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
println("\n\nresult:")
println(make_string(image))
