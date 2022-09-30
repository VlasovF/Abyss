local GameObject = require "lib/GameObject"
local BoundsMesh = require "lib/BoundsMesh"
local RectangleBounds = require "lib/RectangleBounds"

local Walls = GameObject:extend()

function Walls.new(self)
	local x = 0
	local y = 0
	local number_of_objects = 192 * 108
	Walls.super.new(self, x, y)
	self.atlas = love.graphics.newImage("assets/gfx/spritesheet_tiles.png")
	self.sprite_batch = love.graphics.newSpriteBatch(self.atlas, number_of_objects)
	self.quads = {}
	self.bounds = BoundsMesh(self)
	self:installQuads()
	self:installBatch()
end

function Walls.installQuads(self)
	self.quads["up_left_corner"] = love.graphics.newQuad(
		666, 296,
		64, 64, self.atlas:getDimensions())
	self.quads["up_right_corner"] = love.graphics.newQuad(
		740, 296,
		64, 64, self.atlas:getDimensions())
	self.quads["down_left_corner"] = love.graphics.newQuad(
		666, 370,
		64, 64, self.atlas:getDimensions())
	self.quads["down_right_corner"] = love.graphics.newQuad(
		740, 370,
		64, 64, self.atlas:getDimensions())
	self.quads["horizontal_wall"] = love.graphics.newQuad(
		814, 296,
		64, 64, self.atlas:getDimensions())
	self.quads["vertical_wall"] = love.graphics.newQuad(
		814, 370,
		64, 64, self.atlas:getDimensions())
end

function Walls.installBatch(self)
	local current_quad = nil
	self.sprite_batch:clear()

	for i = 1, 10 do
		for j = 1, 10 do
			if i == 1 and j == 1 then
				current_quad = self.quads["up_left_corner"]
			elseif i == 1 and j == 10 then
				current_quad = self.quads["down_left_corner"]
			elseif i == 10 and j == 1 then
				current_quad = self.quads["up_right_corner"]
			elseif i == 10 and j == 10 then
				current_quad = self.quads["down_right_corner"]
			elseif i == 1 or i == 10 then
				current_quad = self.quads["vertical_wall"]
			elseif  j == 1 or j == 10 then
				current_quad = self.quads["horizontal_wall"]
			else
				current_quad = nil
			end	
			if 	current_quad ~= nil then
				self.sprite_batch:add(
				current_quad,
				(i - 1)*64,
				(j - 1)*64,
				0, 1, 1, 0, 0)
				local new_rectangle_bounds = RectangleBounds(64, 64, 
					(i - 1)*64, (j - 1)*64)
				self.bounds:addBounds(new_rectangle_bounds)

			end
		end											
	end

	self.sprite_batch:flush()
end

function Walls.draw(self)
	love.graphics.draw(self.sprite_batch, 0, 0)
end

return Walls