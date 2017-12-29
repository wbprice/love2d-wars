local Terrain = require 'entities/tiles/terrain'

local Road = Terrain:new()

Road.moveCost = 0.5
Road.type = 'Road'

function Road:draw(posX, posY)
    love.graphics.setColor(192, 192, 192, 255)
    love.graphics.rectangle('fill', posX, posY, 48, 48)
end

return Road
