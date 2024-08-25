function onCreatePost()
if not lowQuality then
makeLuaSprite("overlay1", "shaders/mist", -24500, -250)
setProperty('overlay1.alpha', 0.8);
scaleObject('overlay1', 13, 2.5);
setScrollFactor('overlay1', 0.9, 0.9);
setProperty('overlay1.velocity.x', 50);
addLuaSprite("overlay1", true)
end
end

function onCreate()
	setPropertyFromClass('PauseSubState', 'songName', 'pausemusic/week2pause')
	playSound("intromusic/week2pause", 0.5, 'lol')
end


function onStartCountdown()
soundFadeIn('lol', 2, 0.5, 0)
end

function onPause()
stopSound('lol')
end
