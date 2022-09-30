local Object = require "lib/classic"
local GameObject = Object:extend()

function GameObject.new(self, x, y)
	self.x = x or 0
	self.y = y or 0
	self.width = 0
	self.height = 0
	self.scene_manager = nil
	self.on_focus = false
	self.bounds = nil	
end

function GameObject.update(self, dt)
end

function GameObject.draw(self)
end

function GameObject.keypressed(self, key, scancode, isrepeat)
end

function GameObject.keyreleased(self, key)
end

function GameObject.mousepressed(self, button, istouch)
end

function GameObject.focus(self)
	self.on_focus = true
end

function GameObject.unfocus(self)
	self.on_focus = false
end

function GameObject.setSceneManager(self, scene_manager)
	self.scene_manager = scene_manager or nil
end

return GameObject
