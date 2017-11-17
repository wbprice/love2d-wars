Base = require 'entities/base'

Unit = Base:new()

function Unit:draw(posX, posY)
    love.graphics.rectangle('fill', posX, posY, 48, 48)
end

Unit.health = 10
Unit.speed = 1
Unit.ready = true
Unit.faction = 'blue'
Unit.selected = false

return Unit
