local application = require("hs.application")
local spaces = require("hs.spaces")

local double_press = require("ctrl_double_press")

local open_alacritty = function()
    local appName = "com.github.wez.wezterm"
    local app = application.get(appName)

    if app == nil then
        application.launchOrFocus(appName)
    elseif app:isFrontmost() then
        app:hide()
    else
        local active_space = spaces.focusedSpace()
        local alacritty_win = app:focusedWindow()
        spaces.moveWindowToSpace(alacritty_win, active_space)
        app:setFrontmost()
    end
end

double_press.timeFrame = 0.5
double_press.action = open_alacritty

hs.hotkey.bind({ "alt" }, "o", function()
    hs.execute("$HOME/.config/alacritty/bin/toggle_opacity.sh", true)
end)
