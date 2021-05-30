options =
{
    init = function()
    end,

    update = function()
    end,
    
    draw = function()
        love.graphics.print("Options Mode!");
        love.graphics.print("CursorIndex = " .. cursorIndex, 0, 10);
    end,

    keyPressed = function(key)
        if key == "escape" then
            currentState = "Menu";
        end
    end,

    keyReleased = function(key)
    end
}