local Board = require 'board/board'
local Tank = require 'entities/tank'
local Cursor = require 'entities/cursor'

-- Gameboard
local board = Board:new()

-- Cursor
local cursor = Cursor:new()
cursor:onKeyPress()
board.ui:place(cursor, 0, 0)
cursor.units = board.units

-- Units
board.units:place(Tank:new(), 2, 4)
board.units:place(Tank:new(), 0, 0)
board.units:place(Tank:new(), 7, 11)
board.units:place(Tank:new(), 9, 3)
board.units:place(Tank:new(), 1, 7)

function love.load()
    love.window.setMode(800, 600, { resizable=false, vsync=true })
end

function love.update()

end

function love.draw()
    board:draw()
end

