function love.load()
	love.graphics.setBackgroundColor(30, 30, 30, 255)
	love.graphics.setDefaultFilter('nearest', 'nearest')
	local AbyssManager = require "AbyssManager"
	abyss_manager = AbyssManager()	
end

function love.update(dt)
	abyss_manager:update(dt)
end

function love.draw()
	abyss_manager:draw()
end

function love.mousepressed(x, y, button, istouch)
	abyss_manager:mousepressed(x, y, button, istouch)
end

function love.keypressed(key, scancode, isrepeat)
	abyss_manager:keypressed(key, scancode, isrepeat)
end

function love.keyreleased(key, scancode)
	abyss_manager:keyreleased(key, scancode)	
end