local Base = require 'entities/base'

local Unit = {}

function Unit:new (posX, posY)
    local unit = Base:new(posX, posY)
    setmetatable(unit, self)
    self.__index = self
    unit.health = 10
    unit.speed = 1
    unit.ready = true
    unit.faction = 'blue'
    unit.selected = false
    return unit
end

function Unit:draw(posX, posY)
    love.graphics.rectangle('fill', posX, posY, 48, 48)
end

return Unit
