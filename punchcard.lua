-- punchcard.lua

local PunchCard = {}

function PunchCard:new()
    local card = {
        grid = {},
        columns = 12,
        rows = 8,
        x = 50,
        y = 70,
        cellSize = 40,
        cardColor = {0.9, 0.85, 0.7},
        holeColor = {0.3, 0.3, 0.3},
        punchedColor = {0.1, 0.1, 0.1}
    }
    setmetatable(card, self)
    self.__index = self
    card:initGrid()
    return card
end

function PunchCard:initGrid()
    for i = 1, self.rows do
        self.grid[i] = {}
        for j = 1, self.columns do
            self.grid[i][j] = false
        end
    end
end

function PunchCard:update(dt)
end

function PunchCard:draw()
    love.graphics.setColor(self.cardColor)
    love.graphics.rectangle("fill", self.x - 10, self.y - 10, 
        self.columns * self.cellSize + 20, self.rows * self.cellSize + 20, 10, 10)
    
    for i = 1, self.rows do
        for j = 1, self.columns do
            local x = self.x + (j-1) * self.cellSize
            local y = self.y + (i-1) * self.cellSize
            
            if self.grid[i][j] then
                love.graphics.setColor(self.punchedColor)
            else
                love.graphics.setColor(self.holeColor)
            end
            
            love.graphics.circle("fill", x + self.cellSize/2, y + self.cellSize/2, self.cellSize/3)
        end
    end
    
    love.graphics.setColor(0.5, 0.5, 0.5, 0.5)
    for i = 0, self.rows do
        love.graphics.line(self.x, self.y + i * self.cellSize, 
            self.x + self.columns * self.cellSize, self.y + i * self.cellSize)
    end
    for j = 0, self.columns do
        love.graphics.line(self.x + j * self.cellSize, self.y, 
            self.x + j * self.cellSize, self.y + self.rows * self.cellSize)
    end
end

function PunchCard:mousepressed(x, y, button)
    local col = math.floor((x - self.x) / self.cellSize) + 1
    local row = math.floor((y - self.y) / self.cellSize) + 1
    if col >= 1 and col <= self.columns and row >= 1 and row <= self.rows then
        self.grid[row][col] = not self.grid[row][col]
    end
end

return PunchCard