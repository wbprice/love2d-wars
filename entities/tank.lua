local Unit = require 'entities/unit'
local Tank = {}

function Tank:new (posX, posY)
    local tank = Unit:new(posX, posY)
    setmetatable(tank, self)
    self.__index = self
    return tank
end

function Tank:draw(posX, posY)
    if self.faction == 'blue' then
        love.graphics.setColor(0, 0, 255, 255)
    end

    if self.faction == 'red' then
        love.graphics.setColor(255, 0, 0, 255)
    end
    love.graphics.rectangle('fill', posX, posY, 48, 48)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.print("T", posX + 12, posY + 4, 0, 3, 3)
end

return Tank


