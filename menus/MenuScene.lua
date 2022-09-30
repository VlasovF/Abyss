local Scene = require "lib/Scene"
local MenuScene = Scene:extend()

function MenuScene.new(self, scene_manager)	
	MenuScene.super.new(self, scene_manager)
	self.prev_mouse_position_x = 0
	self.prev_mouse_position_y = 0
end

function MenuScene.update(self, dt)	
	MenuScene.super.update(self, dt)
	self:mousePositionCheck()
end

function MenuScene.changeActiveObjectToNext(self)
	local new_active_object = nil
	if self.active_object == nil and #self.objects ~= 0 then
		new_active_object = self.objects[1]		
	elseif self.active_object ~= nil and #self.objects ~= 0 then

		for i = 1, #self.objects do
			if self.objects[i] == self.active_object then
				if i ~=	#self.objects then
					new_active_object = self.objects[i+1]
				else
					new_active_object = self.objects[1]
				end			
				break
			end
		end

	else
		new_active_object = nil
	end 
	self:changeActiveObject(new_active_object)
end

function MenuScene.changeActiveObjectToPrev(self)
	local new_active_object = nil
	if self.active_object == nil and #self.objects ~= 0 then
		new_active_object = self.objects[#self.objects]
	elseif self.active_object ~= nil and #self.objects ~= 0 then

		for i = 1, #self.objects do
			if self.objects[i] == self.active_object then
				if i ~=	1 then
					new_active_object = self.objects[i-1]
				else
					new_active_object = self.objects[#self.objects]
				end			
				break
			end
		end

	else
		new_active_object = nil
	end
	self:changeActiveObject(new_active_object)
end

function MenuScene.keypressed(self, key, scancode, isrepeat)
	if key == "tab" then
		self:changeActiveObjectToNext()
	elseif key == "down" then
		self:changeActiveObjectToNext()
	elseif key == "up" then
		self:changeActiveObjectToPrev()
	elseif self.active_object ~= nil then
		self.active_object:keypressed(key, scancode, isrepeat)
	end
end

function MenuScene.mousepressed(self, x, y, button, istouch)
	if self.active_object ~= nil then
		self.active_object:mousepressed(button, istouch)
	end
end


function MenuScene.mousePositionCheck(self)
	local new_active_object = nil
	local x, y = love.mouse.getPosition()
	local check = true
	if self.prev_mouse_position_x ~= x or
		self.prev_mouse_position_y ~= y then

		self.prev_mouse_position_x = x
		self.prev_mouse_position_y = y

		for i = 1, #self.objects do
			check = true

			if x < self.objects[i].x or
			   x > self.objects[i].x + self.objects[i].width then
			   check = false
			end

			if y < self.objects[i].y or
			   y > self.objects[i].y + self.objects[i].height then
			   check = false
			end 

			if check == true then
				new_active_object = self.objects[i]
			end
		end

		self:changeActiveObject(new_active_object)
	end
end

return MenuScene