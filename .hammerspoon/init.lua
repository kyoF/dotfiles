local application = require("hs.application")
local spaces = require("hs.spaces")

local double_press = require("ctrlDoublePress")

local open_alacritty = function()
	local appName = "Alacritty"
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

hs.hotkey.bind({ "cmd" }, "u", function()
	hs.execute("toggle_opacity.sh", true)
end)
