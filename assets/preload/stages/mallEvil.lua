function onCreate()
	setPropertyFromClass('PauseSubState', 'songName', 'pausemusic/week2pause')
		playSound("intromusic/week2pause", 0.5, 'lol')
end

function onCreatePost()
if not lowQuality then
makeLuaSprite("overlay", "shaders/thorns", -1700, -1050)
setProperty("overlay.alpha", 0.65)
scaleObject('overlay', 1.5, 1.5);
setBlendMode('overlay', 'add')
addLuaSprite("overlay", true)
end
end

function onStartCountdown()
soundFadeIn('lol', 2, 0.5, 0)
end

function onPause()
stopSound('lol')
end
