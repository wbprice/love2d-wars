local Action = {}

function Action:new()
    local action = {}
    setmetatable(action, self)
    self.__index = self
    return action
end

function Action:draw(originX, originY)
    love.graphics.setColor(0, 0, 255, 155)
    love.graphics.rectangle('fill', originX, originY, 48, 48)
end

return Action
