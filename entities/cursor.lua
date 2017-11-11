local Base = require('entities/base')
local Cursor = Base:new()
local selectSound = love.audio.newSource("sounds/cursor/select.wav", "static")
local moveSound = love.audio.newSource("sounds/cursor/move.wav", "static")

function Cursor:draw(posX, posY)
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.rectangle('line', posX, posY, 48, 48)
end

local moveSound = function()
    moveSound:play()
end

function moveUp(self)
    moveSound()
    if self.y > 0 then
      self.y = self.y - 1
    end
end

function moveDown(self)
    moveSound()
    if self.y < 11 then
      self.y = self.y + 1
    end
end

function moveLeft(self)
    moveSound()
    if self.x > 0 then
      self.x = self.x - 1
    end
end

function moveRight(self)
    moveSound()
    if self.x < 15 then
      self.x = self.x + 1
    end
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
        if isRepeat then
            return
        end

        return keymap[scancode](self)
    end
end

return Cursor
