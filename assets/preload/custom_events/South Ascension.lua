function onCreate()
precacheImage('WhiteFlash')
makeLuaSprite('whitebg', 'WhiteFlash', -600, -600)
scaleObject('whitebg', 2.5, 2.5)
setProperty('whitebg.alpha', 0)
addLuaSprite('whitebg', false)
end

function onEvent(name, value1, value2)
	if name == 'South Ascension' and value1 == 'a' then
	  setProperty('whitebg.alpha', 1)
		setProperty('boyfriend.color', '000000')
		setProperty('dad.color', '000000')
		setProperty('gf.alpha', 0)
		setProperty('overlay1.alpha', 0)
	end
	if name == 'South Ascension' and value1 == 'b' then
		setProperty('whitebg.alpha', 0)
		setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('gf.alpha', 1)
		setProperty('overlay1.alpha', 1)
	end
end
