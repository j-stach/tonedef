
min_hz = 20
max_hz = 20000
-- TODO Changeable reference frequency (eg A4 = 440)

local edo = require("edo")
local tet = require("tet")

local mode = tostring(arg[1])
local harmonic = tonumber(arg[2])
local division = tonumber(arg[3])

local notes = {}
-- TODO: divideRange functions are very similar, try to DRY
if string.match(mode, "edo") then
    notes = edo.divideRange(harmonic, division)
elseif string.match(mode, "tet") then
    notes = tet.divideRange(harmonic, division)
end

-- TODO Export to some object or file?
-- For now, print them to the terminal.
for i = 1, #notes do
    io.write(i..": ")
    for j = 1, #notes[i] do
        local freq = string.format("%.2f", notes[i][j])
        io.write(freq.."Hz ")
    end
    io.write("\n")
end


