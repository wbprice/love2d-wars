local Unit = require('entities/unit')
local Tank = {}

function Tank:new ()
    local tank = Unit:new()
    setmetatable(tank, self)
    self.__index = self
    return tank
end

function Tank:draw(posX, posY)
    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.rectangle('fill', posX, posY, 48, 48)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.print("T", posX + 13, posY + 5, 0, 3, 3)
end

return Tank


