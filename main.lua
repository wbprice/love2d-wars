local Grid = require 'field/grid'
local Cursor = require 'entities/cursor'
local Tank = require 'entities/tank'

-- Gameboard
local grid = Grid:new()
local cursor = grid.register(Cursor:new(0, 0))
cursor:onKeyPress()

-- Units
local tank = grid.register(Tank:new(3, 2))

function love.load()
    love.window.setMode(800, 600, { resizable=false, vsync=true })
end

function love.update()

end

function love.draw()
    grid:draw()
    cursor:draw()
end

