local Base = require 'entities/base'

local Terrain = Base:new()

Terrain.moveCost = 1

function Terrain:draw(posX, posY)
    love.graphics.setColor(100, 100, 100, 255)
    love.graphics.rectangle('line', posX, posY, 48, 48)
end

return Terrain
