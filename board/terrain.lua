local Grid = require 'board/grid'
local Terrain = require 'entities/tiles/terrain'
local Road = require 'entities/tiles/road'

local terrain = Grid:new(12, 16)

for y = 0,11 do
    for x = 0,15 do
        terrain:addEntity(Terrain:new(x, y))
    end
end

terrain:replace(0, 3, Road)
terrain:replace(1, 3, Road)
terrain:replace(2, 3, Road)
terrain:replace(3, 3, Road)
terrain:replace(3, 2, Road)
terrain:replace(3, 1, Road)
terrain:replace(3, 0, Road)

return terrain
