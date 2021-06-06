game =
{
    load = function(self)
        -- Key Pattern: Left, Down, Up, Right
        self.keys = { false, false, false, false, false, false, false, false };
        self.printKeys = { "a", "s", "w", "d", "left", "down", "up", "right" };
    end,

    update = function(self)
        local windowWidth = love.graphics.getWidth();
        local windowHeight = love.graphics.getHeight();

        hitBoxWidth = windowWidth / 8;
        hitBoxHeight = 10;
        hitBoxClearance = 5;

        Xposition = (windowWidth / 4) - (hitBoxClearance * 2.5);
    end,

    draw = function(self)
        love.graphics.print("Game Mode!");

        for index = 1, #self.keys do
            if self.keys[index] == true then
                love.graphics.setColor(1, 1, 1);
                love.graphics.print(self.printKeys[index] .. "!", 0, (index * 12));
            end
        end

        local windowWidth = love.graphics.getWidth();
        local windowHeight = love.graphics.getHeight();

        love.graphics.translate( Xposition, (windowHeight - hitBoxHeight - hitBoxClearance) );

        for index = 1, 4, 1 do
            if self.keys[index] == true or self.keys[index + 4] == true then
                love.graphics.setColor(0, 1, 0);
                love.graphics.rectangle("fill", (((hitBoxWidth + hitBoxClearance) * index) - hitBoxWidth), 0, hitBoxWidth, hitBoxHeight);
            else
                love.graphics.setColor(1, 0, 0);
                love.graphics.rectangle("fill", (((hitBoxWidth + hitBoxClearance) * index) - hitBoxWidth), 0, hitBoxWidth, hitBoxHeight);
            end
        end

        love.graphics.translate(-Xposition, -(windowHeight - hitBoxHeight - hitBoxClearance));

        love.graphics.setColor(1, 1, 1);
        love.graphics.rectangle("fill", (Xposition - 2), 0, hitBoxClearance, windowHeight);
        love.graphics.rectangle("fill", (windowWidth - Xposition - hitBoxClearance + 2), 0, hitBoxClearance, windowHeight);

        love.graphics.setColor(1, 1, 1);
    end,

    keyPressed = function(self, key)
        if key == "escape" then
            currentState = "Menu";
        end

        for index = 1, #self.keys do
            if key == self.printKeys[index] then
                self.keys[index] = true;
            end
        end
    end,

    keyReleased = function(self, key)
        for index = 1, #self.keys do
            if key == self.printKeys[index] then
                self.keys[index] = false;
            end
        end
    end
}