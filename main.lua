local Cursor = require 'entities/cursor'
local Tank = require 'entities/units/tank'

-- gameboard
local units = require 'board/units'
local terrain = require 'board/terrain'
local cursors = require 'board/cursor'
local actions = require 'board/actions'

-- entities
local cursor = Cursor:new(1, 1)

units:addEntity(Tank:new(2, 3))
units:addEntity(Tank:new(7, 5))
cursors:addEntity(cursor)

-- register event listeners
cursor:onKeyPress()

function love.load()
    love.window.setMode(800, 600, { resizable=false, vsync=true })
end

function love.update()

end

function love.draw()
    terrain:drawBoard()
    units:drawBoard()
    actions:drawBoard()
    cursors:drawBoard()
end

