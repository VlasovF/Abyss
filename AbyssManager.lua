local GameManager = require "lib/GameManager"
local settings = require "menus/Settings"
local main_menu = require "menus/MainMenu"

local arena = require "game/levels/Arena"
local arena_with_map = require "game/levels/ArenaWithMap"
local AbyssManager = GameManager:extend()

function AbyssManager.new(self)
	AbyssManager.super.new(self)
	arena:setGameManager(self)
	main_menu:setGameManager(self)
	settings:setGameManager(self)
	arena_with_map:setGameManager(self)
	self.currentScene = main_menu
end

function AbyssManager.changeToScene(self, scene_name)
	if scene_name == "main_menu" then
		self.currentScene = main_menu
	elseif scene_name == "settings" then
		self.currentScene = settings
	elseif scene_name == "arena" then
		self.currentScene = arena
	elseif scene_name == "arena_with_map" then
		self.currentScene = arena_with_map
	end
end

return AbyssManager