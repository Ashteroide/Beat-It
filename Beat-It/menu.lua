menu =
{
    load = function(self)
        cursorIndex = 1;
        maxSongs = 3;

        songSelection = 1;

        menuOptions =
        {
            "Song 1 - Test",
            "Song 2 - Hello",
            "Song 3 - World!",

            "Options!"
        }
    end,

    update = function(self)
    end,
    
    draw = function(self)
        for index = 1, (maxSongs + 1), 1 do
            love.graphics.print("> ", 0, (cursorIndex * 12) - 12);
            love.graphics.print(menuOptions[index], 12, index * 12 - 12);
        end
    end,

    keyPressed = function(self, key)
        if key == "down" and cursorIndex < (maxSongs + 1) then
            if cursorIndex < maxSongs then
                songSelection = songSelection - 1;
            end

            cursorIndex = cursorIndex + 1;

        elseif key == "up" and cursorIndex > 1 then
            if cursorIndex > 1 then
                songSelection = songSelection + 1;
            end

            cursorIndex = cursorIndex - 1;
        end

        if key == "return" then
            if cursorIndex == 1 then
                currentState = "Game";
                game.load();
                
            elseif cursorIndex == (maxSongs + 1) then
                currentState = "Options";
                options.load();
            end
        elseif key == "escape" then
            love.event.quit();
        end
    end,
    
    keyReleased = function(self, key)
    end
}