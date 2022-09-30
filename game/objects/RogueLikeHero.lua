local GameObject = require "lib/GameObject"
local Animation = require "lib/Animation"
local KeyboardManager = require "lib/KeyboardManager"
local BoundsMesh = require "lib/BoundsMesh"
local RectangleBounds = require "lib/RectangleBounds"
local CircleBounds = require "lib/CircleBounds"

local RogueLikeHero = GameObject:extend()

local PI = math.pi

function RogueLikeHero.new(self, x, y)
	RogueLikeHero.super.new(self, x, y)
	self.animations = {}	
	self.current_anim = ""
	self:installAnimations()
	self.key = KeyboardManager()
	self.move_direction = {0, 0}
	self.speed = 100
	self.flip = 1
	local new_rectangle_bounds = RectangleBounds(64, 64, -32, -32)
	local new_circle_bounds = CircleBounds(32)
	self.bounds = BoundsMesh(self)
	self.bounds:addBounds(new_rectangle_bounds)
end

function RogueLikeHero.update(self, dt)
	self:updateStatus(dt)
	self:updateCoords(dt)
	self:updateAnimation(dt)	
end

function RogueLikeHero.updateStatus(self, dt)
	self.move_direction = {0, 0}

	if self.current_anim ~= "attack" then

	if self.key:isDown("up") then
		self.move_direction[1] = self.move_direction[1] - 1
	end

	if self.key:isDown("right") then
		self.move_direction[2] = self.move_direction[2] - 1
	end

	if self.key:isDown("down") then
		self.move_direction[1] = self.move_direction[1] + 1
	end

	if self.key:isDown("left") then
		self.move_direction[2] = self.move_direction[2] + 1		
	end

		if self.move_direction[1] ~= 0 or self.move_direction[2] ~= 0 then
			self.current_anim = "run"		
		else
			self.current_anim = "idle"
		end

	end

	if self.key:isDown("space") then
		self.current_anim = "attack"
		self.move_direction = {0, 0}
	end
end

function RogueLikeHero.updateCoords(self, dt)
	local move_angle = 0
	if self.move_direction[2] == 1 then
		move_angle = PI
		self.flip = -1
		if self.move_direction[1] ~= 0 then
			move_angle = self.move_direction[1] * PI * 3 / 4			
		end		
	elseif self.move_direction[2] == -1 then
		move_angle = 0
		self.flip = 1
		if self.move_direction[1] ~= 0 then
			move_angle = self.move_direction[1] * PI / 4			
		end			
	else
		move_angle = self.move_direction[1] * PI / 2 
	end
	if self.current_anim == "run" then
		local cos = math.cos(move_angle)
		local sin = math.sin(move_angle)
		self.x = self.x + self.speed * dt * cos
		self.y = self.y + self.speed * dt * sin
	end

	if self.scene_manager.camera ~= nil and self.on_focus == true then
		local x, y, w, h = self.animations[self.current_anim].quad:getViewport()
		self.scene_manager.camera:setCenter(self.x + w / 2, self.y + h / 2)
	end
end

function RogueLikeHero.updateAnimation(self, dt)
	if self.animations[self.current_anim] ~= nil then
		if self.animations[self.current_anim].done ~= true then
			self.animations[self.current_anim]:update(dt)
		else
			self.animations[self.current_anim]:reset()
			self.current_anim = "idle"
		end
	else
		self.current_anim = "idle"
	end
end

function RogueLikeHero.draw(self)
	local x, y, w, h = self.animations[self.current_anim].quad:getViewport()
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(
		self.animations[self.current_anim].atlas,
		self.animations[self.current_anim].quad,
		self.x, self.y, 0, 3 * self.flip, 3, w / 2, h / 2)
end

function RogueLikeHero.add_animation(self, name, animation)
	self.animations[name] = animation
end

function RogueLikeHero.installAnimations(self)
	local atlas = love.graphics.newImage("assets/gfx/rogue like idle.png")
	local idle = Animation(atlas, 0, 0, 100, 100, 0, 0, 3, 1, 3, 3, true)
	self:add_animation("idle", idle)

	atlas = love.graphics.newImage("assets/gfx/rogue like attack.png")
	local attack = Animation(atlas, 0, 0, 100, 100, 0, 0, 10, 1, 10, 10, false)
	self:add_animation("attack", attack)

	atlas = love.graphics.newImage("assets/gfx/rogue like run.png")
	local run = Animation(atlas, 0, 0, 100, 100, 0, 0, 6, 1, 6, 10, true)
	self:add_animation("run", run)
end

function RogueLikeHero.keypressed(self, key, scancode, isrepeat)
	self.key:keypressed(key, scancode, isrepeat)
end

function RogueLikeHero.keyreleased(self, key)	
	self.key:keyreleased(key)
end


return RogueLikeHero