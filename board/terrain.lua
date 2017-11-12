local Grid = require 'board/grid'

local Terrain = {}

function Terrain:new(width, height)
  local terrain = Grid:new(width, height)
  setmetatable(terrain, self)
  self.__index = self

  for y=0,(width or 12) - 1 do
    terrain.cells[y] = {}
      for x=0,(height or 16) - 1 do
        terrain.cells[y][x] = {}
      end
  end

  return terrain
end

function drawCell(originX, originY)
  love.graphics.setColor(155, 155, 155, 255)
  love.graphics.rectangle('line', originX, originY, 48, 48)    
end

function Terrain:draw()
  love.graphics.setColor(155, 155, 155, 255)

  for y, row in pairs(self.cells) do
    for x, cell in pairs(self.cells[y]) do
      local originX = self.hOffset + x * self.tileWidth
      local originY = self.vOffset + y * self.tileHeight
      drawCell(originX, originY) 
    end
  end
end

return Terrain
