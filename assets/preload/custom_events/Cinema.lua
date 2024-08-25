local posS = {-240, 770}
local posV = {-90, 660}
local cinemaOn = false
function onCreate()
	for i=1,2 do
		makeLuaSprite('bar'..i, nil, -200, posS[i])
		makeGraphic('bar'..i, screenWidth + 150, 200, '000000')
		setObjectCamera('bar'..i, 'hud')
		addLuaSprite('bar'..i)
		setProperty('bar'..i..'.x', -75)
	end
end

function onUpdate(elapsed)
	if cinemaOn then
		for i=1,2 do
			setProperty('bar'..i..'.y', lerp(getProperty('bar'..i..'.y'), posV[i], elapsed))
		end
		setProperty('camHUD.zoom', lerp(getProperty('camHUD.zoom'), 0.9, elapsed))
		setProperty('camGame.zoom', lerp(getProperty('camGame.zoom'), getProperty('defaultCamZoom') - 0.1, elapsed))
		setProperty('camZooming', false)
	else
		for i=1,2 do
			setProperty('bar'..i..'.y', lerp(getProperty('bar'..i..'.y'), posS[i], elapsed * 8))
		end
	end
end

function onChange()
	if cinemaOn then
		cinemaOn = false
		setProperty('camZooming', true)
		setProperty('ratings.alpha', 1)
		doTweenAlpha('ratingsin', 'ratings', 1, 0.3, 'linear')
	else
		cinemaOn = true
		doTweenAlpha('ratingsout', 'ratings', 0, 0.5, 'linear')
	end
end

function lerp(a, b, ratio)
	return a + ratio * (b - a)
end

function onEvent(n)
	if n == 'Cinema' then onChange() end
end
