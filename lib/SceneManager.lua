local Object = require "lib/classic"
local SceneManager = Object:extend()

function SceneManager.new(self, game_manager)
	self.game_manager = game_manager or nil
	self.camera = nil
end

function SceneManager.handle(self, event)
end

function SceneManager.setGameManager(self, game_manager)
	self.game_manager = game_manager or nil
end

return SceneManager