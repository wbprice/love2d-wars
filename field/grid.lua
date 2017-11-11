local Grid = {}
Grid.__index = Grid

function Grid:new()
  local grid = {}
  setmetatable(grid, self)
  self.__index = self
  grid.vCells = 12
  grid.hCells = 16
  grid.hOffset = 16
  grid.vOffset = 12
  grid.tileWidth = 48
  grid.tileHeight = 48
  grid.unitMap = {}
  grid.register = function(entity)
    entity.registerWith(grid)
    return entity
  end

  -- Initialize unit map
  for y=0,12 do
    grid.unitMap[y] = {}
      for x=0,16 do
        grid.unitMap[y][x] = {} 
      end
  end

  return grid
end

function Grid:draw()
  love.graphics.setColor(155, 155, 155, 255)

  for i=0,self.vCells do
    love.graphics.line(
      self.hOffset, 
      i * self.tileWidth + self.vOffset, 
      800 - self.hOffset, 
      i * self.tileHeight + self.vOffset
    )
  end

  for j=0,self.hCells do
    love.graphics.line(
      j * 48 + self.hOffset, 
      self.vOffset, 
      j * 48 + self.hOffset, 
      600 - self.vOffset
    )
  end

  for y, row in pairs(self.unitMap) do
    for x, entity in pairs(self.unitMap[y]) do
        if entity.draw then
            local posX = self.hOffset + (x * self.tileHeight)
            local posY = self.vOffset + (y * self.tileWidth)
            entity:draw(posX, posY)
        end
    end
  end
end

local findEntityCoords = function(entity)
  for y, row in pairs(entity.grid.unitMap) do
    for x, ent in pairs(entity.grid.unitMap[y]) do
        if ent == entity then
            return {
                ['x'] = x,
                ['y'] = y,
            }
        end
    end
  end
end

function Grid:place(entity)
    self.unitMap[entity.y][entity.x] = entity
end

function Grid:moveEntityUp(entity)
    local coords = findEntityCoords(entity)
    self.unitMap[coords.y][coords.x] = {}
    self.unitMap[coords.y - 1][coords.x] = entity
end

function Grid:moveEntityDown(entity)
    local coords = findEntityCoords(entity)
    self.unitMap[coords.y][coords.x] = {}
    self.unitMap[coords.y + 1][coords.x] = entity
end

function Grid:moveEntityLeft(entity)
    local coords = findEntityCoords(entity)
    self.unitMap[coords.y][coords.x] = {}
    self.unitMap[coords.y][coords.x - 1] = entity
end

function Grid:moveEntityRight(entity)
    local coords = findEntityCoords(entity)
    self.unitMap[coords.y][coords.x] = {}
    self.unitMap[coords.y][coords.x + 1] = entity
end

function Grid:findEntityAt(posX, posY)
    return self.unitMap[posY][posX]    
end

return Grid
