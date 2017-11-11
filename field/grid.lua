local Grid = {}
Grid.__index = Grid

function Grid.new()
  local self = setmetatable({}, Grid)
  self.vCells = 12
  self.hCells = 16
  self.hOffset = 16
  self.vOffset = 12
  self.tileWidth = 48
  self.tileHeight = 48
  return self
end

function Grid:draw()
  love.graphics.setColor(155, 155, 155, 255)
  for i=0,self.vCells do
    love.graphics.line(
      self.hOffset, 
      i * self.tileWidth + self.vOffset, 
      800 - self.hOffset, 
      i * self.tileHeight + self.vOffset
    )
  end
  for j=0,self.hCells do
    love.graphics.line(
      j * 48 + self.hOffset, 
      self.vOffset, 
      j * 48 + self.hOffset, 
      600 - self.vOffset
    )
  end
end

function Grid:place(entity)
  local posX = self.hOffset + entity.x * self.tileWidth
  local posY = self.vOffset + entity.y * self.tileHeight
  entity:draw(posX, posY)
end

return Grid
