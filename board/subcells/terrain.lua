local Terrain = {}

function Terrain:new()
    local terrain = {}
    setmetatable(terrain, self)
    self.__index = self
    return terrain
end

function Terrain:draw(originX, originY)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.rectangle('line', originX, originY, 48, 48)
end

return Terrain
