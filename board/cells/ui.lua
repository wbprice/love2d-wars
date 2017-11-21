local Grid = require 'board/grid' 
local Move = require 'entities/move'

local Ui = Grid:new()

function Ui:draw()
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

function Ui:showMoves(x, y, moves)
  local paths = getPaths({x=x, y=y,}, moves)
  for k, path in pairs(paths) do
    for l, move in pairs(path) do
      if self:shouldShowMove(move.x, move.y) then
        self.cells[move.y][move.x] = Move:new()
      end
    end
  end
end

return Ui