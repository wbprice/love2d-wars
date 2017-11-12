local Terrain = require 'board/terrain'
local Units = require 'board/units'
local Ui = require 'board/ui'

local Board = {}

function Board:new(width, height)
    local board = {}
    setmetatable(board, self)
    self.__index = self
    board.terrain = Terrain:new(width, height)
    board.units = Units:new(width, height)
    board.ui = Ui:new()
    return board
end

function Board:draw()
    self.terrain:draw()
    self.units:draw()
    self.ui:draw()
end

return Board

