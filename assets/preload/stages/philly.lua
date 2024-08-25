function onCreatePost()
if not lowQuality then
	makeLuaSprite("overlay", "shaders/moonlight", -1030, 75)
	setBlendMode("overlay", "overlay")
	scaleObject('overlay', 1, 0.45);
	addLuaSprite("overlay", true)
end
end

function onCreate()
	setPropertyFromClass('PauseSubState', 'songName', 'pausemusic/week3pause')
	playSound("intromusic/week3pause", 0.25, 'lol')
end


function onStartCountdown()
soundFadeIn('lol', 2, 0.25, 0)
end

function onPause()
stopSound('lol')
end
