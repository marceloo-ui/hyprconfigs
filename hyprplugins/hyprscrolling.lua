

hl.config({
    scrolling = {
        direction = "right",
        column_width = 0.5,
        explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
        focus_fit_method = 1,
        follow_focus = 1,
        follow_min_visible = 0.4,
        wrap_focus = true,
        wrap_swapcol = true,
        fullscreen_on_one_column = true,
    },
})

local mainMod = "SUPER"
local function toggle_scrolling()
    local current = hl.get_config("general.layout")
    local target  = (current == "scrolling") and "dwindle" or "scrolling"

    hl.config({ general = { layout = target } })
    hl.notification.create({ text = "Layout: " .. target, duration = 1500 })
end

hl.bind(mainMod .. " + L", toggle_scrolling)
-- idk change it later
hl.bind(mainMod .. " + ALT + left",          hl.dsp.layout("focus l"))
hl.bind(mainMod .. " + ALT + right",         hl.dsp.layout("focus r"))
hl.bind(mainMod .. " + ALT + SHIFT + left",  hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + ALT + SHIFT + right", hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + ALT + SHIFT + C",     hl.dsp.layout("center"))
hl.bind(mainMod .. " + ALT + F",             hl.dsp.layout("fit active"))
hl.bind(mainMod .. " + ALT + equal",         hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + ALT + minus",         hl.dsp.layout("colresize -conf"))
