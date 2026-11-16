---------------------
---- QT / KDE ------
---------------------

-- /etc/environment forces QT_STYLE_OVERRIDE=gtk4, which prevents KDE apps
-- (Dolphin, Ark, System Settings, ...) from following kdeglobals. Override it
-- for Hyprland and let the KDE platform theme read our Material You colours.
--
-- Darkly is installed user-locally under ~/.local so it can be updated/removed
-- without touching /usr. Its Qt style plugin lives in ~/.local/lib.
local home = os.getenv("HOME")

hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("QT_STYLE_OVERRIDE", "Darkly")
hl.env("QT_PLUGIN_PATH", home .. "/.local/lib/qt6/plugins")
