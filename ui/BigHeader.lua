local GameObject = require "lib/GameObject"
local BigHeader = GameObject:extend()

function BigHeader.new(self, x, y, text)
	BigHeader.super.new(self, x, y)
	self.font = love.graphics.newFont("assets/5x5_pixel.ttf", 20)
	self.text = text or ""
	self.text_object = love.graphics.newText(self.font, self.text)
	self.text_color = {255, 255, 255, 255}
	self.width = self.text_object:getWidth()
	self.height = self.text_object:getHeight()
end

function BigHeader.update(self, dt)
end

function BigHeader.draw(self)
	love.graphics.setColor(self.text_color)
	love.graphics.draw(self.text_object,
					   self.x,
					   self.y)
end

function BigHeader.setSceneManager(self, scene_manager)
	self.scene_manager = scene_manager or nil
end

return BigHeader