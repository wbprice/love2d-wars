local Grid = {}
Grid.__index = Grid

function Grid.new()
  local self = setmetatable({}, Grid)
  self.vCells = 12
  self.hCells = 16
  return self
end

function Grid.draw(self)
  love.graphics.setColor(155, 155, 155, 255)
  for i=0,self.vCells do
    love.graphics.line(16, i * 48 + 12, 784, i * 48 + 12)
  end
  for j=0,self.hCells do
    love.graphics.line(j * 48 + 16, 12, j * 48 + 16, 588)
  end
end

return Grid
