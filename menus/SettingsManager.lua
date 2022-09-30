local SceneManager = require "lib/SceneManager"
local SettingsManager = SceneManager:extend()

function SettingsManager.new(self, game_manager)
	SettingsManager.super.new(self, game_manager)
end

function SettingsManager.handle(self, event)
	if event == "return" then
		self.game_manager:changeToScene("main_menu")
	end
end

return SettingsManager