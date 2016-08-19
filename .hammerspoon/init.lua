padding = 20

local mash = {
  move    = {"ctrl", "alt", "cmd"},
  focus   = {"ctrl", "cmd"},
  hyper   = {"ctrl", "cmd", "alt", "shift"},
}

-------------------------------------------------------------------------------------
-- move window left
hs.hotkey.bind(mash.move, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + padding
  f.y = max.y + padding
  f.w = (max.w / 2) - padding
  f.h = max.h - padding * 2
  win:setFrame(f)
end)

-- move window right
hs.hotkey.bind(mash.move, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y + padding
  f.w = (max.w / 2) - padding
  f.h = max.h - padding * 2
  win:setFrame(f)
end)

--fullscreen window
hs.hotkey.bind(mash.move, "M", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + padding
  f.y = max.y + padding
  f.w = max.w - padding * 2
  f.h = max.h - padding * 2
  win:setFrame(f)
end)
-------------------------------------------------------------------------------------

--switch windows on same screen
hs.hotkey.bind(mash.focus, "B", function()
  local win = hs.window.focusedWindow():sendToBack()
end)

-------------------------------------------------------------------------------------


-- lock screen
hs.hotkey.bind(mash.move, "D", function()
    hs.caffeinate.lockScreen()
end)

-- sleep screen
hs.hotkey.bind(mash.move, "S", function()
    hs.caffeinate.systemSleep()
end)

-------------------------------------------------------------------------------------
--Bring focus to next display/screen

local map = {
    previous = "L",
    next = "H",
}

function bindFocusDisplays()
    hs.hotkey.bind(mash.focus, map.previous, function ()
      focusScreen(hs.window.focusedWindow():screen():next())
    end)

    --Bring focus to previous display/screen
    hs.hotkey.bind(mash.focus, map.next, function() 
      focusScreen(hs.window.focusedWindow():screen():previous())
    end)
end

--Predicate that checks if a window belongs to a screen
function isInScreen(screen, win)
  return win:screen() == screen
end

-- Brings focus to the scren by setting focus on the front-most application in it.
-- Also move the mouse cursor to the center of the screen. This is because
-- Mission Control gestures & keyboard shortcuts are anchored, oddly, on where the
-- mouse is focused.
function focusScreen(screen)
  --Get windows within screen, ordered from front to back.
  --If no windows exist, bring focus to desktop. Otherwise, set focus on
  --front-most application window.
  local windows = hs.fnutils.filter(
      hs.window.orderedWindows(),
      hs.fnutils.partial(isInScreen, screen))
  local windowToFocus = #windows > 0 and windows[1] or hs.window.desktop()
  windowToFocus:focus()
  hs.window.frontmostWindow():focus()
end

bindFocusDisplays()

--rebind focus screen commands
hs.hotkey.bind(mash.focus, "S", function() 
    for key, value in pairs(map) do
        if value == "L" then
            map[key] = "H"
        elseif value == "H" then
            map[key] = "L"
        end
    end
    bindFocusDisplays()
end)

-------------------------------------------------------------------------------------

-- border

border = nil

function drawBorder()
    if border then
        border:delete()
    end

    local win = hs.window.focusedWindow()
    if win == nil then return end

    local f = win:frame()
    local fx = f.x - 2
    local fy = f.y - 2
    local fw = f.w + 4
    local fh = f.h + 4

    border = hs.drawing.rectangle(hs.geometry.rect(fx, fy, fw, fh))
    border:setStrokeWidth(4)
    border:setStrokeColor({["red"]=0.75,["blue"]=0.14,["green"]=0.83,["alpha"]=0.80})
    border:setRoundedRectRadii(5.0, 5.0)
    border:setStroke(true):setFill(false)
    border:setLevel("floating")
    border:show()
end

drawBorder()

windows = hs.window.filter.new(nil)
windows:subscribe(hs.window.filter.windowFocused, function () drawBorder() end)
windows:subscribe(hs.window.filter.windowUnfocused, function () drawBorder() end)
windows:subscribe(hs.window.filter.windowMoved, function () drawBorder() end)

-------------------------------------------------------------------------------------

--fullscreen stuff

hs.hotkey.bind(mash.focus, "F", function()
    
    for key, window in pairs(hs.window.filter.new{'Google Chrome', override={fullscreen=true}}) do 
        if window:isFullScreen() then
            print 'hi'
            window:focus()
        end
    end
end)

-------------------------------------------------------------------------------------

-- map up and down arrows

hs.hotkey.bind(mash.focus, "K", function()
    hs.eventtap.keyStroke({}, "up")
end)

hs.hotkey.bind(mash.focus, "J", function()
    hs.eventtap.keyStroke({}, "down")
end)

-------------------------------------------------------------------------------------

-- timer
function SecondsToClock(seconds)
    local seconds = tonumber(seconds)

    if seconds <= 0 then
        return "00:00:00";
    else
        hours = string.format("%02.f", math.floor(seconds/3600));
        mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
        secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
        return hours..":"..mins..":"..secs
    end
end

local stopwatchCount = 0

function stopwatchFunction()
    hs.notify.new(nil, {
        title = 'Timer',
        informativeText = SecondsToClock(stopwatchCount),
    }):send()

    stopwatchCount = stopwatchCount + 1

end

local stopwatch = hs.timer.new(1, stopwatchFunction)

hs.hotkey.bind(mash.move, "T", function()
    if stopwatch:running() then
        stopwatchCount = 0
        hs.notify.withdrawAll()
        stopwatch:stop()
    else
        stopwatchFunction()
        stopwatch:start()
    end
end)

hs.hotkey.bind(mash.focus, "J", function()
    hs.eventtap.keyStroke({}, "down")
end)

-------------------------------------------------------------------------------------
    
--reload config
hs.hotkey.bind({"cmd", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")
