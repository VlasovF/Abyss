local SceneManager = require "lib/SceneManager"
local Camera = require "lib/Camera"
local ArenaWithMapManager = SceneManager:extend()

function ArenaWithMapManager.new(self, game_manager)
	ArenaWithMapManager.super.new(self, game_manager)
	self.camera = Camera
end

function ArenaWithMapManager.handle(self, event)
	if event == "escape" then
		self.game_manager:changeToScene("main_menu")
	end
end

return ArenaWithMapManager