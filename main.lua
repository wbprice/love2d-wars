local Grid = require 'field/grid'
local Unit = require 'entities/unit'
local Cursor = require 'entities/cursor'

local grid = Grid.new()
local unit = Unit:new()
local cursor = Cursor:new()

function love.load()
    love.window.setMode(800, 600, { resizable=false, vsync=true })
end

function love.update()

end

function love.draw()
    grid:draw()
    grid:drawEntity(cursor)
end
