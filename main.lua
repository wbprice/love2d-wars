local Grid = require 'field/grid'
local Cursor = require 'entities/cursor'
local Tank = require 'entities/tank'

local grid = Grid.new()
local cursor = Cursor:new()
local tank = Tank:new()

function love.load()
    love.window.setMode(800, 600, { resizable=false, vsync=true })
end

function love.update()
    cursor:onMove()
end

function love.draw()
    grid:draw()
    grid:drawEntity(tank)
    grid:drawEntity(cursor)
end
