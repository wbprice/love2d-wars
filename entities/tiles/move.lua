local Move = {}

function Move:new(posX, posY)
    local move = {}
    setmetatable(move, self)
    self.__index = self
    move.x = posX
    move.y = posY
    move.type = 'Move'
    return move
end

function Move:draw(originX, originY)
    love.graphics.setColor(106, 204, 253, 155)
    love.graphics.rectangle('fill', originX, originY, 48, 48)
end

return Move
