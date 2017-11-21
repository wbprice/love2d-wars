local Chunk = {}

function Chunk:new(width, height)
  local cell = {}
  setmetatable(cell, self)
  self.__index = self
  self.terrain = {}
  self.unit = {}
  self.actions = {}
  self.cursor = {}
  return cell
end

function Chunk:placeTerrain(terrain)
  self.terrain = terrain
end

function Chunk:placeUnit(unit)
  self.unit = unit
end

function Chunk:placeActions(action)
  self.action = action
end

function Chunk:placeCursor(cursor)
  self.cursor = action
end

function Chunk:draw(originX, originY)
  self.terrain:draw(originX, originY)
  self.unit:draw(originX, originY)
  self.action:draw(originX, originY)
  self.cursor:draw(originX, originY)
end

return Chunk
