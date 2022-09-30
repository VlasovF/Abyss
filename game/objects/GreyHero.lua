local RogueLikeHero = require "game/objects/RogueLikeHero"
local Animation = require "lib/Animation"
local GreyHero = RogueLikeHero:extend()

function GreyHero.installAnimations(self)
	local atlas = love.graphics.newImage("assets/gfx/warrior_girl/Fumiko.png")
    local width = 24
    local height = 32

    -- quad: 24 x 32
    -- atlas: 17 x 8

    -- Animation:new(atlas, start_offset_x, start_offset_y, width, height, offset_x, offset_y, 
	-- 	line_size_in_frames, start_frame, frames, fps, loop)

    local idle_frames = {
    	2, 2, 2, 2, 2, 2,
    	2, 2, 2, 2, 2, 2,
    	2, 2, 2, 2, 2, 2,
    	2, 2, 2, 2, 2, 2,
    	3, 1,
	}
	local idle = Animation(atlas, 16*width, 0, width, height, 0, 0,
		1, 1, idle_frames, 6, true)
	self:add_animation("idle", idle)


	local run_frames = {
		1, 2, 3, 2
	}
	local run = Animation(atlas, 0, height, width, height, 0, 0, 
		3, 1, run_frames, 3, true)
	self:add_animation("run", run)


	local attack_frames = {
		1, 2, 3, 4, 5, 5
	}
	local attack = Animation(atlas, 0, 5*height, width, height, 0, 0, 
		5, 1, attack_frames, 6, false)
	self:add_animation("attack", attack)
end

return GreyHero

