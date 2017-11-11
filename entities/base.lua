local Base = {}

function Base:new (posX, posY)
  local base = {}
  setmetatable(base, self) 
  self.__index = self
  base.width = 1
  base.height = 1
  base.registerWith = function(grid)
    base.grid = grid
    grid.unitMap[posY][posX] = base
  end
  return base
end

return Base
