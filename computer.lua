-- computer.lua

local Computer = {}

function Computer:new()
    local comp = {
        output = "",
        x = 50,
        y = 450,
        width = 700,
        height = 120,
        bgColor = {0.1, 0.1, 0.1},
        textColor = {0, 1, 0}
    }
    setmetatable(comp, self)
    self.__index = self
    return comp
end

function Computer:update(dt)
end

function Computer:draw()
    -- Draw computer screen
    love.graphics.setColor(self.bgColor)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, 5, 5)
    
    love.graphics.setColor(self.textColor)
    love.graphics.printf(self.output, self.x + 10, self.y + 10, self.width - 20)
    
    love.graphics.setColor(0.3, 0.8, 0.3)
    love.graphics.rectangle("fill", 650, 400, 100, 30, 5, 5)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("Execute", 650, 405, 100, "center")
end

function Computer:execute(punchCard)
    local count = 0
    for i = 1, punchCard.rows do
        for j = 1, punchCard.columns do
            if punchCard.grid[i][j] then
                count = count + 1
            end
        end
    end
    self.output = "Executed punch card\nPunched holes: " .. count
end

return Computer