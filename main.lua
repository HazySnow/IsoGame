require 'settings'
require 'rendering'
require 'player'

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	Render:load()
	Player:load()
end

function love.update(dt)
	Render:update(dt)
	Player:update(dt)
end

function love.draw()
	Render:draw()
	Player:draw()
end
