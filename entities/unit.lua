local Base = require 'entities/base'

local Unit = {}

function Unit:new ()
    local unit = Base:new()
    setmetatable(unit, self)
    self.__index = self
    unit.health = 10
    unit.speed = 1
    unit.ready = true
    return unit
end

function Unit:draw(posX, posY)
    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.rectangle('fill', posX, posY, 48, 48)
end

return Unit
