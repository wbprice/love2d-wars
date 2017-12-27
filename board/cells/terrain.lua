local Base = require 'entities/base'

local Terrain = Base:new()

function Terrain:draw(posX, posY)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.rectangle('line', posX, posY, 48, 48)
end

return Terrain
