local SettingsManager = require "menus/SettingsManager"
local Scene = require "menus/MenuScene"
local BigHeader = require "ui/BigHeader"
local Button = require "ui/Button"

local settings_manager = SettingsManager()
local settings = Scene(settings_manager)

local header1 = BigHeader(10, 10, "Settings")
local button1 = Button(10, 35, 150, 25, "return")

settings:addObject(header1)
button1:setEventName("return")
settings:addObject(button1)

return settings