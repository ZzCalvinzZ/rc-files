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

hs.hotkey.bind(mash.focus, "return", function()
    hs.eventtap.event.newSystemKeyEvent('PLAY', true):post()
end)

-- map up and down arrows

--hs.hotkey.bind(mash.focus, "K", function()
    --hs.eventtap.keyStroke({}, "up")
--end)

--hs.hotkey.bind(mash.focus, "J", function()
    --hs.eventtap.keyStroke({}, "down")
--end)

--reload config
hs.hotkey.bind(mash.focus, "R", function()
    hs.reload()
end)
hs.alert.show("Config loaded")

-- map for kwm
local function kwmc(cmd)
    hs.execute("/usr/local/bin/kwmc " .. cmd)
end

--map for chunkwm
local function chunk(cmd)
    hs.execute("/usr/local/bin/chunkc " .. cmd)
end

--local function refreshNerd()
    --hs.osascript.applescript('tell application "Übersicht" to refresh widget id "nerdbar-widget-mode-coffee"')
--end

--call a brew command
local function brew(args)
    local taskObj = hs.task.new("/usr/local/bin/brew", function(code, out, err)
        if code == 0 then 
            hs.alert.show('command successful')
        else
            hs.alert.show('command error')
        end
    end, function() return true end, args)
    
    taskObj:start()

    hs.alert.show('command started')
end

hs.hotkey.bind(mod1, "K", function() chunk("tiling::window --focus north") end)
hs.hotkey.bind(mod1, "J", function() chunk("tiling::window --focus south") end)
hs.hotkey.bind(mod1, "H", function() chunk("tiling::window --focus west") end)
hs.hotkey.bind(mod1, "L", function() chunk("tiling::window --focus east") end)

hs.hotkey.bind(mod2, "K", function()
                 chunk("tiling::window --use-temporary-ratio 0.1 --adjust-window-edge north") end)
hs.hotkey.bind(mod2, "J", function()
                 chunk("tiling::window --use-temporary-ratio 0.1 --adjust-window-edge south") end)
hs.hotkey.bind(mod2, "H", function()
                 chunk("tiling::window --use-temporary-ratio 0.1 --adjust-window-edge west") end)
hs.hotkey.bind(mod2, "L", function()
                 chunk("tiling::window --use-temporary-ratio 0.1 --adjust-window-edge east") end)

hs.hotkey.bind(mod2, "space", function() chunk("tiling::window --warp-floating fullscreen") end)
hs.hotkey.bind(mod1, "F", function() chunk("tiling::window --toggle fullscreen") end)

hs.hotkey.bind(mod4, "K", function() chunk("tiling::window --warp north") end)
hs.hotkey.bind(mod4, "J", function() chunk("tiling::window --warp south") end)
hs.hotkey.bind(mod4, "H", function() chunk("tiling::window --warp west") end)
hs.hotkey.bind(mod4, "L", function() chunk("tiling::window --warp east") end)

hs.hotkey.bind(mod5, "H", function() chunk("tiling::monitor -f prev") end)
hs.hotkey.bind(mod5, "L", function() chunk("tiling::monitor -f next") end)

hs.hotkey.bind(mod5, "H", function() chunk("tiling::window --send-to-monitor prev") end)
hs.hotkey.bind(mod5, "L", function() chunk("tiling::window --send-to-monitor next") end)

hs.hotkey.bind(mod1, "S", function() chunk("window -c split-mode toggle") end)
hs.hotkey.bind(mod1, "E", function() chunk("tiling::desktop --layout bsp") end)
hs.hotkey.bind(mod1, "W", function() chunk("tiling::desktop --layout monocle") end)

hs.hotkey.bind(mod2, "1", function() chunk("tiling::window --send-to-desktop 1") end)
hs.hotkey.bind(mod2, "2", function() chunk("tiling::window --send-to-desktop 2") end)
hs.hotkey.bind(mod2, "3", function() chunk("tiling::window --send-to-desktop 3") end)
hs.hotkey.bind(mod2, "4", function() chunk("tiling::window --send-to-desktop 4") end)
hs.hotkey.bind(mod2, "5", function() chunk("tiling::window --send-to-desktop 5") end)
hs.hotkey.bind(mod2, "6", function() chunk("tiling::window --send-to-desktop 6") end)
hs.hotkey.bind(mod2, "7", function() chunk("tiling::window --send-to-desktop 7") end)
hs.hotkey.bind(mod2, "8", function() chunk("tiling::window --send-to-desktop 8") end)

hs.hotkey.bind(mod1, "R", function() chunk("window -r focused") end)

--hs.hotkey.bind(mod1, "1", function() refreshNerd() end)
--hs.hotkey.bind(mod1, "2", function() refreshNerd() end)
--hs.hotkey.bind(mod1, "3", function() refreshNerd() end)
--hs.hotkey.bind(mod1, "4", function() refreshNerd() end)
--hs.hotkey.bind(mod1, "5", function() refreshNerd() end)
--hs.hotkey.bind(mod1, "6", function() refreshNerd() end)
--hs.hotkey.bind(mod1, "7", function() refreshNerd() end)
--hs.hotkey.bind(mod1, "8", function() refreshNerd() end)

hs.hotkey.bind(mod2, "Q", function()
    brew({'services', 'stop', 'chunkwm'})
end)

hs.hotkey.bind(mod2, "S", function()
    brew({'services', 'start', 'chunkwm'})
end)

hs.hotkey.bind(mod2, "R", function()
    brew({'services', 'restart', 'chunkwm'})
end)

hs.hotkey.bind(mod1, "-", function()
    local virtualbox = hs.application.get("VirtualBox VM")
    if virtualbox == nil then
        hs.alert('VM not open')
    else
        virtualbox:mainWindow():focus()
    end
end)
