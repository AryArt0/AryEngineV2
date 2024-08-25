function onCreatePost()
	setPropertyFromClass("GameOverSubstate", "loopSoundName", "thornsGameOver")
	setPropertyFromClass("GameOverSubstate", "endSoundName", "thornsGameoverEnd")

	if not lowQuality then
		precacheSound("thornsGameOver")
		precacheSound("thornsGameoverEnd")
	end
end


function onGameOverStart()
precacheSound("rage")
playSound("rage", 1)


	makeLuaSprite('bgd', 'BlackFlash', -1500, -1500)
	scaleObject('bgd', 3, 3.5)
	setObjectOrder('bgd', getObjectOrder('gfGroup') + 4)
	addLuaSprite('bgd', false)

	makeLuaSprite('bgt', 'spiritGameOver', 850, 250)
	scaleObject('bgt', 6, 6)
	setObjectOrder('bgt', getObjectOrder('gfGroup') + 5)
	addLuaSprite('bgt', false)

	makeLuaSprite('bgd2', 'BlackFlash', -1500, -1500)
	scaleObject('bgd2', 3, 3.5)
	setObjectOrder('bgd2', getObjectOrder('gfGroup') + 6)
	addLuaSprite('bgd2', false)

	runTimer('ded', 2.5)
end



function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'ded' then
        doTweenAlpha('fadebgdgone', 'bgd2', 0, 4, 'linear');
				end
			end




-- crash prevention
function onUpdate() end
function onUpdatePost() end
