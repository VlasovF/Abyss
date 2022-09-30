local Scene = require "lib/Scene"
local LevelScene = Scene:extend()

function LevelScene.new(self, scene_manager)	
	LevelScene.super.new(self, scene_manager)
end

function LevelScene.keypressed(self, key, scancode, isrepeat)
	if key == "escape" then
		self.scene_manager:handle("escape")
	elseif self.active_object ~= nil then
		self.active_object:keypressed(key, scancode, isrepeat)
	end
end

function LevelScene.keyreleased(self, key)	
	if self.active_object ~= nil then
		self.active_object:keyreleased(key)
	end
end

return LevelScene