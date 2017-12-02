local Base = require 'entities/base'
local selectSound = love.audio.newSource("sounds/cursor/select.wav", "static")

Unit = Base:new()

Unit.selectionPoint = {}

function Unit:draw(posX, posY)
    love.graphics.rectangle('fill', posX, posY, 48, 48)
end

function Unit:onClick(posX, posY)
    selectSound:play()
end

function Unit:shouldShowMove(x, y)
  return not self:getEntity(x, y) and
         self:onGrid(x, y)
end

function Unit:onGrid(x, y)
  return x >= 0 and x <= self.hCells and
         y >= 0 and y <= self.vCells
end

function Unit:setSelection(x, y)
    self.selectionPoint = {x = x, y = y}
end

function Unit:onClick(posX, posY)
    selectSound:play()
end

Unit.health = 10
Unit.speed = 1
Unit.ready = true
Unit.faction = 'blue'
Unit.selected = false

return Unit
