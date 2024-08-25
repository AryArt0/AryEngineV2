function onCreate()
	makeAnimatedLuaSprite('dust', 'dust', 0, -210)   --Numbers control x and y position
	luaSpriteAddAnimationByPrefix('dust', 'dust', 'dust anim', 16, true);   --Number controls framerate
	doTweenAngle('turnp', 'dust', 45, 0, 'linear') --First number controls rotation
	setObjectCamera('dust', 'camHUD')
	setProperty('dust.alpha', 0)
	scaleObject('dust', 4.5, 4.5) --Numbers control scale of sprite
	addLuaSprite('dust', true) --Adds sprite
end

function onUpdatePost()
	local song_pos = getSongPosition()

	if song_pos >= 82290 then
	doTweenAlpha('snowfall', 'dust', 0.5, 2.5, 'linear')
	end

	if song_pos >= 96100 then
	doTweenAlpha('snowfall2', 'dust', 0, 2.5, 'linear')
	end
end
