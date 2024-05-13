
-- 20 Hz min hearing 20kHz max
-- select octave, triave, etc
-- beginning with 20, double/triple to divide the range into octaves
-- store each in a row
-- divide each of those subranges by the EDO val
-- output a matrix which is the number of octaves long, each with the EDO number of notes

local min_hz = 20.0
local max_hz = 20000.0

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
        start = start * 2
    end
    local ntave_notes = {}
    for i, start in pairs(ntaves) do
        if i < count(ntaves) - 1 then
            print(ntaves[i])
            local fin = ntaves[i + 1] 
            print(fin)
            local range = fin - start
            local step = range/edo
            local intervals = { start }
            for n = 1, edo - 1 do
                start = start + step
                table.insert(intervals, start) 
            end
            table.insert(ntaves, intervals)
        end
    end
    return ntave_notes
end

local notes = divide_range()
for i, ntave in ipairs(notes) do
    print(i..":")
    for j, note in ipairs(ntave) do
        print(note)
    end
    print("\n")
end


-- function find_harmonies
-- function find_melodies
