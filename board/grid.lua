local Cell = require 'board/cell'
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

  -- Initialize cells with null values
  for y=0,(width or 12) - 1 do
    grid.cells[y] = {}
      for x=0,(height or 16) - 1 do
        grid.cells[y][x] = Cell:new()
      end
  end

  return grid
end

function Grid:getCell(x, y)
    return self.cells[y][x]
end

function Grid:placeTerrain(terrain, x, y)
    local cell = self:getCell(x, y)
    cell.terrain = terrain
end

function Grid:placeUnit(unit, x, y)
    local cell = self:getCell(x, y)
    cell.unit = unit
end

function Grid:placeActions(action, x, y)
    local cell = self:getCell(x, y)
    cell.action = action
end

function Grid:placeCursor(cursor, x, y)
    local cell = self:getCell(x, y)
    cursor.x = x
    cursor.y = y
    cursor.grid = self
    cursor.moveUp = self.moveEntityUp
    cursor.moveRight = self.moveEntityRight
    cursor.moveDown = self.moveEntityDown
    cursor.moveLeft = self.moveEntityLeft
    cell.cursor = cursor
end

function Grid:moveEntityUp(key, x, y)
    local cell = self.grid:getCell(x, y)
    local cursor = cell.cursor
    self.grid:placeCursor(cursor, x - 1, y)
    cell.cursor = nil
end

function Grid:moveEntityRight(key, x, y)
    local cell = self.grid:getCell(x, y)
    local cursor = cell.cursor
    self.grid:placeCursor(cursor, x, y + 1)
    cell.cursor = nil
end

function Grid:moveEntityDown(key, x, y)
    local cell = self.grid:getCell(x, y)
    local cursor = cell.cursor
    self.grid:placeCursor(cursor, x + 1, y)
    cell.cursor = nil
end

function Grid:moveEntityLeft(key, x, y)
    local cell = self.grid:getCell(x, y)
    local cursor = cell.cursor
    self.grid:placeCursor(cursor, x, y - 1)
    cell.cursor = nil
end

function Grid:draw()
    for originX, row in pairs(self.cells) do
        for originY, cell in pairs(row) do
            cell:draw(originX * 48 + self.hOffset, originY * 48 + self.vOffset)
        end
    end
end

return Grid
