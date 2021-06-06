menu =
{
    load = function(self)
        self.cursorIndex = 1;

        self.songSelection = 1;

        self.menuOptions =
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
        for index = 1, #self.menuOptions do
            love.graphics.print("> ", 0, (self.cursorIndex * 12) - 12);
            love.graphics.print(self.menuOptions[index], 12, index * 12 - 12);
        end
    end,

    keyPressed = function(self, key)
        if key == "down" and self.cursorIndex < #self.menuOptions then
            if self.cursorIndex < (#self.menuOptions - 1) then
                self.songSelection = self.songSelection - 1;
            end

            self.cursorIndex = self.cursorIndex + 1;

        elseif key == "up" and self.cursorIndex > 1 then
            if self.cursorIndex > 1 then
                self.songSelection = self.songSelection + 1;
            end

            self.cursorIndex = self.cursorIndex - 1;
        end

        if key == "return" then
            if self.cursorIndex == 1 then
                currentState = "Game";
                game:load();
                
            elseif self.cursorIndex == #self.menuOptions then
                currentState = "Options";
                options:load();
            end
        elseif key == "escape" then
            love.event.quit();
        end
    end,
    
    keyReleased = function(self, key)
    end
}