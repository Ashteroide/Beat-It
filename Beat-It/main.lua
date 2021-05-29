-- Beat It! By Ashteroide
-- Created: 29 May, 2021

local currentState = "Menu";

local cursorIndex = 1;

local function runStateMenu()
end

local function runStateGame()
end

local function runStateOptions()
end

local states =
{
    Menu = runStateMenu,
    Options = runStateOptions,
	Game = runStateGame
}

local function main()
	while true do
		local stateFunction = states[currentState];

		if stateFunction ~= nil then
			stateFunction();
		end
	end
end

function love.load()
    love.window.setMode(1280, 720, { resizable = true, minwidth = 720, minheight = 360 });
end

local menuOptions =
{
    "Game!",
    "Options!"
}

function love.draw()
    if currentState == "Menu" then
        for index = 1, 2, 1 do
            love.graphics.print(menuOptions[index], 10, 10 * index);
        end

        love.graphics.print("> ", 0, cursorIndex * 10);
    end

    if currentState == "Game" then
        love.graphics.print("Game Mode!", 5, 10);
    end

    if currentState == "Options" then
        love.graphics.print("Options Mode!", 5, 10);
    end
end

function love.keypressed(key)
    if key == "return" and currentState == "Menu" then
        if cursorIndex == 1 then
            currentState = "Game";
        elseif cursorIndex == 2 then
            currentState = "Options";
        end
    elseif key == "escape" then
        if currentState == "Menu" then
            love.event.quit();
        elseif currentState == "Options" then
            currentState = "Menu";
        elseif currentState == "Game" then
            currentState = "Menu";
        end
    elseif key == "down" and cursorIndex == 1 then
        cursorIndex = cursorIndex + 1;
    elseif key == "up" and cursorIndex == 2 then
        cursorIndex = cursorIndex - 1;
    end
end