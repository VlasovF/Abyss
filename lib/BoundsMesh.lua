local Object = require "lib/classic"
local BoundsMesh = Object:extend()

function BoundsMesh:new(host)
	self.host = host
	self.bounds = {}
end

function BoundsMesh:addBounds(bounds)
	bounds.host = self.host
	table.insert(self.bounds, bounds)
end

function BoundsMesh:draw()
	for i=1, #self.bounds do
		self.bounds[i]:draw()
	end
end

return BoundsMesh