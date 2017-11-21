local Terrain = require 'board/terrain'
local Units = require 'board/units'
local Ui = require 'board/ui'
local Cursor = require 'board/cursor'

local Board = {}

function Board:new(width, height)
    local board = {}
    setmetatable(board, self)
    self.__index = self
    board.terrain = Terrain:new(width, height)
    board.units = Units:new(width, height)
    board.ui = Ui:new()
    board.cursor = Cursor:new()
    return board
end

function Board:placeUnit(unit, posX, posY)
    unit.ui = self.ui
    unit.terrain = self.terrain
    self.units:place(unit, posX, posY)
end

function Board:placeCursor(cursor, posX, posY)
    cursor.terrain = self.terrain
    cursor.units = self.units
    self.cursor:place(cursor, posX, posY)
end

function Board:draw()
    self.terrain:draw()
    self.units:draw()
    self.ui:draw()
    self.cursor:draw()
end

return Board

