local Grid = require 'board/grid'
local Tank = require 'entities/tank'
local Cursor = require 'entities/cursor'

-- Gameboard
local grid = Grid:new(16, 12)

function love.load()
    love.window.setMode(800, 600, { resizable=false, vsync=true })
end

function love.update()

end

function love.draw()
    grid:draw()
end

