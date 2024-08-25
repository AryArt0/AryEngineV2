function onGameOverStart()
cameraShake("game", 0.005, 0.3)
stop = true

	makeLuaSprite("left_lg","LEFTB",-140,-50)
	addLuaSprite("left_lg",true)
	setObjectCamera('left_lg','other')
	setBlendMode("left_lg","add")
	doTweenColor('purple_hi', 'left_lg', 'FFFFFFFF', 0.1, 'quartIn')
	runTimer("purple1",0.1)

	makeLuaSprite("left_bg","LEFTLB",-140,-80)
	addLuaSprite("left_bg",true)
	setObjectCamera('left_bg','other')
	scaleObject ('left_bg', 1.2, 1.2)
	setBlendMode("left_bg","add")
	doTweenColor('purple_hi', 'left_bg', 'FFFFFFFF', 0.1, 'quartIn')
	runTimer("purple2",0.1)
end


function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'purple1' then
        doTweenAlpha('purple_lg', 'left_lg', 0, 1, 'linear');
				elseif tag == 'purple2' then
			  doTweenAlpha('purple_l', 'left_bg',0, 6, 'linear');
    end
  end


function onTweenCompleted(tag)
    if tag == 'purple_lg' then
        removeLuaSprite('left_lg', true);
				elseif tag == 'purple_l' then
			  removeLuaSprite('left_bg', true);
    end
end
