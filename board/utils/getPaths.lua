local lamb = require 'utils/lamb'
local terrain = require 'board/terrain'

-- Creates a new Point one position above point
local function moveUp(point)
    return {
        x = point.x,
        y = point.y + 1
    }
end

-- Creates a new Point one position below point
local function moveDown(point)
    return {
        x = point.x,
        y = point.y - 1
    }
end

-- Creates a new Point one position left of point
local function moveLeft(point)
    return {
        x = point.x - 1,
        y = point.y
    }
end

-- Creates a new Point one position right of point
local function moveRight(point)
    return {
        x = point.x + 1,
        y = point.y
    }
end

-- Determine's cost to move to a given cell
local function getMoveCost(point)
    local x = point.x
    local y = point.y
    local tile = lamb.find(terrain.contents, function(cell)
        return cell.x == x and cell.y == y  
    end)
    return tile.moveCost or 1
end

-- A function that determines if a new path would be on the map or not.
local function isOnMap(point)
    local x = point.x
    local y = point.y
    return lamb.find(terrain.contents, function(cell)
        return cell.x == x and cell.y == y
    end)
end

-- Given a Point, returns a Path with length one.
local function getPathStart(point, speed)
    return {lamb.extend(point, {speed=speed})}
end

-- Given an Area table and a Path table, determines the next possible moves.
local function findNextMoves(path)
    local lastPoint = lamb.last(path)

    local actions = {moveUp, moveRight, moveDown, moveLeft}

    local one = lamb.map(actions, function(action) 
        return action(lastPoint)
    end)

    local two = lamb.filter(one, function(move) 
        return isOnMap(move)  
    end)

    local three = lamb.filter(two, function(move) 
        return not pathLoopsback(path, move)
    end)

    local four = lamb.filter(three, function(move) 
        return lastPoint.speed >= getMoveCost(move)
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
function expandPath(path, nextMoves)
    local lastMove = lamb.last(path)

    if not nextMoves then
        nextMoves = findNextMoves(path)
    end

    return lamb.map(nextMoves, function(move) 
        return lamb.concat(
            path, 
            {lamb.extend(move, {
                speed = lastMove.speed - getMoveCost(move)
            })}
        )
    end)
end

-- Given an Area table and a table of Paths, finds more possible paths
function expandPaths(paths) 
    return lamb.reduce(paths, function(memo, path)
        local nextMoves = findNextMoves(path)
        if #nextMoves > 0 then
            return lamb.concat(memo, expandPath(path, nextMoves))
        else
            memo[#memo+1] = path
        end
        return memo
    end, {}) 
end

-- Given an Area table, a starting position Table, and the number of moves 
-- available, returns a table containing all legal paths.
function getPaths(input, speed)
    if input.x and input.y then
        return getPaths(expandPath(getPathStart(input, speed)))
    end

    local results = expandPaths(input)
    -- recursive case
    if #results > #input then
        return getPaths(results)
    end
    -- base case
    return results
end

return getPaths
