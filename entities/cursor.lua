local Base = require('entities/base')

local Cursor = Base:new()

local selectSound = love.audio.newSource("sounds/cursor/select.wav", "static")
local moveSound = love.audio.newSource("sounds/cursor/move.wav", "static")

function Cursor:draw(posX, posY)
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.rectangle('line', posX, posY, 48, 48)
end

function moveUp(self)
    moveSound:play()
    self.grid:moveEntityUp(self)
end

function moveDown(self)
    moveSound:play()
    self.grid:moveEntityDown(self)
end

function moveLeft(self)
    moveSound:play()
    self.grid:moveEntityLeft(self)
end

function moveRight(self)
    moveSound:play()
    self.grid:moveEntityRight(self)
end

function onSelect(self)
    selectSound:play()
end

local keymap = {
    ['up'] = moveUp,
    ['down'] = moveDown,
    ['left'] = moveLeft,
    ['right'] = moveRight,
    ['z'] = onSelect,
}

function Cursor:onKeyPress()
    function love.keypressed(key, scancode, isRepeat)
        local action = keymap[scancode]

        if isRepeat then
            return
        end

        return action and action(self)
    end
end

function getNextMoves(location)
    return {
        moveUp(location),
        moveDown(location),
        moveLeft(location),
        moveRight(location),
    }
end

function findPaths(location, speed, paths)
    local paths = paths or {[speed] = location}

    if paths[speed] then
        for j, lop in pairs(getNextMoves(location)) do
            print(lop.x, lop.y)
            table.insert(paths[speed], lop)
        end
    else
        paths[speed] = getNextMoves(location);
    end                                                                                                                                                                                                                                                                                                                                                                                    

    if speed > 1 then
        for k, loc in pairs(paths[speed]) do
            findPaths(loc, speed - 1, paths)
        end
    end

    return paths;
end

function moveUp(loc)
    return {
        x = loc.x,
        y = loc.y - 1,
    }
end

function moveDown(loc)
    return {
        x = loc.x,
        y = loc.y + 1,
    }
end

function moveLeft(loc)
    return {
        x = loc.x - 1,
        y = loc.y,
    }
end

function moveRight(loc)
    return {
        x = loc.x + 1,
        y = loc.y,
    }
end

return Cursor
