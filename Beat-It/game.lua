game =
{
    load = function(self)
        -- Represent whether blocks have been enabled
        self.blocks = { false, false, false, false };

        -- Key handlers for activating and deactivating blocks
        local block1Handler =
        {
            press = function(self)
                self.blocks[1] = true;
            end,

            release = function(self)
                self.blocks[1] = false;
            end,
        };
        local block2Handler =
        {
            press = function(self)
                self.blocks[2] = true;
            end,

            release = function(self)
                self.blocks[2] = false;
            end,
        };
        local block3Handler =
        {
            press = function(self)
                self.blocks[3] = true;
            end,

            release = function(self)
                self.blocks[3] = false;
            end,
        };
        local block4Handler =
        {
            press = function(self)
                self.blocks[4] = true;
            end,

            release = function(self)
                self.blocks[4] = false;
            end,
        };

        -- Function handler for leaving the state
        local escapeHandler =
        {
            press = function(self)
                currentState = "Menu";
            end,

            release = function(self)
            end,
        };

        -- Keybind table
        self.keybinds =
        {
            ["a"] = block1Handler,
            ["s"] = block2Handler,
            ["w"] = block3Handler,
            ["d"] = block4Handler,
            ["left"] = block1Handler,
            ["down"] = block2Handler,
            ["up"] = block3Handler,
            ["right"] = block4Handler,
            ["escape"] = escapeHandler,
        };
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
        local windowWidth = love.graphics.getWidth();
        local windowHeight = love.graphics.getHeight();

        love.graphics.push();
        love.graphics.translate(Xposition, (windowHeight - hitBoxHeight - hitBoxClearance) );

        for index = 1, #self.blocks do
            if self.blocks[index] then
                love.graphics.setColor(0, 1, 0);
            else
                love.graphics.setColor(1, 0, 0);
            end

            love.graphics.rectangle("fill", (((hitBoxWidth + hitBoxClearance) * index) - hitBoxWidth), 0, hitBoxWidth, hitBoxHeight);
        end

        love.graphics.pop();

        love.graphics.setColor(1, 1, 1);
        love.graphics.rectangle("fill", (Xposition - 2), 0, hitBoxClearance, windowHeight);
        love.graphics.rectangle("fill", (windowWidth - Xposition - hitBoxClearance + 2), 0, hitBoxClearance, windowHeight);

        love.graphics.setColor(1, 1, 1);
    end,

    keyPressed = function(self, key)
        local handler = self.keybinds[key];

        if handler ~= nil then
            handler.press(self);
        end
    end,

    keyReleased = function(self, key)
        local handler = self.keybinds[key];

        if handler ~= nil then
            handler.release(self);
        end
    end
}