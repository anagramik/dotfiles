local eventtap = hs.eventtap
local keycode = hs.keycodes.map
local types = eventtap.event.types

-- Clear any previous tap
if keyRemapper then keyRemapper:stop() end

-- Create a new event tap that captures both key down and flags changed events
keyRemapper = eventtap.new({types.keyDown, types.flagsChanged}, function(event)
    local keyPressed = event:getKeyCode()
    local flags = event:getFlags()
    local eventType = event:getType()

    -- Only process key down events
    if eventType == types.keyDown then
        -- Check if the pressed key is section sign (§/±)
        if keyPressed == 10 then
            -- Replace with backtick/tilde based on shift state
            if flags.shift then
                -- Generate tilde (~)
                eventtap.keyStroke({"shift"}, "`")
            else
                -- Generate backtick (`)
                eventtap.keyStroke({}, "`")
            end
            return true -- Consume the original event
        end
    end

    return false -- Let other events pass through
end)

-- Start the event tap
keyRemapper:start()
