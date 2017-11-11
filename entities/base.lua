local Base = {}

function Base:new (posX, posY)
  local base = {}
  setmetatable(base, self) 
  self.__index = self
  base.x = posX or 0
  base.y = posY or 0
  base.width = 1
  base.height = 1
  return base
end

return Base
