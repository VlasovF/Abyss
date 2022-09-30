local Object = require "lib/classic"
local KeyboardManager = Object:extend()

function KeyboardManager.new(self)
	self.key_states = {}
end

function KeyboardManager.keypressed(self, key, scancode, isrepeat)
	self.key_states[key] = true
end

function KeyboardManager.keyreleased(self, key)
	self.key_states[key] = false
end

function KeyboardManager.isDown(self, key)
	-- return love.keyboard.isDown(key)
	return self.key_states[key]
end

function KeyboardManager.isUp(self, key)
	return self.key_states[key] == false
end

return KeyboardManager
