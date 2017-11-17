local Base = {}

function Base:new()
  local base = {}
  setmetatable(base, self) 
  self.__index = self
  base.x = 0
  base.y = 0
  base.width = 1
  base.height = 1
  return base
end

return Base
