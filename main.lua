local Grid = require 'field/grid'
local Cursor = require 'entities/cursor'
local Tank = require 'entities/tank'

-- Gameboard
local grid = Grid.new()
local cursor = Cursor:new()
cursor:onKeyPress()

-- Units
local tank = Tank:new(4, 4)

function love.load()
    love.window.setMode(800, 600, { resizable=false, vsync=true })
end

function love.update()

end

function love.draw()
    grid:draw()
    grid:place(tank)
    grid:place(cursor)
end

