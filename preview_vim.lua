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

local function enableAllKeys()
    --Enable Keybind: Scroll Left
    hs.hotkey.bind({}, 'H',
    function()
        hs.eventtap.scrollWheel({SPEED, 0}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({SPEED, 0}, {})
    end)

    --Enable Keybind: Scroll Down
    hs.hotkey.bind({}, 'J',
    function()
        hs.eventtap.scrollWheel({0, -SPEED}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({0, -SPEED}, {})
    end)

    --Enable Keybind: Scroll Up
    hs.hotkey.bind({}, 'K',
    function()
        hs.eventtap.scrollWheel({0, SPEED}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({0, SPEED}, {})
    end)

    --Enable Keybind: Scroll Right
    hs.hotkey.bind({}, 'L',
    function()
        hs.eventtap.scrollWheel({-SPEED, 0}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({-SPEED, 0}, {})
    end)

    --Enable Keybing: Bottom of PDF
    hs.hotkey.bind({'shift'}, 'G',
    function()
        hs.eventtap.keyStroke({'cmd'}, 'Down')
    end)

    --Enable Keybind: Move to Top of PDF
    hs.hotkey.bind({}, 'G',
    function()
        hs.eventtap.keyStroke({'cmd'}, 'Up')
    end)

    --Enable Keybind: Scrool one page foward
    hs.hotkey.bind({'ctrl'}, 'F',
    function()
        hs.eventtap.keyStroke({}, 'Right')
    end,nil,
    function()
        hs.eventtap.keyStroke({}, 'Right')
    end)

    --Enable Keybind: Scrool one page backwards
    hs.hotkey.bind({'ctrl'}, 'B',
    function()
        hs.eventtap.keyStroke({}, 'Left')
    end,nil,
    function()
        hs.eventtap.keyStroke({}, 'Left')
    end)
end

local function disableScrollingKeys()
    --Disable: Scroll Left Keybind
    hs.hotkey.disableAll({}, 'H')

    --Disable: Scroll Down Keybind
    hs.hotkey.disableAll({}, 'J')

    --Disable: Scroll Up Keybind
    hs.hotkey.disableAll({}, 'K')

    --Disable: Scroll Right Keybind
    hs.hotkey.disableAll({}, 'L')

    --Disable: Bottom of PDF Keybind
    hs.hotkey.disableAll({'shift'}, 'G')

    --Disable: Top of PDF Keybind
    hs.hotkey.disableAll({}, 'G')

    --Disable: Scrool one page foward keybind
    hs.hotkey.disableAll({'ctrl'}, 'F')

    --Disable: Scrool one page backward keybind
    hs.hotkey.disableAll({'ctrl'}, 'B')
end

local function disableAllKeys()
    disableScrollingKeys()
    hs.hotkey.disableAll({}, 'ESCAPE')
    hs.hotkey.disableAll({}, 'I')
end

local function enableInsertKey()
    --Enable insert key when in Normal mode
    hs.hotkey.bind({}, 'I',
    function()
        if NORMALMODE then
            hs.alert.show('INSERT')
            INSERTMODE = true
            NORMALMODE = false
            hs.hotkey.disableAll({}, 'I')
            disableScrollingKeys()
        end
    end,nil, nil)
end

local function previewWatcher(name, event, app)
    --If preview application is being focused watch for VIM keybinds
    if (name == READER and event == hs.application.watcher.activated) then
        --Enable Keybind: Enter Normal Mode
        hs.hotkey.bind({}, 'ESCAPE',
        function()
            if INSERTMODE then
                hs.alert.show('NORMAL')
                NORMALMODE = true
                INSERTMODE = false
                enableInsertKey()
                enableAllKeys()
            end
        end,nil, nil)

        --Enable Keybind: Enter Insert Mode
        hs.hotkey.bind({}, 'I',
        function()
            if NORMALMODE then
                hs.alert.show('INSERT')
                INSERTMODE = true
                NORMALMODE = false
                hs.hotkey.disableAll({}, 'I')
                disableScrollingKeys()
            end
        end,nil, nil)

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
