local enemyScore = 0
local playerScore = 0
local songMissesP2 = 0
local noteMissesP2 = 0

function onCreate()
if hideHud then
	initSaveData('options') -- add the save data for options
	scoreTextToggle = true
	timeBarToggle = false
	flipSide = false
	enemyStats = true
	watermark = false
	missFlash = true
	zoomHealth = true

	if scoreTextToggle == 'scoreTextToggle' then -- sets defaults if options aren't set
		setDataFromSave('options', 'scoreTextToggle', true)
		flushSaveData('options')
	end
	if timeBarToggle == 'timeBarToggle' then
		setDataFromSave('options', 'timeBarToggle', false)
		flushSaveData('options')
	end
	if flipSide == 'flipSide' then
		setDataFromSave('options', 'flipSide', false)
		flushSaveData('options')
	end
	if enemyStats == 'enemyStats' then
		setDataFromSave('options', 'enemyStats', true)
		flushSaveData('options')
	end
	if watermark == 'watermark' then
		setDataFromSave('options', 'watermark', false)
		flushSaveData('options')
	end
	if missFlash == 'missFlash' then
		setDataFromSave('options', 'missFlash', false)
		flushSaveData('options')
	end
	if zoomHealth == 'zoomHealth' then
		setDataFromSave('options', 'zoomHealth', true)
		flushSaveData('options')
	end

	if scoreTextToggle then
		isPixelStage = getPropertyFromClass('PlayState', 'isPixelStage')
		makeLuaSprite('hud', (isPixelStage and 'pixel/hudmomentPixel' or 'hudmoment'), (flipSide and 50 or 880), (downscroll and 50 or 590))
		scaleObject('hud', 0.6, 0.6)
		setObjectCamera('hud', 'camHUD')
		addLuaSprite('hud', true)

		makeLuaText('score', '0', 1280, (flipSide and -400 or 430), (downscroll and 52.5 or 590))
		setObjectCamera('score', 'camHUD')
		setTextFont('score', (isPixelStage and 'pixel.otf' or 'thefontever.ttf'))
		setTextSize('score', (isPixelStage and 24 or 35))
		addLuaText('score', true)

		makeLuaText('accuracy', '0', 1280, (flipSide and -490 or 340), (downscroll and 100 or 637.5))
		setObjectCamera('accuracy', 'camHUD')
		setTextFont('accuracy', (isPixelStage and 'pixel.otf' or 'thefontever.ttf'))
		setTextSize('accuracy', (isPixelStage and 25 or 30))
		addLuaText('accuracy', true)

		makeLuaText('misses', '0', 1280, (flipSide and -362.5 or 467.5), (downscroll and 100 or 637.5))
		setObjectCamera('misses', 'camHUD')
		setTextFont('misses', (isPixelStage and 'pixel.otf' or 'thefontever.ttf'))
		setTextSize('misses', (isPixelStage and 25 or 30))
		addLuaText('misses', true)

		makeLuaText('health', '50', 1280, (flipSide and -279 or 551), (downscroll and 85 or 622.5))
		setObjectCamera('health', 'camHUD')
		setTextFont('health', (isPixelStage and 'pixel.otf' or 'thefontever.ttf'))
		setTextSize('health', (isPixelStage and 25 or 30))
		addLuaText('health', true)

		if enemyStats then
			makeLuaSprite('hudO', (isPixelStage and 'pixel/hudmomentPixel' or 'hudmoment'), (flipSide and 880 or 50), (downscroll and 50 or 590))
			scaleObject('hudO', 0.6, 0.6)
			setObjectCamera('hudO', 'camHUD')
			setObjectOrder('hudO', getObjectOrder('missP2') -1)
			addLuaSprite('hudO', true)

			makeLuaText('scoreO', '0', 1280, (flipSide and 430 or -400), (downscroll and 52.5 or 590))
			setObjectCamera('scoreO', 'camHUD')
			setTextFont('scoreO', (isPixelStage and 'pixel.otf' or 'thefontever.ttf'))
			setTextSize('scoreO', (isPixelStage and 24 or 35))
			addLuaText('scoreO', true)

			makeLuaText('accuracyO', '0', 1280, (flipSide and 340 or -490), (downscroll and 100 or 637.5))
			setObjectCamera('accuracyO', 'camHUD')
			setTextFont('accuracyO', (isPixelStage and 'pixel.otf' or 'thefontever.ttf'))
			setTextSize('accuracyO', (isPixelStage and 25 or 30))
			addLuaText('accuracyO', true)

			makeLuaText('missesO', '', 1280, (flipSide and 467.5 or -362.5), (downscroll and 100 or 637.5))
			setObjectCamera('missesO', 'camHUD')
			setTextFont('missesO', (isPixelStage and 'pixel.otf' or 'thefontever.ttf'))
			setTextSize('missesO', (isPixelStage and 25 or 30))
			addLuaText('missesO', true)

			makeLuaText('healthO', '50', 1280, (flipSide and 551 or -279), (downscroll and 85 or 622.5))
			setObjectCamera('healthO', 'camHUD')
			setTextFont('healthO', (isPixelStage and 'pixel.otf' or 'thefontever.ttf'))
			setTextSize('healthO', (isPixelStage and 25 or 30))
			addLuaText('healthO', true)
		end
	end
	if watermark then
		makeLuaText('version', 'Psych Engine v'..version..' • Alien HomiHUD v5.0', 0, 5, (downscroll and 695 or 5))
		setTextFont('version', (isPixelStage and 'pixel.otf' or 'thefontever.ttf'))
		setObjectCamera('version', 'camHUD')
		setTextBorder('version', 1, '000000')
		addLuaText('version', true)
		if isPixelStage then
			setTextSize('version', 12)
		end
	end
end
end

function onCreatePost()
if hideHud then
	if scoreTextToggle then
		setProperty('scoreTxt.visible', false)
		setProperty('healthBar.visible', false)
		setProperty('healthBarBG.visible', false)
		setProperty('iconP1.visible', true)
		setProperty('iconP2.visible', true)
		setProperty('iconP1.flipX', true)
		setObjectOrder('iconP1', getObjectOrder('score') +1)
		if not enemyStats then
			setProperty('iconP2.visible', false)
		else
			setObjectOrder('iconP2', getObjectOrder('scoreO') +1)
		end
	end
	if botPlay then
		setTextString('botplayTxt', '')
	end
end
end


function onUpdatePost(elapsed)
	if scoreTextToggle then
		setProperty('iconP1.x', (flipSide and 40 or 870))
		setProperty('iconP1.y', (downscroll and -10 or 530))
		scaleObject('iconP1', 0.9, 0.9)
		if not botPlay then
			setTextString('score', score)
			setTextString('accuracy', round(rating*100, 2))
			setTextString('misses', getProperty('songMisses'))
		else
			setTextString('score', playerScore)
		end
		setTextString('health', getProperty('healthBar.percent'))
		setProperty('hud.alpha', getProperty('scoreTxt.alpha'))
		setProperty('score.alpha', getProperty('scoreTxt.alpha'))
		setProperty('misses.alpha', getProperty('scoreTxt.alpha'))
		setProperty('accuracy.alpha', getProperty('scoreTxt.alpha'))
		setProperty('health.alpha', getProperty('scoreTxt.alpha'))
		if enemyStats then
			setTextString('scoreO', enemyScore)
			setTextString('healthO', 100-getProperty('healthBar.percent'))
			setProperty('iconP2.x', (flipSide and 870 or 50))
			setProperty('iconP2.y', (downscroll and -20 or 527))
			scaleObject('iconP2', 0.9, 0.9)
			setProperty('hudO.alpha', getProperty('scoreTxt.alpha'))
			setProperty('scoreO.alpha', getProperty('scoreTxt.alpha'))
			setProperty('missesO.alpha', getProperty('scoreTxt.alpha'))
			setProperty('accuracyO.alpha', getProperty('scoreTxt.alpha'))
			setProperty('healthO.alpha', getProperty('scoreTxt.alpha'))
		end
	end
	if timeBarToggle then
		setProperty('timeBarCool.x', getProperty('timeBarBG.x')-1)
		setProperty('timeBarCool.y', getProperty('timeBarBG.y'))
		setProperty('timeBarCool.alpha', getProperty('timeBarBG.alpha'))
		setProperty('timeBarCool.visible', getProperty('timeBar.visible'))
		setProperty('face.x', getProperty('timeBar.x')-50)
		setProperty('face.y', getProperty('timeBar.y')-35)
		setProperty('face.alpha', getProperty('timeBar.alpha'))
		setProperty('face.visible', getProperty('timeBar.visible'))
	end





	for i = 0, getProperty('notes.length')-1 do
			local strumTime = getPropertyFromGroup('notes', i, 'strumTime')
			local distance = strumTime - getSongPosition();
			data = getPropertyFromGroup('notes', i, 'noteData')
			if getPropertyFromGroup('notes', i, 'mustPress') == false then
					math.randomseed(strumTime)
					noteran = math.random(1,missc)
					if ranstoring == 1 and distance >= 10 and distance <= 20 then
							setPropertyFromGroup('notes', i, 'ignoreNote', true)
							playAnim('dad', ame[data+1], false)
							hpp = getProperty('health')
							setProperty('health',hpp + 0.023)
							opponentmiss = opponentmiss + 1
					end
			end
	end
end


function onStepHit()
    if curStep % 2 == 0 then
        ranstoring = noteran
    end
end


function round(x, n)
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return  x / n
end
function goodNoteHit(id, data, type, sus)
	if scoreTextToggle and not sus and hideHud then
		if botPlay then
			if getTextString('accuracy') == '0' then
				setTextString('accuracy', '100')
			end
			playerScore = playerScore + 350
		end
		if scoreZoom then
			doTweenX('scoreZoom1', 'score.scale', 1.1, 0.01, 'linear')
			doTweenY('scoreZoom2', 'score.scale', 1.1, 0.01, 'linear')
			doTweenX('scoreZoom3', 'score.scale', 1, 0.1, 'linear')
			doTweenY('scoreZoom4', 'score.scale', 1, 0.1, 'linear')
			doTweenX('scoreZoom5', 'accuracy.scale', 1.1, 0.01, 'linear')
			doTweenY('scoreZoom6', 'accuracy.scale', 1.1, 0.01, 'linear')
			doTweenX('scoreZoom7', 'accuracy.scale', 1, 0.1, 'linear')
			doTweenY('scoreZoom8', 'accuracy.scale', 1, 0.1, 'linear')
			doTweenX('scoreZoom9', 'misses.scale', 1.1, 0.01, 'linear')
			doTweenY('scoreZoom10', 'misses.scale', 1.1, 0.01, 'linear')
			doTweenX('scoreZoom11', 'misses.scale', 1, 0.1, 'linear')
			doTweenY('scoreZoom12', 'misses.scale', 1, 0.1, 'linear')
			if zoomHealth then
				doTweenX('scoreZoom13', 'health.scale', 1.1, 0.01, 'linear')
				doTweenY('scoreZoom14', 'health.scale', 1.1, 0.01, 'linear')
				doTweenX('scoreZoom15', 'health.scale', 1, 0.1, 'linear')
				doTweenY('scoreZoom16', 'health.scale', 1, 0.1, 'linear')
			end
		end
	end
end

function noteMiss(id, data, type, sus)
	if scoreTextToggle and missFlash and not hideHud then
		setTextColor('misses', 'ff0000')
		doTweenColor('flashMeBack', 'misses', 'ffffff', 0.5, 'linear') -- camellia reference lmfao
		setTextColor('score', 'ff0000')
		doTweenColor('flashMeBack1', 'score', 'ffffff', 0.5, 'linear')
		setTextColor('accuracy', 'ff0000')
		doTweenColor('flashMeBack2', 'accuracy', 'ffffff', 0.5, 'linear')
		setTextColor('health', 'ff0000')
		doTweenColor('flashMeBack3', 'health', 'ffffff', 0.5, 'linear')
	end
end


function opponentNoteHit(id, data, type, sus)
	if enemyStats and not sus and hideHud then
		if getTextString('accuracyO') == '0' then
				setTextString('accuracyO', '')
				setTextString('missesO', "")
		end
		enemyScore = enemyScore + 350
		if scoreZoom then
			doTweenX('scoreZoomO1', 'scoreO.scale', 1.1, 0.01, 'linear')
			doTweenY('scoreZoomO2', 'scoreO.scale', 1.1, 0.01, 'linear')
			doTweenX('scoreZoomO3', 'scoreO.scale', 1, 0.1, 'linear')
			doTweenY('scoreZoomO4', 'scoreO.scale', 1, 0.1, 'linear')
			doTweenX('scoreZoomO5', 'accuracyO.scale', 1.1, 0.01, 'linear')
			doTweenY('scoreZoomO6', 'accuracyO.scale', 1.1, 0.01, 'linear')
			doTweenX('scoreZoomO7', 'accuracyO.scale', 1, 0.1, 'linear')
			doTweenY('scoreZoomO8', 'accuracyO.scale', 1, 0.1, 'linear')
			doTweenX('scoreZoomO9', 'missesO.scale', 1.1, 0.01, 'linear')
			doTweenY('scoreZoomO10', 'missesO.scale', 1.1, 0.01, 'linear')
			doTweenX('scoreZoomO11', 'missesO.scale', 1, 0.1, 'linear')
			doTweenY('scoreZoomO12', 'missesO.scale', 1, 0.1, 'linear')
			if zoomHealth then
				doTweenX('scoreZoomO13', 'healthO.scale', 1.1, 0.01, 'linear')
				doTweenY('scoreZoomO14', 'healthO.scale', 1.1, 0.01, 'linear')
				doTweenX('scoreZoomO15', 'healthO.scale', 1, 0.1, 'linear')
				doTweenY('scoreZoomO16', 'healthO.scale', 1, 0.1, 'linear')
			end
		end
	end
end
