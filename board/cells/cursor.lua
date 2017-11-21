local Grid = require 'board/grid'

local Cursor = Grid:new()

function Cursor:new(width, height)
    local cursor = Grid:new(width, height)
    setmetatable(cursor, self)
    self.__index = self
    return cursor
end

function Cursor:draw() 
  for y, row in pairs(self.cells) do
    for x, cell in pairs(self.cells[y]) do
      local entity = self.cells[y][x]
      if entity.draw then
        local originX = self.hOffset + x * self.tileWidth
        local originY = self.vOffset + y * self.tileHeight
        entity:draw(originX, originY)
      end
    end
  end
end

return Cursor

