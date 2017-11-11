local Base = require('entities/base')

local Cursor = Base:new()

local selectSound = love.audio.newSource("sounds/cursor/select.wav", "static")
local moveSound = love.audio.newSource("sounds/cursor/move.wav", "static")

function Cursor:new (posX, posY)
    local cursor = Base:new(posX, posY)
    cursor.x = posX
    cursor.y = posY
    cursor.selectionPoint = {}
    setmetatable(cursor, self)
    self.__index = self
    cursor.registerWith = function(grid)
        cursor.grid = grid
        return cursor
    end
    return cursor
end

function drawLegalMove(self, x, y)
  local posX = self.grid.hOffset + x * self.grid.tileWidth
  local posY = self.grid.vOffset + y * self.grid.tileHeight
  love.graphics.setColor(137, 207, 240, 155)
  love.graphics.rectangle('fill', posX, posY, 48, 48)
end

function Cursor:drawLegalMoves()
  local x = self.selectionPoint.x
  local y = self.selectionPoint.y

  drawLegalMove(self, x - 1, y)
  drawLegalMove(self, x + 1, y)
  drawLegalMove(self, x, y + 1)
  drawLegalMove(self, x, y - 1)
end

function Cursor:draw()
  local posX = self.grid.hOffset + self.x * self.grid.tileWidth
  local posY = self.grid.vOffset + self.y * self.grid.tileHeight

  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.rectangle('line', posX, posY, 48, 48)
  
  if self.selectionPoint.x then
    self:drawLegalMoves()
  end
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
    local entity = self.grid:findEntityAt(self.x, self.y)
    if entity.speed then
        self.selected = entity
        self.selectionPoint = {
            ['x'] = self.x,
            ['y'] = self.y
        }
    else 
        self.selectionPoint = {}
        self.selected = {}
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
