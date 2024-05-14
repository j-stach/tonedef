
# tonedef (WIP)

I'm building a microtonal synthesizer using Arduino. 
<br>

This Lua script divides the audible range into tone intervals
based on the system of harmonic-taves and divisions provided. <br>
For example, an "octave" scale is defined by a doubling of frequency 
and a "tritave" scale is defined by a tripling of frequency. <br>
The scale is then divided into even intervals based on the EDO number,
or into even ratios based on the number of TET divisions.
<br>

This script can be embedded into the Arduino code controlling the
synth's oscillator to enable switching between multiple microtonal modes
on the fly. 
<br>

## Use
`$ lua main.lua [mode] [harmonic] [divisions]`
### Example:
```
$ cd Path/To/tonedef/src
$ lua main.lua tet 2 12
$ lua main.lua edo 3 16
```

## WIP
See TODO.md
