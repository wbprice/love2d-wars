local lamb = require 'utils/lamb'

local getPaths = require 'board/utils/getPaths'

local function getMoveSquares(posX, posY, speed)
    local paths = getPaths({x = posX, y = posY}, speed)
    return lamb.reduce(paths, function(memo, path, index)
        lamb.forEach(path, function(cell) 
            if not (cell.x == posX and cell.y == posY) then
                memo[cell.x .. ',' .. cell.y] = cell
            end
        end)
        return memo
    end)
end

return getMoveSquares
