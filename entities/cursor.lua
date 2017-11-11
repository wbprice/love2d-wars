local Base = require('entities/base')
local Cursor = Base:new()
local selectSound = love.audio.newSource("sounds/cursor/select.wav", "static")
local moveSound = love.audio.newSource("sounds/cursor/move.wav", "static")

function Cursor:draw(posX, posY)
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.rectangle('line', posX, posY, 48, 48)
end

function Cursor:onKeyPress()
    function love.keypressed(key, scancode, isRepeat)
        if isRepeat then
            return
        end

        if scancode == 'up' then
            moveSound:play()
            if self.y > 0 then
              self.y = self.y - 1
            end
        end

        if scancode == 'down' then
            moveSound:play()
            if self.y < 11 then
              self.y = self.y + 1
            end
        end

        if scancode == 'left' then
            moveSound:play()
            if self.x > 0 then
              self.x = self.x - 1
            end
        end

        if love.keyboard.isDown('right') then
            moveSound:play()
            if self.x < 15 then
              self.x = self.x + 1
            end
        end

        if love.keyboard.isDown('z') then
            selectSound:play()
        end
    end
end

return Cursor
