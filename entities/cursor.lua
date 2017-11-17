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
    local entity = self.units:getEntity(self.x, self.y)
    if entity and entity.speed then
        self.grid:showMoves(self.x, self.y, entity.speed)
    end
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

return Cursor
