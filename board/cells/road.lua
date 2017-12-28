local Terrain = require 'board/cells/terrain'

local Road = Terrain:new()

Road.moveCost = 0.5

function Road:draw(posX, posY)
    love.graphics.setColor(192, 192, 192, 255)
    love.graphics.rectangle('fill', posX, posY, 48, 48)
end

return Road
