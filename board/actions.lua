local Grid = require 'board/grid'
local Move = require 'entities/tiles/move'
local Attack = require 'entities/tiles/attack'

local getMoveSquares = require 'board/utils/getMoveSquares'
local getAttackSquares = require 'board/utils/getAttackSquares'
local lamb = require 'utils/lamb'

local actions = Grid:new(12, 16)

function actions:addMoves(posX, posY, speed)
    self:clear()
    local moveSquares = getMoveSquares(posX, posY, speed)
    local attackSquares = lamb.diffByKey(
        moveSquares,
        getAttackSquares(posX, posY, speed)
    )

    lamb.forEach(moveSquares, function(move)
        self:addEntity(Move:new(move.x, move.y))
    end)

    lamb.forEach(attackSquares, function(attack)
        self:addEntity(Attack:new(attack.x, attack.y))
    end)
end

return actions
