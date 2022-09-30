local Object = require "lib/classic"
local RectangleBounds = Object:extend()

function RectangleBounds:new(width, height, dx, dy)
	self.host = nil
	self.width = width 
	self.height = height 
	self.dx = dx or 0
	self.dy = dy or 0
end

function RectangleBounds:draw()
	if self.host ~= nil then
		love.graphics.rectangle("line",
			self.host.x + self.dx,
			self.host.y + self.dy,
			self.width, self.height)
	end
end

return RectangleBounds