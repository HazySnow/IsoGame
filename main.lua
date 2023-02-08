require 'settings'
require 'rendering'

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	Render:load()
end

function love.update(dt)
	Render:update(dt)
end

function love.draw()
	Render:draw()
end
