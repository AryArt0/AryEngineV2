function onCreate()
-- Box pause thingy
makeLuaSprite('BoxPause', 'fpbgradient', 0, 0, -400)
setProperty('BoxPause.alpha', 0.75)
setObjectCamera('BoxPause', 'other')
scaleObject('BoxPause', 1, 1)

makeLuaSprite('BG', 'fpbg', 100, 0)
scaleObject('BG', 1, 1)
setProperty('BG.alpha', 0.6)
setObjectCamera('BG', 'other')

makeLuaSprite('mov','mmov', 0, 0)
setObjectCamera('mov', 'other')
scaleObject('mov', 1, 1)


-- Text thingy
makeLuaText('Text', 'PAUSED', 350, -10, 15)
setTextSize('Text', 75)
setTextFont('Text', 'vcr.ttf')

makeLuaText('PauseText', '[MarkedEngine v.3.8.0]', 1300, 535, 695)
setTextSize('PauseText', 15)
setTextFont('PauseText', 'vcr2.ttf')
setObjectCamera('PauseText', 'other')
setObjectCamera('Text', 'other')
end

function onResume()
	playSound('confirmMenu', 0.75)
	doTweenY('BoxPauseMove', 'BoxPause', 960, 2, 'circInOut')
	doTweenY('PauseTextMove', 'PauseText', 900, 2, 'circInOut')
	doTweenAlpha('BGgone', 'BG', 0, 0.5, 'linear');
	doTweenX('movmove', 'mov', -700, 1.5, 'circInOut')
	doTweenX('Textmove', 'Text', -1000, 1.5, 'circInOut')
	runTimer('BoxPauseBeGone', 2, 2)
end

function onPause()
playSound('pause', 0.75)
addLuaSprite('BoxPause', true)
addLuaSprite('BG', true)
addLuaSprite('mov', true)
addLuaText('Text', true)
addLuaText('PauseText', true)
setObjectOrder('Text', getObjectOrder('mov') + 1)
end

function onTimerCompleted(tag, loops, loopsLeft) -- Removes the box and the text
    if tag == 'BoxPauseBeGone' then
    removeLuaSprite('BoxPause', false)
    removeLuaText('PauseText', false)
		setObjectOrder('Text', -1)
    doTweenY('BoxPauseMove', 'BoxPause', 0, 0.0001, 'circInOut')
    doTweenY('PauseTextMove', 'PauseText', 695, 0.0001, 'circInOut')
		doTweenX('Textmove', 'Text', -10, 0.0001, 'circInOut')
		doTweenAlpha('BGgone', 'BG', 0.6, 0.0001, 'linear');
		doTweenX('movmove', 'mov', 0, 0.0001, 'circInOut')
    end
end

function onTweenCompleted(tag)
    if tag == 'BGgone' then
        removeLuaSprite('BG', false);
    end
		if tag == 'movmove' then
		   removeLuaSprite('mov', false)
end
if tag == 'Textmove' then
 removeLuaSprite('Text', false)
end
end
