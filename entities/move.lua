local Base = require 'entities/base'

local Move = {}

function Move:new (posX, posY)
    local move = Base:new(posX, posY)
    setmetatable(move, self)
    self.__index = self
    return move
end

function Move:draw(posX, posY)
    love.graphics.setColor(137, 207, 240, 155)
    love.graphics.rectangle('fill', posX, posY, 48, 48)
end

return Move