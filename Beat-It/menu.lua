menu =
{
    load = function(self)
        self.menuLogo = 
        {
            image = love.graphics.newImage("images/menuLogo.png"),
            width = 252,
            height = 61,
            clearance = 5
        }

        self.cursorIndex = 1;

        self.songSelection = 1;

        self.songOptions =
        {
            "Song 1 - Test",
            "Song 2 - Hello",
            "Song 3 - World!",
            "Song 4 - New!"
        }

        self.menuOptions =
        {
            "Options!",
            "Leave Game!"
        }
    end,

    update = function(self)
        self.windowWidth = love.graphics.getWidth();
        self.windowHeight = love.graphics.getHeight();
    end,
    
    draw = function(self)
        love.graphics.draw(self.menuLogo.image, ((self.windowWidth - self.menuLogo.width) / 2), self.menuLogo.clearance);

        for index = 1, 4 do
            love.graphics.rectangle(
                "line",
                (index * (self.windowWidth / 4) - (self.windowWidth / 4)),
                (self.menuLogo.height + (self.menuLogo.clearance * 2)),
                (self.windowWidth / 4),
                10
            );
        end

        local xDistanceFromLogo = ( (self.menuLogo.height + self.menuLogo.clearance) + (self.menuLogo.clearance * 2) + 12 );

        love.graphics.print("Songs!", 0, xDistanceFromLogo);

        love.graphics.print("> ", 0, ((self.cursorIndex * 12) + xDistanceFromLogo));

        for index = 1, #self.songOptions do
            love.graphics.print(self.songOptions[index], 16, ((index * 12) + xDistanceFromLogo));
        end

        for index = 1, #self.menuOptions do
            love.graphics.print(self.menuOptions[index], 12, ((index * 12) + xDistanceFromLogo + (#self.songOptions * 12)));
        end
    end,

    keyPressed = function(self, key)
        if key == "down" and self.cursorIndex < (#self.songOptions + #self.menuOptions) then
            if self.cursorIndex < #self.songOptions then
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
                
            elseif self.cursorIndex == (#self.songOptions + #self.menuOptions - 1) then
                currentState = "Options";
                options:load();
            elseif self.cursorIndex == (#self.songOptions + #self.menuOptions) then
                love.event.quit();
            end
        elseif key == "escape" then
            love.event.quit();
        end
    end,
    
    keyReleased = function(self, key)
    end
}