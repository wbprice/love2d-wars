local Grid = require 'board/grid'
local Move = require 'board/cells/move'

local getMoveSquares = require 'board/utils/getMoveSquares'
local lamb = require 'utils/lamb'

local actions = Grid:new(12, 16)

function actions:addMoves(posX, posY, speed)
    self:clear()
    local moveSquares = getMoveSquares(posX, posY, speed)
    lamb.forEach(moveSquares, function(move) 
        self:addEntity(Move:new(move.x, move.y))
    end) 
end

return actions
