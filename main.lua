Cursor = require './entities/cursor'
Grid = require './field/grid'
cursor = Cursor.new()
grid = Grid.new()

function love.load()
    love.window.setMode(800, 600, { resizable=true, vsync=true })
end

function love.update()
    cursor:onMove() 
end

function love.draw()
    cursor:draw()
    grid:draw()
end
