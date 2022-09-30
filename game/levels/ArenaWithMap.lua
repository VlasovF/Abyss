local ArenaWithMapManager = require "game/levels/ArenaWithMapManager"
local Scene = require "game/levels/LevelWithMapScene"
local RogueLikeHero = require "game/objects/RogueLikeHero"
local Ground = require "game/objects/Ground"
local Walls = require "game/objects/Walls"

local arena_with_map_manager = ArenaWithMapManager()
local arena_with_map = Scene(arena_with_map_manager)

local rogue_like_hero = RogueLikeHero(300, 300)
local new_hero = RogueLikeHero(100, 100)
local ground = Ground()
local walls = Walls()

arena_with_map:addObject(ground)
arena_with_map:addObject(walls)
arena_with_map:addObject(rogue_like_hero)
arena_with_map:changeActiveObject(rogue_like_hero)
arena_with_map:addObject(new_hero)

return arena_with_map