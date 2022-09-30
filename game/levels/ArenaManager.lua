local SceneManager = require "lib/SceneManager"
local ArenaManager = SceneManager:extend()

function ArenaManager.new(self, game_manager)
	ArenaManager.super.new(self, game_manager)
end

function ArenaManager.handle(self, event)
	if event == "escape" then
		self.game_manager:changeToScene("main_menu")
	end
end

return ArenaManager