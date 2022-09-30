local SceneManager = require "lib/SceneManager"
local MainMenuManager = SceneManager:extend()

function MainMenuManager.new(self, game_manager)
	MainMenuManager.super.new(self, game_manager)
end

function MainMenuManager.handle(self, event)
	if event == "arena" then
		self.game_manager:changeToScene("arena")
	elseif event == "arena_with_map" then
		self.game_manager:changeToScene("arena_with_map")
	elseif event == "settings" then
		self.game_manager:changeToScene("settings")
	elseif event == "quit" then
		love.event.quit()	
	end
end

return MainMenuManager