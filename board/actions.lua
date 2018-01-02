local Grid = require 'board/grid'
local Move = require 'entities/tiles/move'
local Attack = require 'entities/tiles/attack'

local getMoveSquares = require 'board/utils/getMoveSquares'
local getAttackSquares = require 'board/utils/getAttackSquares'
local lamb = require 'utils/lamb'

local actions = Grid:new(12, 16)

function actions:addMoves(posX, posY, speed)
    self:clear()
    lamb.forEach(
        getMoveSquares(posX, posY, speed), 
        function(move)
            self:addEntity(Move:new(move.x, move.y))
    end)
end

function actions:addAttacks(posX, posY, speed)
    self:clear()
    lamb.forEach(
        getAttackSquares(posX, posY, speed), 
        function(attack)
            self:addEntity(Attack:new(attack.x, attack.y))
    end)
end

return actions
