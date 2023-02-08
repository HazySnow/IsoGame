
Player = {
	position = {}
}

function Player:load()
	self.cursor = love.graphics.newImage('Assets/cursor.png')
end

function Player:update(dt)
	local mx, my = love.mouse.getPosition()

	local mm = {
		x = mx,
		y = my
	}
	

	self.position = to_grid_coordinate(mm)
	self.position.x = math.floor(self.position.x)
	self.position.y = math.floor(self.position.y)
	self.gridposx = self.position.x - 20
	self.gridposy = self.position.y + 20
end

function Player:draw()
	local sc = to_screen(self.position.x, self.position.y)
	love.graphics.draw(self.cursor, sc.x - (self.cursor:getWidth() / 2), sc.y)
end

function Player:mousepressed(x,y,button)
	if (self.gridposy >= 1 and self.gridposy <= Render.grid_height) then
		if (self.gridposx	>= 1 and self.gridposx <= Render.grid_height) then
			if (button == 1) then
				Render.grid[self.gridposy][self.gridposx] = 2
			elseif (button == 2) then
				Render.grid[self.gridposy][self.gridposx] = 1
			end
		end
	end
end


function love.mousepressed(x,y,button)
	Player:mousepressed(x,y,button)
end
