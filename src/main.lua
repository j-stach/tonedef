
local min_hz = 20
local max_hz = 20000

local ntave = tonumber(arg[1])
local edo = tonumber(arg[2])

function count(ntaves) 
    local count = 0
    for _ in pairs(ntaves) do count = count + 1 end
    return count
end

function divide_range()
    local start = min_hz
    local ntaves = {}
    while start < max_hz do
        table.insert(ntaves, start)
        start = start * ntave
    end
    local ntave_notes = {}
    for i = 1, #ntaves - 1 do
        local start = ntaves[i]
        local fin = ntaves[i + 1] 
        local step = (fin - start) / edo
        local intervals = { start }
        for n = 1, edo - 1 do
            start = start + step
            table.insert(intervals, start) 
        end
        table.insert(ntave_notes, intervals)
    end
    return ntave_notes
end

-- TODO this gets its own function
local notes = divide_range()
for i = 1, #notes do
    io.write(i..": ")
    for j = 1, #notes[i] do
        local freq = string.format("%.2f", notes[i][j])
        io.write(freq.."Hz ")
    end
    io.write("\n")
end


