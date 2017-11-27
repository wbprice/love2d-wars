local Base = require('entities/base')

local Cursor = Base:new()

local moveSound = love.audio.newSource("sounds/cursor/move.wav", "static")

function Cursor:draw(posX, posY)
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.rectangle('fill', posX + 2, posY + 2, 44, 44)
end

function moveUp(self)
    moveSound:play()
    self:moveUp('cursor', self.x, self.y)
end

function moveDown(self)
    moveSound:play()
    self:moveDown('cursor', self.x, self.y)
end

function moveLeft(self)
    moveSound:play()
    self:moveLeft('cursor', self.x, self.y)
end

function moveRight(self)
    moveSound:play()
    self:moveRight('cursor', self.x, self.y)
end

function onSelect(self)
    self:selectUnit(self.x, self.y)
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
