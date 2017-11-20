local Base = require 'entities/base'

local Move = Base:new()

function Move:draw(posX, posY)
    love.graphics.setColor(137, 207, 240, 155)
    love.graphics.rectangle('fill', posX, posY, 48, 48)
end

return Move