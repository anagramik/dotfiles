local eventtap = hs.eventtap
local keycode = hs.keycodes.map
local types = eventtap.event.types

-- Clear any previous tap
if keyRemapper then keyRemapper:stop() end

-- Create a new event tap that captures key down events
keyRemapper = eventtap.new({types.keyDown}, function(event)
    local keyPressed = event:getKeyCode()
    local flags = event:getFlags()
    
    -- Check if the pressed key is section sign (§/±)
    if keyPressed == 10 then
        -- Get all current modifiers
        local mods = {}
        if flags.cmd then table.insert(mods, "cmd") end
        if flags.alt then table.insert(mods, "alt") end
        if flags.ctrl then table.insert(mods, "ctrl") end
        if flags.fn then table.insert(mods, "fn") end
        
        -- Cancel the original event
        event:setType(types.nullEvent)
        
        if flags.shift then
            -- For tilde, we need to include shift in the modifiers
            table.insert(mods, "shift")
            hs.timer.usleep(1000)
            eventtap.keyStroke(mods, "`", 0) -- With shift this produces ~
        else
            -- For backtick, no shift
            hs.timer.usleep(1000)
            eventtap.keyStroke(mods, "`", 0)
        end
        
        return true -- Consume the original event
    end

    return false -- Let other events pass through
end, 999) -- Higher priority

-- Start the event tap
keyRemapper:start()
