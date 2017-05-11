require "tabletools"
--spaces = require("hs._asm.undocumented.spaces")

--padding = 0

--local wf=hs.window.filter.new():setDefaultFilter{}

local mash = {
    move    = {"ctrl", "alt", "cmd"},
    focus   = {"ctrl", "alt"},
    hyper   = {"ctrl", "cmd", "alt", "shift"},
}

local mod1 = {"alt"}
local mod2 = {"alt", "shift"}
local mod3 = {"alt", "shift", "cmd"}
local mod4 = {"alt", "ctrl"}
local mod5 = {"alt", "ctrl", "shift"}

-- lock screen
hs.hotkey.bind(mash.move, "D", function()
    hs.caffeinate.lockScreen()
end)

-- sleep screen
hs.hotkey.bind(mash.move, "S", function()
    hs.caffeinate.systemSleep()
end)


-- map up and down arrows

hs.hotkey.bind(mash.focus, "K", function()
    hs.eventtap.keyStroke({}, "up")
end)

hs.hotkey.bind(mash.focus, "J", function()
    hs.eventtap.keyStroke({}, "down")
end)

--reload config
hs.hotkey.bind(mash.focus, "R", function()
    hs.reload()
end)
hs.alert.show("Config loaded")

-- map for kwm
local function kwmc(cmd)
    hs.execute("/usr/local/bin/kwmc " .. cmd)
end

--hs.hotkey.bind(mod1, "return", function() hs.execute("open -na /Applications/iTerm.app") end)

hs.hotkey.bind(mod1, "K", function() kwmc("window -f prev") end)
hs.hotkey.bind(mod1, "J", function() kwmc("window -f next") end)
hs.hotkey.bind(mod1, "H", function() kwmc("window -f west") end)
hs.hotkey.bind(mod1, "L", function() kwmc("window -f east") end)
hs.hotkey.bind(mod1, "F", function() kwmc("window -t focus") end)


hs.hotkey.bind(mod2, "K", function() kwmc("window -s south") end)
hs.hotkey.bind(mod2, "J", function() kwmc("window -s north") end)
hs.hotkey.bind(mod2, "H", function() kwmc("window -s west") end)
hs.hotkey.bind(mod2, "L", function() kwmc("window -s east") end)

hs.hotkey.bind(mod4, "H", function() kwmc("display -f prev") end)
hs.hotkey.bind(mod4, "L", function() kwmc("display -f next") end)

hs.hotkey.bind(mod5, "H", function() kwmc("window -m display prev") end)
hs.hotkey.bind(mod5, "L", function() kwmc("window -m display next") end)

hs.hotkey.bind(mod1, "S", function() kwmc("window -c split-mode toggle") end)
hs.hotkey.bind(mod1, "N", function() kwmc("space -t bsp") end)
hs.hotkey.bind(mod1, "M", function() kwmc("space -t monocle") end)

hs.hotkey.bind(mod2, "1", function() kwmc("window -m space 1") end)
hs.hotkey.bind(mod2, "2", function() kwmc("window -m space 2") end)
hs.hotkey.bind(mod2, "3", function() kwmc("window -m space 3") end)
hs.hotkey.bind(mod2, "4", function() kwmc("window -m space 4") end)
hs.hotkey.bind(mod2, "5", function() kwmc("window -m space 5") end)
hs.hotkey.bind(mod2, "6", function() kwmc("window -m space 6") end)
hs.hotkey.bind(mod2, "7", function() kwmc("window -m space 7") end)

hs.hotkey.bind(mod1, "R", function() kwmc("window -r focused") end)

hs.hotkey.bind(mod2, "Q", function() 
    kwmc("quit")
end)

hs.hotkey.bind(mod2, "R", function() 
    kwmc("quit")
    hs.execute("brew services restart kwm")
    hs.alert.show("Kwm service restarted")
end)

