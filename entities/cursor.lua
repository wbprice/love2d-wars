local Base = require 'entities/base'
local units = require 'board/units'
local actions = require 'board/actions'

local Cursor = Base:new()

local moveSound = love.audio.newSource("sounds/cursor/move.wav", "static")
local selectSound = love.audio.newSource("sounds/cursor/select.wav", "static")

Cursor.selected = {}

function Cursor:draw(posX, posY)
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.setLineWidth(4)
  love.graphics.rectangle('line', posX + 2, posY + 2, 44, 44)
  love.graphics.setLineWidth(1)
end

local function moveUp(self)
    moveSound:play()
    self.y = self.y - 1  
end

local function moveDown(self)
    moveSound:play()
    self.y = self.y + 1  
end

local function moveLeft(self)
    moveSound:play()
    self.x = self.x - 1  
end

local function moveRight(self)
    moveSound:play()
    self.x = self.x + 1  
end

local function onSelect(self)
    local unit = units:find(self.x, self.y)
    local action = actions:find(self.x, self.y)
    -- if the cursor is over a unit
    if unit then
        self.selected = unit
        selectSound:play()
        actions:addMoves(self.x, self.y, unit.speed)
    -- if the cursor is over an action tile
    elseif action and action.type == 'Move' then
        self.selected:move(self.x, self.y)
        self.selected = {}
        actions:clear()
        moveSound:play()
    else
        actions:clear()
        moveSound:play()
    end
end

local function onAltSelect(self)
    local unit = units:find(self.x, self.y)
    if unit then
        self.selected = unit
        selectSound:play()
        actions:addAttacks(self.x, self.y, unit.speed)
    else
        actions:clear()
        moveSound:play()
    end
end

local keymap = {
    ['up'] = moveUp,
    ['down'] = moveDown,
    ['left'] = moveLeft,
    ['right'] = moveRight,
    ['z'] = onSelect,
    ['s'] = onAltSelect,
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
