function onGameOverStart()
playSound("explode", 0.8)


	makeAnimatedLuaSprite('explosion', 'explosionfrom_edd', -1600, -850);
	addAnimationByPrefix('explosion', 'boom', 'TordBotBlowingUp', 18, false);
	setProperty('explosion.angle', -90);
	setProperty('explosion.alpha', 0);
	addLuaSprite('explosion', true);
	scaleObject('explosion', 2.5, 2.5);
	cameraShake('camGame', 0.02, 0.5);

	makeLuaSprite('bgd', 'BlackFlash', -1500, -1500)
	scaleObject('bgd', 3, 3.5)
	setObjectOrder('bgd', getObjectOrder('gfGroup') + 4)
	addLuaSprite('bgd', false)

	setProperty('explosion.alpha', 1);
	objectPlayAnimation('explosion', 'boom', true);
	playSound('shot1', 1)
	runTimer('picoded', 1.5)
end



function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'picoded' then
        playSound('cutscene/nene_laugh', 1)
				end
		if tag == 'picoded2' then
				doTweenAlpha('fadebgdgone', 'bgd', 0, 4, 'linear');
    end
  end








-- crash prevention
function onUpdate() end
function onUpdatePost() end
