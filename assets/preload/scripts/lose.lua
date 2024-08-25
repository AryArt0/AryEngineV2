function onCreate()
	luaDebugMode = true
	precacheImage("lose")
end

function onUpdate()
	if (getProperty("startingSong") or not getProperty("startedCountdown")) then at = -1 return end
	at = getSongPosition()
end

function formatTime(ms)
	s = math.floor(ms/1000)
	return string.format('%01d:%02d', (s/60)%60, s%60)
end

function onGameOverStart()
	makeLuaSprite("lose", "lose", 25, 20)
	addAnimationByPrefix("lose", "lose", "lose", 24, false)
	scaleObject("lose", 0.4, 0.4)
	addOffset("lose", "lose", 0, 154)
	setObjectCamera("lose", "other")
	setProperty("lose.alpha", 0)
	y = 38 - 154 + getProperty("lose.height")

	makeLuaText(
		"loseText",
		getPropertyFromClass("PlayState", "instance.scoreTxt.text"),
		800,
		37, y + 148
	)
	setTextSize("loseText", 16)
	setTextFont('loseText', 'vcr2.ttf')
	setTextAlignment("loseText", "left")
	setProperty("loseText.alpha", 0)
	setObjectCamera("loseText", "other")

	makeLuaText(
		"loseText2",
		"On " .. songName .. (at < 0 and "" or " at " .. formatTime(at)),
		800,
		37, y + 168
	)
	setTextSize("loseText2", 16)
	setTextFont('loseText2', 'vcr2.ttf')
	setTextAlignment("loseText2", "left")
	setProperty("loseText2.alpha", 0)
	setObjectCamera("loseText2", "other")

	runTimer("lose", 2.5)
	runTimer("loseshow1", 3.8)
	runTimer("loseshow2", 4.2)
end

function onGameOverConfirm()
	runTimer("losefade", .7)
end

local timers = {
	lose = function()
		doTweenAlpha("loseA", "lose", 1, 1, "quadout")
		addLuaSprite("lose")
	end,
	loseshow1 = function()
		doTweenY("loseTextY", "loseText", y + 140, 1, "quadout")
		doTweenAlpha("loseTextA", "loseText", 1, 1, "quadout")
		addLuaText("loseText")
	end,
	loseshow2 = function()
		doTweenY("loseText2Y", "loseText2", y + 158, 1, "quadout")
		doTweenAlpha("loseText2A", "loseText2", 1, 1, "quadout")
		addLuaText("loseText2")
	end,
	losefade = function()
		doTweenAlpha("lf1", "loseText", 0, 2)
		doTweenAlpha("lf2", "loseText2", 0, 2)
		doTweenAlpha("lf3", "lose", 0, 2)
	end
}

function onTimerCompleted(tag)
	if (timers[tag]) then timers[tag]() end
end
