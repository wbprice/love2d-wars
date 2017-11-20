local Base = require('entities/base')

local Attack = Base:new()

function Attack:draw(posX, posY)
    love.graphics.setColor(255, 0, 0, 155)
    love.graphics.rectangle('fill', posX, posY, 48, 48)
end

return Attack