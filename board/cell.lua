local Cell = {}

function Cell:new(width, height)
  local cell = {}
  setmetatable(cell, self)
  self.__index = self
  self.terrain = {}
  self.unit = {}
  self.actions = {}
  self.cursor = {}
  return cell
end

function Cell:placeTerrain(terrain)
  self.terrain = terrain
end

function Cell:placeUnit(unit)
  self.unit = unit
end

function Cell:placeActions(action)
  self.action = action
end

function Cell:placeCursor(cursor)
  self.cursor = action
end

function Cell:draw(originX, originY)
  self.terrain and self.terrain:draw(originX, originY)
  self.unit and self.unit:draw(originX, originY)
  self.action and self.action:draw(originX, originY)
  self.cursor and self.cursor:draw(originX, originY)
end

return Cell
