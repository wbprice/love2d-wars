local Grid = {}

function Grid:new(width, height)
  local grid = {}
  setmetatable(grid, self)
  self.__index = self
  grid.vCells = width or 12
  grid.hCells = height or 16
  grid.hOffset = width or 16
  grid.vOffset = height or 12
  grid.tileWidth = 48
  grid.tileHeight = 48
  grid.cells = {}

  grid.getCell = function(x, y)
    return grid.cells[y][x]
  end

  -- Initialize cells with null values
  for y=0,(width or 12) - 1 do
    grid.cells[y] = {}
      for x=0,(height or 16) - 1 do
        grid.cells[y][x] = nil
      end
  end

  return grid
end

function Grid:getEntity(x, y)
  return self.cells[y][x]
end

function Grid:place(entity, x, y)
  entity.grid = self
  self.cells[y][x] = entity
end

function Grid:moveEntityUp(entity)
  if entity.y > 0 then
    self.cells[entity.y][entity.x] = nil
    entity.y = entity.y - 1
    self.cells[entity.y][entity.x] = entity
  end
end

function Grid:moveEntityDown(entity)
  if entity.y < self.vCells - 1 then
    self.cells[entity.y][entity.x] = nil
    entity.y = entity.y + 1
    self.cells[entity.y][entity.x] = entity
  end
end

function Grid:moveEntityLeft(entity)
  if entity.x > 0 then
    self.cells[entity.y][entity.x] = nil
    entity.x = entity.x - 1
    self.cells[entity.y][entity.x] = entity
  end
end

function Grid:moveEntityRight(entity)
  if entity.x < self.hCells - 1 then
    self.cells[entity.y][entity.x] = nil
    entity.x = entity.x + 1
    self.cells[entity.y][entity.x] = entity
  end
end

return Grid
