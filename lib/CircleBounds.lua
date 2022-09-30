local Object = require "lib/classic"
local CircleBounds = Object:extend()

function CircleBounds:new(r , dx, dy)
	self.host = nil
	self.r = r or 0
	self.dx = dx or 0
	self.dy = dy or 0
end

function CircleBounds:draw()
	if self.host ~= nil then
		love.graphics.circle("line", 
			self.host.x + self.dx, self.host.y + self.dy, self.r)
	end
end

return CircleBounds