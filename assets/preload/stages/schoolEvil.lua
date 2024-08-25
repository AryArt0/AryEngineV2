function onCreate()
	setPropertyFromClass('PauseSubState', 'songName', 'thornsGameOver')
end

function onCreatePost()
if not lowQuality then
makeLuaSprite("overlay", "shaders/thorns", -1700, -1650)
setProperty("overlay.alpha", 0.65)
scaleObject('overlay', 1.5, 1.5);
setBlendMode('overlay', 'add')
addLuaSprite("overlay", true)
	end
end
