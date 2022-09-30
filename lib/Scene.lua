local Object = require "lib/classic"
local Scene = Object:extend()

function Scene.new(self, scene_manager)
	self.objects = {}
	self.scene_manager = scene_manager
	self.active_object = nil	
end

function Scene.update(self, dt)
	for i=1,#self.objects do
		self.objects[i]:update(dt)
	end
end

function Scene.draw(self)
	for i=1,#self.objects do
		self.objects[i]:draw()
	end
end

function Scene.addObject(self, object)
	if object ~= nil then
		object:setSceneManager(self.scene_manager)
		table.insert(self.objects, object)						
	end
end

function Scene.removeObject(self, object)
	if object ~= nil and #self.objects > 0 then
		for i = 1, #self.objects do
			if self.objects[i] == object then
				table.remove(self.objects, i)				
				break
			end
		end
	end
end

function Scene.clear(self)
	self.objects = {}
end

function Scene.keypressed(self, key, scancode, isrepeat)
end

function Scene.keyreleased(self, key)
end

function Scene.mousepressed(self, x, y, button, istouch)
end

function Scene.setGameManager(self, game_manager)
	self.scene_manager:setGameManager(game_manager)
end

function Scene.changeActiveObject(self, object)
	if self.active_object ~= nil then
		self.active_object:unfocus()
	end

	self.active_object = object

	if self.active_object ~= nil then	
		self.active_object:focus()
	end
end

return Scene