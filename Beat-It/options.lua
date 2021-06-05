options =
{
    load = function(self)
        cursorIndex = 1;
    end,

    update = function(self)
    end,
    
    draw = function(self)
        love.graphics.print("Options Mode!");
        love.graphics.print("CursorIndex = " .. cursorIndex, 0, 10);
    end,

    keyPressed = function(self, key)
        if key == "escape" then
            currentState = "Menu";
        end
    end,

    keyReleased = function(self, key)
    end
}