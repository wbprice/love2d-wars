local lamb = require 'utils/lamb'

-- Creates a new Point one position above point
function moveUp(point)
    return {
        x = point.x,
        y = point.y + 1
    }
end

-- Creates a new Point one position below point
function moveDown(point)
    return {
        x = point.x,
        y = point.y - 1
    }
end

-- Creates a new Point one position left of point
function moveLeft(point)
    return {
        x = point.x - 1,
        y = point.y
    }
end

-- Creates a new Point one position right of point
function moveRight(point)
    return {
        x = point.x + 1,
        y = point.y
    }
end

-- Determine's cost to move to a given cell
function getMoveCost(area, point)
    local x = point.x
    local y = point.y
    return area[y][x].terrain.moveCost or 1
end

-- A function that determines if a new path would be on the map or not.
function isOnMap(area, point)
    local x = point.x
    local y = point.y
    return area[y] and area[y][x]
end

-- Given a Point, returns a Path with length one.
function getPathStart(point, speed)
    return {lamb.extend(point, {speed=speed})}
end

-- Given an Area table and a Path table, determines the next possible moves.
function findNextMoves(area, path)
    local lastPoint = lamb.last(path)

    local actions = {moveUp, moveRight, moveDown, moveLeft}

    local one = lamb.map(actions, function(action) 
        print('action: ', action)
        print('lastPoint: ', lastPoint)
        return action(lastPoint)
    end)

    local two = lamb.filter(one, function(move) 
        return isOnMap(area, move)  
    end)

    local three = lamb.filter(two, function(move) 
        return not pathLoopsback(path, move)
    end)

    local four = lamb.filter(three, function(move) 
        return lastPoint.speed >= getMoveCost(area, move)
    end)

    return four
end

-- Given a Path and a Point, determines if adding the point to 
-- the path would cause it to loop back on itself.
function pathLoopsback(path, point)
    return lamb.find(path, function(muv) 
        return muv.x == point.x and muv.y == point.y
    end)
end

-- Given an Area table, a single Path, and (optionally) a table
-- containing NextMoves, returns a table with new possible Paths 
function expandPath(area, path, nextMoves)
    local lastMove = lamb.last(path)

    if not nextMoves then
        nextMoves = findNextMoves(area, path)
    end

    return lamb.map(nextMoves, function(move) 
        return lamb.concat(
            path, 
            {lamb.extend(move, {
                speed = lastMove.speed - getMoveCost(area, move)
            })}
        )
    end)
end

-- Given an Area table and a table of Paths, finds more possible paths
function expandPaths(area, paths) 
    return lamb.reduce(paths, function(memo, path)
        local nextMoves = findNextMoves(area, path)
        if #nextMoves > 0 then
            return lamb.concat(memo, expandPath(area, path, nextMoves))
        else
            memo[#memo+1] = path
        end
        return memo
    end, {}) 
end

-- Given an Area table, a starting position Table, and the number of moves 
-- available, returns a table containing all legal paths.
function getPaths(area, input, speed)
    if input.x and input.y then
        return getPaths(area, expandPath(area, getPathStart(input, speed)))
    end

    local results = expandPaths(area, input)
    -- recursive case
    if #results > #input then
        return getPaths(area, results)
    end
    -- base case
    return results
end

return getPaths
