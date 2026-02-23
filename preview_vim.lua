--Author: Emanuel Ramirez
--Date: 04/05/2020
--Vim keybindings for Preview app

--Scrolling speed
local SPEED = 2

--PDF Reader of choice
local READER = 'Preview'

--Modes
local INSERTMODE = false
local NORMALMODE = true

local appsWatcher

-- Store hotkey references for proper cleanup
local hotkeys = {}

local function enableAllKeys()
    -- Clear any existing hotkeys first
    for _, hk in ipairs(hotkeys) do
        hk:delete()
    end
    hotkeys = {}

    --Enable Keybind: Scroll Left
    table.insert(hotkeys, hs.hotkey.bind({}, 'h',
    function()
        hs.eventtap.scrollWheel({SPEED, 0}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({SPEED, 0}, {})
    end))

    --Enable Keybind: Scroll Down
    table.insert(hotkeys, hs.hotkey.bind({}, 'j',
    function()
        hs.eventtap.scrollWheel({0, -SPEED}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({0, -SPEED}, {})
    end))

    --Enable Keybind: Scroll Up
    table.insert(hotkeys, hs.hotkey.bind({}, 'k',
    function()
        hs.eventtap.scrollWheel({0, SPEED}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({0, SPEED}, {})
    end))

    --Enable Keybind: Scroll Right
    table.insert(hotkeys, hs.hotkey.bind({}, 'l',
    function()
        hs.eventtap.scrollWheel({-SPEED, 0}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({-SPEED, 0}, {})
    end))

    --Enable Keybing: Bottom of PDF
    table.insert(hotkeys, hs.hotkey.bind({'shift'}, 'g',
    function()
        hs.eventtap.keyStroke({'cmd'}, 'Down')
    end))

    --Enable Keybind: Move to Top of PDF
    table.insert(hotkeys, hs.hotkey.bind({}, 'g',
    function()
        hs.eventtap.keyStroke({'cmd'}, 'Up')
    end))

    --Enable Keybind: Scrool one page foward
    table.insert(hotkeys, hs.hotkey.bind({'ctrl'}, 'f',
    function()
        hs.eventtap.keyStroke({}, 'Right')
    end,nil,
    function()
        hs.eventtap.keyStroke({}, 'Right')
    end))

    --Enable Keybind: Scrool one page backwards
    table.insert(hotkeys, hs.hotkey.bind({'ctrl'}, 'b',
    function()
        hs.eventtap.keyStroke({}, 'Left')
    end,nil,
    function()
        hs.eventtap.keyStroke({}, 'Left')
    end))
end

local function disableScrollingKeys()
    -- Properly delete all hotkeys
    for _, hk in ipairs(hotkeys) do
        if hk then
            hk:delete()
        end
    end
    hotkeys = {}
end

local function disableAllKeys()
    disableScrollingKeys()
end

local function enableInsertKey()
    --Enable insert key when in Normal mode
    table.insert(hotkeys, hs.hotkey.bind({}, 'i',
    function()
        if NORMALMODE then
            hs.alert.show('INSERT')
            INSERTMODE = true
            NORMALMODE = false
            disableScrollingKeys()
        end
    end,nil, nil))
end

local function previewWatcher(name, event, app)
    --If preview application is being focused watch for VIM keybinds
    if (name == READER and event == hs.application.watcher.activated) then
        -- Start in NORMAL mode
        NORMALMODE = true
        INSERTMODE = false

        --Enable Keybind: Enter Normal Mode
        table.insert(hotkeys, hs.hotkey.bind({}, 'escape',
        function()
            if INSERTMODE then
                hs.alert.show('NORMAL')
                NORMALMODE = true
                INSERTMODE = false
                disableScrollingKeys()
                enableAllKeys()
            end
        end,nil, nil))

        --Enable Keybind: Enter Insert Mode
        table.insert(hotkeys, hs.hotkey.bind({}, 'i',
        function()
            if NORMALMODE then
                hs.alert.show('INSERT')
                INSERTMODE = true
                NORMALMODE = false
                disableScrollingKeys()
            end
        end,nil, nil))

        enableAllKeys()
    end

    --Disable all VIM keybinds when Preview application is NOT focused
    if (name == READER and event == hs.application.watcher.deactivated) then
        disableAllKeys()
    end
end

-- Initialize the watcher
appsWatcher = hs.application.watcher.new(previewWatcher)
appsWatcher:start()
