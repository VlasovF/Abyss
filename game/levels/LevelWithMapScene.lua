local Scene = require "lib/Scene"
local LevelWithMapScene = Scene:extend()

function LevelWithMapScene.new(self, scene_manager)	
	LevelWithMapScene.super.new(self, scene_manager)	
end

function LevelWithMapScene.draw(self)
	self.scene_manager.camera:set()
	
	for i=1,#self.objects do
		self.objects[i]:draw()
		if self.objects[i].bounds ~= nil then
			self.objects[i].bounds:draw()
		end
	end

	self.scene_manager.camera:unset()
end

function LevelWithMapScene.update(self, dt)
	LevelWithMapScene.super.update(self, dt)
end

function LevelWithMapScene.keypressed(self, key, scancode, isrepeat)
	if key == "escape" then
		self.scene_manager:handle("escape")
	elseif self.active_object ~= nil then
		self.active_object:keypressed(key, scancode, isrepeat)
	end
end

function LevelWithMapScene.keyreleased(self, key)	
	if self.active_object ~= nil then
		self.active_object:keyreleased(key)
	end
end

return LevelWithMapScene