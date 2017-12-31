local Attack = {}

function Attack:new(posX, posY)
    local attack = {}
    setmetatable(attack, self)
    self.__index = self
    attack.x = posX
    attack.y = posY
    attack.type = 'Attack'
    return attack
end

function Attack:draw(originX, originY)
    love.graphics.setColor(255, 0, 0, 155)
    love.graphics.rectangle('fill', originX, originY, 48, 48)
end

return Attack
