
min_hz = 20
max_hz = 20000
-- TODO Changeable reference frequency (eg A4 = 440)

local edo = require("edo")
local tet = require("tet")
local int = require("intervals")

local mode = tostring(arg[1])
local harmonic = tonumber(arg[2])
local division = tonumber(arg[3])
local options = arg[4] -- TODO allow multiple options

local notes = {}
-- TODO: divideRange functions are very similar, try to DRY
if string.match(mode, "edo") then
    notes = edo.divideRange(harmonic, division)
elseif string.match(mode, "tet") then
    notes = tet.divideRange(harmonic, division)
else
    io.write("Please provide a valid division scheme: 'edo' or 'tet'")
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

if string.match(tostring(options), "--intervals") then
    local intervals = int.calculateIntervals(notes[1])
    for _, interval in pairs(intervals) do
        io.write(interval..", ")
    end
    io.write("\n")
end


