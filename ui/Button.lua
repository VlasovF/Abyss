local GameObject = require "lib/GameObject"
local Button = GameObject:extend()

function Button.new(self, x, y, width, height, text)
	Button.super.new(self, x, y)
	self.width = width or 0
	self.height = height or 0
	self.event_name = ""
	self.text = text or ""
	self.font = love.graphics.newFont("assets/5x5_pixel.ttf", 16)
	self.text_object = love.graphics.newText(self.font, self.text)
	self.text_width = self.text_object:getWidth()
	self.text_height = self.text_object:getHeight()
	self.text_color = {0, 0, 0, 255} 
	self.background_color = {255, 255, 255, 255}	
end

function Button.update(dt)
end

function Button.draw(self)
	if self.on_focus == true then
		love.graphics.setColor({255, 0, 0, 255})
	else
		love.graphics.setColor(self.background_color)
	end

	love.graphics.rectangle("fill",
						self.x,
						self.y,
						self.width,
						self.height)

	love.graphics.setColor(self.text_color)

	love.graphics.draw(self.text_object,
						self.x + (self.width - self.text_width)/2,
						self.y + (self.height - self.text_height)/2)
end

function Button.setEventName(self, event_name)
	self.event_name = event_name or ""
end

function Button.keypressed(self, key, scancode, isrepeat)
	if key == "return" then
		self.scene_manager:handle(self.event_name)
	end
end

function GameObject.mousepressed(self, button, istouch)
	if button == 1 then
		self.scene_manager:handle(self.event_name)
	end
end


return Button