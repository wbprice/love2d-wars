local Cell = {}
local Terrain = require 'board/subcells/terrain'

function Cell:new()
  local cell = {}
  setmetatable(cell, self)
  self.__index = self
  self.terrain = Terrain:new() 
  self.unit = nil
  self.action = nil
  self.cursor = nil
  return cell
end

function Cell:draw(originX, originY)
    if self.terrain then
        self.terrain:draw(originX, originY)
    end
end

return Cell
