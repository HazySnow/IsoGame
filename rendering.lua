require 'settings'

Render = {}

local gw, gh = 6, 6

local img, cursor
local ix, iy, jx, jy = 1, 0.5, -1, 0.5
local w,h = 32, 32
local mx, my
local gpx, gpy = 0,0
local xprev, yprev = 0,0

function Render:load()
	img = love.graphics.newImage('Assets/cube.png')
	self.grid = {
		{1,1,1,1,1,1},
		{1,1,1,1,1,1},
		{1,1,1,1,1,1},
		{1,1,1,1,1,1},
		{1,1,1,1,1,1},
		{1,1,1,1,1,1}
	}
	self.offset = (20 * w)
	self.grid_width, self.grid_height = 6, 6
end

function Render:update(dt)
end

function Render:draw()
	love.graphics.rectangle('fill',0,0,1280,720)
	for y = 1, gh, 1 do 
		for x = 1, gw, 1 do
			local screen = to_screen(x,y)
			if self.grid[y][x] == 1 then
				love.graphics.draw(img, screen.x - (w / 2) + self.offset, screen.y)
			end
		end
	end
end

function to_screen(x, y)
	local screen = {}
		screen.x = x * ix * 0.5 * w + y * jx * 0.5 * w
	  screen.y = x * iy * 0.5 * h + y * jy * 0.5 * h
	return screen
end

function invert_matrix(a, b, c, d)
  --Determinant 
  local det = (1 / (a * d - b * c));


	local mat = {
		a = det * d,
		b = det * -b,
		c = det * -c,
		d = det * a
	}

	return mat
end

function to_grid_coordinate(screen)
  local a = ix * 0.5 * w
  local b = jx * 0.5 * w
  local c = iy * 0.5 * h
  local d = jy * 0.5 * h
  
  local inv = invert_matrix(a, b, c, d);

  local grid = {
    x = screen.x * inv.a + screen.y * inv.b,
    y = screen.x * inv.c + screen.y * inv.d
  }

  return grid
end
