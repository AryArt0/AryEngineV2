function onCreate()
	setPropertyFromClass('PauseSubState', 'songName', 'pausemusic/week6pause')
end

function onCreatePost()
if not lowQuality then
makeLuaSprite("overlay", "shaders/thorns", -1700, -650)
setProperty("overlay.alpha", 0.45)
scaleObject('overlay', 1.5, 1.5);
setBlendMode('overlay', 'normal')
addLuaSprite("overlay", true)
	end
end
