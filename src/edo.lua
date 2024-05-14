
-- EDO stands for "Equal Division of the Octave"
-- Adjacent notes have equal steps in terms of frequency,
-- but are variable in terms of frequency ratios.
-- The harmonic note will have ratio relationships preserved,
-- but the more steps away that are taken, the less justified the ratios become.

-- TODO DRY this out. Look into combining EDO and TET back into single mod.
function divideRange(harmonic, division)
    local start = min_hz
    local ntaves = {}
    while start < max_hz do
        table.insert(ntaves, start)
        start = start * harmonic
    end
    local ntave_notes = {}
    for i = 1, #ntaves - 1 do
        local start = ntaves[i]
        local fin = ntaves[i + 1] 
        local step = (fin - start) / division --
        local intervals = { start }
        for n = 1, division - 1 do
            start = start + step --
            table.insert(intervals, start) 
        end
        table.insert(ntave_notes, intervals)
    end
    return ntave_notes
end

return {
    divideRange = divideRange
}
