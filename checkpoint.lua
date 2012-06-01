Checkpoint = {}
Checkpoint.__index = Checkpoint

function Checkpoint.create(x,y)
	local self = {}
	setmetatable(self, Checkpoint)

	self.x = x
	self.y = y
	self.alive = true

	return self
end

function Checkpoint:draw()
	if self.alive == true then
		love.graphics.drawq(imgObjects, quads.star, self.x-2, self.y-1)
	end
end

function Checkpoint:collidePlayer(pl)
	if self.alive ==true then
		if pl.x-5.5 > self.x+16 or pl.x+5.5 < self.x
		or pl.y+2 > self.y+16 or pl.y+20 < self.y then
			return false
		else
			self.alive = false
			map.startx = self.x
			map.starty = self.y
			table.insert(map.particles, Sparkle.create(self.x+8, self.y+8, 16))

			return true
		end
	end
	return false
end