local Object = require "classic"
local Animation = Object:extend()

function Animation:new(atlas, start_offset_x, start_offset_y,
	width, height, offset_x, offset_y, line_size_in_frames,
	start_frame, frames, fps, loop)
	self.fps = fps
	self.timer = 1 / self.fps
	self.index = 1
	if type(frames) == "table" then
		self.frames = frames
	else
		self.frames = {}
		for i = 1, frames do
			self.frames[i] = i + start_frame - 1			
		end
	end
	self.line_size_in_frames = line_size_in_frames 
	self.start_offset_x = start_offset_x
	self.start_offset_y = start_offset_y
	self.offset_x = offset_x 
	self.offset_y = offset_y
	self.width = width
	self.height = height
	self.loop = loop == nil or loop
	self.done = false
	self.atlas = atlas
	self.current_frame_x = 0
	self.current_frame_y = 0	
	self.quad = love.graphics.newQuad(
		self.offset_x, self.offset_y,
		self.width, self.height, self.atlas:getDimensions())
	self:reset()
end

function Animation:reset()
	self.timer = 1 / self.fps
	self.index = 1	
	self.done = false
	self:updateQuad()
end

function Animation:updateQuad()
	local line_number = math.ceil(self.frames[self.index] / self.line_size_in_frames)
	local column_number = self.frames[self.index] - (line_number - 1) * self.line_size_in_frames
	self.current_frame_x = self.start_offset_x + (column_number - 1) * (self.width + self.offset_x)
	self.current_frame_y = self.start_offset_y + (line_number - 1) * (self.height + self.offset_y)
	self.quad:setViewport(self.current_frame_x, self.current_frame_y, 
				self.width, self.height)
end

function Animation:update(dt)
	if #self.frames <= 1 then return
	elseif self.timer > 0 then
		self.timer = self.timer - dt
		if self.timer <= 0 then
			self.timer = 1 / self.fps
			self.index = self.index + 1
			if self.index > #self.frames then
				if self.loop then
					self.index = 1
				else
					self.index = #self.frames
					self.timer = 0
					self.done = true
				end
			end			
			self:updateQuad()
		end
	end
end

return Animation