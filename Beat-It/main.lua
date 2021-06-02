-- Beat It! By Ashteroide
-- Created: 29 May, 2021

require "menu";
require "options";
require "game";

currentState = "Menu";

local maxStates = 3; -- Must be changed when new states are added

local states =
{
    "Menu",
    "Options",
    "Game",

    menu,
    options,
    game
}

function love.load()
    love.window.setMode(1280, 720, { resizable = true, minwidth = 720, minheight = 360 });

    for index = 1, maxStates, 1 do
        states[index + maxStates].init();
    end
end

function love.keypressed(key)
    for index = 1, maxStates, 1 do
        if currentState == states[index] then
            states[index + maxStates].keyPressed(key);
        end
    end
end

function love.keyreleased(key)
    for index = 1, maxStates, 1 do
        if currentState == states[index] then
            states[index + maxStates].keyReleased(key);
        end
    end
end

function love.update()
    for index = 1, maxStates, 1 do
        if currentState == states[index] then
            states[index + maxStates].update();
        end
    end

    windowWidth = love.graphics.getWidth();
    windowHeight = love.graphics.getHeight();
end

function love.draw()
    for index = 1, maxStates, 1 do
        if currentState == states[index] then
            states[index + maxStates].draw();
        end
    end
end