local Grid = {}

local lamb = require 'utils/lamb'

function Grid:new(width, height)
    local grid = {}
    setmetatable(grid, self)
    self.__index = self
    grid.vCels = height
    grid.hCells = width
    grid.hOffset = 16
    grid.vOffset = 12
    grid.tileWidth = 48
    grid.tileHeight = 48
    grid.contents = {}
    return grid
end

function Grid:addEntity(entity)
    lamb.push(self.contents, entity)
end

function Grid:replace(x, y, Entity)
    local index = lamb.findIndex(self.contents, function(cell)
        return cell.x == x and cell.y == y
    end)
    self.contents[index] = Entity:new(x, y)
end

function Grid:clear()
    self.contents = {}
end

function Grid:drawBoard()
    lamb.forEach(self.contents, function(entity, y) 
        local posX = self.hOffset + self.tileWidth * entity.x
        local posY = self.vOffset + self.tileHeight * entity.y
        entity:draw(posX, posY)
    end)
end

function Grid:draw(entity)
    local posX = self.hOffset + self.tileWidth * entity.x
    local posY = self.vOffset + self.tileHeight * entity.y
    entity:draw(posX, posY)
end

function Grid:find(x, y)
    return lamb.find(self.contents, function(entity)
        return entity.x == x and entity.y == y
    end)
end

return Grid
