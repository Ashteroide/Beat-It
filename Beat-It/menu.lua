menu =
{
    init = function()
        cursorIndex = 1;

        menuOptions =
        {
            "Game!",
            "Options!"
        }
    end,

    update = function()
    end,
    
    draw = function()
        for index = 1, 2, 1 do
            love.graphics.print("> ", 0, (cursorIndex * 10) - 10);
            love.graphics.print(menuOptions[index], 10, index * 10 - 10);
        end
    end,

    keyPressed = function(key)
        if key == "down" and cursorIndex < 2 then
            cursorIndex = cursorIndex + 1;
        elseif key == "up" and cursorIndex > 1 then
            cursorIndex = cursorIndex - 1;
        end

        if key == "return" then
            if cursorIndex == 1 then
                currentState = "Game";
            elseif cursorIndex == 2 then
                currentState = "Options";
                cursorIndex = 1;
            end
        elseif key == "escape" then
            love.event.quit();
        end
    end,
    
    keyReleased = function(key)
    end
}