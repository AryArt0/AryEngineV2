function onCreatePost()
health = getProperty('health')
if not hideHud and getPropertyFromClass('ClientPrefs', 'lockIn') then
makeLuaSprite('vlow', 'shadow', -1500, -1500)
setProperty('vlow.alpha', 0)
scaleObject('vlow', 3, 3.5)
setObjectOrder('vlow', getObjectOrder('gfGroup') + 1)
addLuaSprite('vlow', false)
end
end


function onUpdate()
if not hideHud and lockIn then
	if getProperty('health') > 0.35 then
	  doTweenAlpha('fade', 'vlow', 0, 0.2, 'linear');
    setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
	elseif getProperty('health') < 0.35 then
		doTweenAlpha('fadeout', 'vlow', 1, 0.5, 'linear');
    setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0.45)
    end
	end
end

function onBeatHit()
	if curBeat % 2 == 0 and getProperty('health') < 0.35 and not hideHud and lockIn then
	playSound('heartbeat', 0.75)
end
end
