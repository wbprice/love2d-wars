local lamb = require 'utils/lamb'

local getMoveSquares = require 'board/utils/getMoveSquares'

local function getAttackSquares(posX, posY, speed)
    return getMoveSquares(posX, posY, speed + 1)
end

return getAttackSquares
