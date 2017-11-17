-- Describes a single point on a Cartesian grid 
function getPoint(x, y)
    return {
        x = x,
        y = y,
    }
end

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

-- Returns a table of next moves
local function getNextMoves(point)
    return {
        moveUp(point),
        moveDown(point),
        moveLeft(point),
        moveRight(point)
    }
end

-- Determines if a path loops back on itself
local function pathLoopsBack(path)
    local moveCount = {}
    for k, move in pairs(path) do
        local key = move.x..','..move.y
        if moveCount[key] == nil then
            moveCount[key] = 0
        end
        moveCount[key] = moveCount[key] + 1
        if moveCount[key] > 1 then
            return true
        end
    end
    return false
end

-- Removes paths that loop back on themselves
local function filterLoopbackPaths(paths)
    local results = {}
    for k, path in pairs(paths) do
        if not pathLoopsBack(path) then
            table.insert(results, path)
        end
    end
    return results
end

-- Given a point, return a table of next paths
local function getNextPathsFromPoint(point)
    local result = {}
    for k,move in pairs(getNextMoves(point)) do
        table.insert(result, {
            point,
            move
        })
    end
    return result
end

-- Given a path, return a table of next paths
local function getNextPathsFromPath(path)
    local results = {}
    local lastPoint = path[#path]
    for k, move in pairs(getNextMoves(path[#path])) do
        local res = {}
        for k, m in pairs(path) do
            table.insert(res, m)
        end
        table.insert(res, move)
        table.insert(results, res)
    end
    return results
end

-- given a table containing paths, return a table of next paths
local function getNextPathsFromPaths(paths)
    local results = {}
    for k, path in pairs(paths) do
        for l, path in pairs(getNextPathsFromPath(path)) do
            table.insert(results, path);
        end
    end
    return filterLoopbackPaths(results)
end

-- get all paths from a an origin possible using a given number of moves.
function getPaths(input, moves)
    if moves <= 0 then
        return input
    end

    if input.x and input.y then
        return getPaths(getNextPathsFromPoint(input), moves - 1)
    else
        return getPaths(getNextPathsFromPaths(input), moves - 1)
    end
end

return getPaths