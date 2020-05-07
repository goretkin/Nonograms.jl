module Nonograms

function run_length_encode(input)
    output = Tuple{eltype(input), Int}[]
    for e in input
        if length(output) == 0
            push!(output, (e, 1))
            continue
        end

        if isequal(output[end][1], e)
            # TODO use a Lens package (setfield?)
            output[end] = (e, output[end][2] + 1)
        else
            push!(output, (e, 1))
        end
    end
    return output
end

function get_margin_clue(a)
    return [c for (e,c) in run_length_encode(a) if e == 1]
end

function _get_absolute(l, possibilities)
    absolute_1 = ones(Int, l)
    absolute_0 = zeros(Int, l)
    for p in possibilities
        absolute_1 .= absolute_1 .& p   # if ever false, always false
        absolute_0 .= absolute_0 .| p   # if ever true, always true
    end

    return (absolute_0, absolute_1)
end

function _trival(absolute_0, absolute_1)
    if absolute_0 == false
        return false
    end
    if absolute_1 == true
        return true
    end
    if absolute_1 == false && absolute_0 == true
        return missing
    end
    error("inconsistent")
end


function ndnotation(v)
    if isequal(v, false)
        return "×"
    end
    if isequal(v, true)
        return "▦"
    end
    if isequal(v, missing)
        return "□"
    end
end

# `missing` means (true or false)
# `nothing` means a and b were inconsistent
function combine(a, b)
    if isequal(a, missing)
        return b
    elseif isequal(b, missing)
        return a
    elseif a == b
        return a
    else
        return nothing
    end
end

end
