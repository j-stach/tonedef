
-- How to analyze intervals to determine the possibility of these ratios?

function calculateIntervals(notes)
    local intervals = {}
    for n, note in pairs(notes) do
        intervals[n] = note / notes[1] -- TODO approx ratios? (to fraction)
    end
    return intervals
end

-- NOTE: Experiment? with a pub/priv name convention
function decimal_to_ratio(dec) 
    -- turn 1.xx decimal into string describing approximate ratio
    -- what is the tolerance for "closeness"?
    -- how does the ear judge when an approximal tone sounds pleasant?
--local function to_frac(num)      
    -- COPY PASTA, figure this out before using
    local W = math.floor(dec)   -- Whole component
    local F = num - W           -- Fraction component
    local pn, n, N = 0, 1       -- Numerator       
    local pd, d, D = 1, 0       -- Denominator
    local x, err, q, Q          -- ????
    repeat                         
        x = x and 1 / (x - q) or F  --- ??
        q, Q = math.floor(x), math.floor(x + 0.5)
        -- this part probly creates the fraction minus the remainder
        pn, n, N = n, q*n + pn, Q*n + pn         
        pd, d, D = d, q*d + pd, Q*d + pd         
        err = F - N/D            -- Remainder?
    until math.abs(err) < 1e-10  -- while remainder is significant
    return N + D*W, D, err      -- return continued fraction 
--end                                                                       
--                                                                          
--local function print_frac(numer,denom)   
--   print(string.format("%.14g/%d = %d/%d + %g", numer, denom, to_frac(nume
--r/denom)))                                    
-- end
end


-- TODO mathematical approach
    -- for each note
    -- determine what the frequency ratio is for each combination
    -- can it be factored?
    -- ntave will automatically be included, so ntave:1 is always a ratio
    -- regardless of edo or tet
-- TBD Can the logarithms ever be factored out/simplified?
-- Or does that defeat the purpose?
-- Is it actually about the number and ratio of steps?

return {
    calculateIntervals = calculateIntervals
}
