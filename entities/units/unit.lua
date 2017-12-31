local Base = require 'entities/base'
local selectSound = love.audio.newSource("sounds/cursor/select.wav", "static")

Unit = Base:new()

Unit.health = 10
Unit.speed = 1
Unit.ready = true
Unit.faction = 'blue'

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

function Unit:draw(posX, posY)
    if self.health < 10 then
        love.graphics.setColor(0, 0, 0, 255)
        love.graphics.rectangle('fill', posX + 24, posY + 24, 24, 24)
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.print(self.health, posX + 28, posY + 24, 0, 2, 2)
    end
end

function Unit:setSelection(x, y)
    self.selectionPoint = {x = x, y = y}
end

function Unit:onClick(posX, posY)
    selectSound:play()
end

return Unit
