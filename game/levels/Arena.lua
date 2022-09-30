local ArenaManager = require "game/levels/ArenaManager"
local Scene = require "game/levels/LevelScene"
local RogueLikeHero = require "game/objects/RogueLikeHero"
local GreyHero = require "game/objects/GreyHero"


local arena_manager = ArenaManager()
local arena = Scene(arena_manager)

local rogue_like_hero = RogueLikeHero(100, 100)
local grey_hero = GreyHero(300, 100)

arena:addObject(rogue_like_hero)
arena:addObject(grey_hero)

-- arena:changeActiveObject(rogue_like_hero)
arena:changeActiveObject(grey_hero)

return arena