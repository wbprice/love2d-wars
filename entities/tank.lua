local Unit = require 'entities/unit'

local Tank = Unit:new()

Tank.speed = 3

function Tank:draw(posX, posY)
    if self.faction == 'blue' then
        love.graphics.setColor(0, 0, 255, 255)
    end

    if self.faction == 'red' then
        love.graphics.setColor(255, 0, 0, 255)
    end

    love.graphics.rectangle('fill', posX, posY, 48, 48)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.print("B", posX + 12, posY + 4, 0, 3, 3)
end

return Tank
