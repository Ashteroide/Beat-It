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
    love.window.setMode(1280, 720, { resizable = true, minwidth = 720, minheight = 360 });

    for key, value in pairs(states) do
        value.init();
    end
end

function love.keypressed(key)
    states[currentState].keyPressed(key);
end

function love.keyreleased(key)
    states[currentState].keyReleased(key);
end

function love.update()
    states[currentState].update();

    windowWidth = love.graphics.getWidth();
    windowHeight = love.graphics.getHeight();
end

function love.draw()
    states[currentState].draw();
end