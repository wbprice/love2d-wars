local Unit = require 'entities/units/unit'

local Tank = Unit:new()
local moveSound = love.audio.newSource("sounds/tank/move.wav", "static")

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
    love.graphics.print("T", posX + 12, posY + 4, 0, 3, 3)

    Unit:draw(posX, posY)
end

function Tank:move(posX, posY)
    Unit.move(self, posX, posY)
    moveSound:play()
end


return Tank
