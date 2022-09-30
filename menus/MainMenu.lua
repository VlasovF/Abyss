local MainMenuManager = require "menus/MainMenuManager"
local Scene = require "menus/MenuScene"
local BigHeader = require "ui/BigHeader"
local Button = require "ui/Button"

local main_menu_manager = MainMenuManager()
local main_menu = Scene(main_menu_manager)

local header1 = BigHeader(10, 10, "Main menu")
local arena = Button(10, 35, 150, 25, "arena")
local arena_with_map = Button(10, 70, 150, 25, "arena with map")
local settings = Button(10, 105, 150, 25, "settings")
local quit = Button(10, 150, 150, 25, "quit")

main_menu:addObject(header1)
arena:setEventName("arena")
main_menu:addObject(arena)
arena_with_map:setEventName("arena_with_map")
main_menu:addObject(arena_with_map)
settings:setEventName("settings")
main_menu:addObject(settings)
quit:setEventName("quit")
main_menu:addObject(quit)

return main_menu