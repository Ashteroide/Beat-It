-- Beat It! By Ashteroide
-- Created: 29 May, 2021

require "menu";
require "options";
require "game";

currentState = "Menu";

local states =
{
    ["Menu"] = menu,
    ["Options"] = options,
    ["Game"] = game
}

function love.load()
    for key, value in pairs(states) do
        value:load();
    end
end

function love.keypressed(key)
    states[currentState]:keyPressed(key);
end

function love.keyreleased(key)
    states[currentState]:keyReleased(key);
end

function love.update()
    states[currentState]:update();
end

function love.draw()
    states[currentState]:draw();
end