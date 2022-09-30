local GameObject = require "lib/GameObject"
local Ground = GameObject:extend()

function Ground.new(self)
	local x = 0
	local y = 0
	local number_of_objects = 192 * 108
	Ground.super.new(self, x, y)
	self.atlas = love.graphics.newImage("assets/gfx/spritesheet_tiles.png")
	self.sprite_batch = love.graphics.newSpriteBatch(self.atlas, number_of_objects)
	self.quad = love.graphics.newQuad(
		1036, 222,
		64, 64, self.atlas:getDimensions())
	self:install()
end

function Ground.install(self)
	self.sprite_batch:clear()

	for i = 1, 10 do
		for j = 1, 10 do		
			self.sprite_batch:add(
			self.quad,
			(i - 1)*64,
			(j - 1)*64,
			0, 1, 1, 0, 0)
		end											
	end

	self.sprite_batch:flush()
end

function Ground.draw(self)
	love.graphics.draw(self.sprite_batch, 0, 0)
end

return Ground