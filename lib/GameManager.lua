local Object = require "lib/classic"
local GameManager = Object:extend()

function GameManager.new(self)
	self.currentScene = nil
end

function GameManager.update(self, dt)
	if self.currentScene ~= nil then
		self.currentScene:update(dt)
	end
end

function GameManager.draw(self)
	if self.currentScene ~= nil then
		self.currentScene:draw()
	end
end

function GameManager.changeToScene(self, scene_name)
end

function GameManager.keypressed(self, key, scancode, isrepeat)
	if self.currentScene ~= nil then
		self.currentScene:keypressed(key)
	end 
end

function GameManager.keyreleased(self, key)
	if self.currentScene ~= nil then
		self.currentScene:keyreleased(key)
	end	
end

function GameManager.mousepressed(self, x, y, button, istouch)
	if self.currentScene ~= nil then
		self.currentScene:mousepressed(x, y, button, istouch)
	end 
end

return GameManager