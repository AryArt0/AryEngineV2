function onCreatePost()
if not lowQuality then
makeLuaSprite("overlay", "shaders/mall", -2050, -2550)
setBlendMode("overlay", "add")
setProperty("overlay.alpha", 1)
scaleObject('overlay', 1.7, 1.7);
addLuaSprite("overlay", true)
end
end



function onCreate()
	setPropertyFromClass('PauseSubState', 'songName', 'pausemusic/week5pause')
		playSound("intromusic/week5pause", 0.7, 'lol')
end


function onStartCountdown()
soundFadeIn('lol', 2.5, 0.7, 0)
end
function onPause()
stopSound('lol')
end
