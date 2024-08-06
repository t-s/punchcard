-- main.lua

local PunchCard = require("punchcard")
local Computer = require("computer")

local backgroundColor = {0.2, 0.2, 0.2}
local punchCard, computer

function love.load()
    love.window.setMode(800, 600)
    love.graphics.setBackgroundColor(backgroundColor)
    
    local font = love.graphics.newFont("assets/VT323-Regular.ttf", 20)
    love.graphics.setFont(font)
    
    punchCard = PunchCard:new()
    computer = Computer:new()
end

function love.update(dt)
    punchCard:update(dt)
    computer:update(dt)
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf("Punch Card Programming", 0, 20, 800, "center")
    
    punchCard:draw()
    computer:draw()
end

function love.mousepressed(x, y, button)
    punchCard:mousepressed(x, y, button)
end

function love.keypressed(key)
    if key == "return" then
        computer:execute(punchCard)
    end
end