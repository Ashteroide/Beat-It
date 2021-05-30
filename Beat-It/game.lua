game =
{
    init = function()
        keys = { W, A, S, D };
        printKeys = { "w", "a", "s", "d" };
    end,

    update = function()
    end,

    draw = function()
        love.graphics.print("Game Mode!");

        for index = 1, 4, 1 do
            if keys[index] == true then
                love.graphics.print(printKeys[index] .. "!", (index * 12) - 12, 10);
            end
        end
    end,

    keyPressed = function(key)
        if key == "escape" then
            currentState = "Menu";
        end

        for index = 1, 4, 1 do
            if key == printKeys[index] then
                keys[index] = true;
            end
        end
    end,

    keyReleased = function(key)
        for index = 1, 4, 1 do
            if key == printKeys[index] then
                keys[index] = false;
            end
        end
    end
}