function onCreate()
precacheImage('Flash')
makeLuaSprite('dflash', 'Flash', -3000, -2500)
scaleObject('dflash', 3.5, 3.5)
setBlendMode('dflash', "add")
end

function onEvent(name, value1, value2)
	if name == 'Disco Flash' and value1 == '1' then
	beat = true
	elseif name == 'Disco Flash' then
	beat = false
end
end




function onBeatHit()
		if curBeat % 1 == 0 and beat then
	      addLuaSprite('dflash', true);
	      setLuaSpriteScrollFactor('dflash',0,0)
	      setProperty('dflash.scale.x',2)
	      setProperty('dflash.scale.y',2)
	      setProperty('dflash.alpha',0)
		setProperty('dflash.alpha', 0.1)
		doTweenAlpha('flTw','dflash',0, 0.3,'linear')
	end
end
