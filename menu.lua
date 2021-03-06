-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local data = require("data")
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"

--------------------------------------------

-- forward declarations and other locals
local playBtn

-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
	
	-- go to level1.lua scene
	composer.gotoScene( "level1", "fade", 500 )
	
	return true	-- indicates successful touch
end

local function onScoreBtnRelease()

	composer.gotoScene( "scores", "fade", 500 )

	return true
end

function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	local background = display.newImageRect( "background1.png", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = 0, 0
	
	-- create/position logo/title image on upper-half of the screen
--	local titleLogo = display.newImageRect( "logo.png", 264, 42 )
--	titleLogo.x = display.contentWidth * 0.5
--	titleLogo.y = 100
	
	-- create a widget button (which will loads level1.lua on release)
	scoreBtn = display.newText("High Scores", display.contentWidth/2 + 400, display.contentHeight/2 - 270, native.systemFont, 50)
	scoreBtn:setFillColor(0, 0, 0)
	function scoreBtn:tap(event)
	composer.gotoScene("scores", "fade", 500)
	end
	scoreBtn:addEventListener("tap", scoreBtn)

	playBtn = display.newText("Start Your Run", display.contentWidth/2, display.contentHeight/2 +220, native.systemFont, 50)
	playBtn:setFillColor(0, 0, 0)
	function playBtn:tap(event)
		composer.gotoScene("level1", "fade", 500)
	end
	playBtn:addEventListener("tap", playBtn)
	-- event listener function

	
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( scoreBtn )
	sceneGroup:insert( playBtn )
--	sceneGroup:insert( titleLogo )

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end


---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )

-----------------------------------------------------------------------------------------

return scene