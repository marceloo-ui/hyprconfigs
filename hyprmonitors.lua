-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- MONITOR LAYOUT                                        --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- HDMI-A-1 (AOC 22B30HM23) -- main landscape monitor, left side
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@120",
    position = "0x0",
    scale    = 1,
    transform = 0,
})

-- DP-1 (TXD VGA) -- secondary portrait monitor, left side
-- The panel only advertises 1600x900@59.98, so that is used instead of
-- 1600x800. transform = 3 rotates it 90 degrees counter-clockwise (portrait).
hl.monitor({
    output   = "DP-1",
    mode     = "1600x900@59.98",
    position = "auto-left",
    scale    = 1,
    transform = 3,
})


-- Fallback rule for any monitor not matched above.
-- Keep this last so the specific rules above win.
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})
