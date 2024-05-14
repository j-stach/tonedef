
-- TET stands for "Tone Equal Temperament"
-- Notes are assigned on a logarithmic scale so that adjacent notes have
-- the same frequency ratio throughout the n-tave.
-- Should result in a preservation of interval ratios for all notes?
function divideRange(harmonic, division)
    local start = min_hz
    local ntaves = {}
    while start < max_hz do
        table.insert(ntaves, start)
        start = start * harmonic
    end
    local ntave_notes = {}
    local ratio = harmonic ^ (1 / division) --
    for i = 1, #ntaves - 1 do 
        local start = ntaves[i]
        local fin = ntaves[i + 1] 
        local intervals = { start }
        for n = 1, division - 1 do
            start = start * ratio--
            table.insert(intervals, start) 
        end
        table.insert(ntave_notes, intervals)
    end
    return ntave_notes
end

return {
    divideRange = divideRange
}

