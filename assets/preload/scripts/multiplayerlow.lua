function onCreatePost()
health = getProperty('health')

if hideHud then
makeLuaSprite('ouch', 'p1hurt', -140,-50)
setProperty('ouch.alpha', 0)
addLuaSprite("ouch", true)
setObjectCamera('ouch','other')
setBlendMode("ouch","add")
doTweenColor('purple_hi', 'ouch', 'FFFFFFFF', 0.1, 'quartIn')

makeLuaSprite('ouch2', 'p2hurt', -140,-50)
setProperty('ouch2.alpha', 0)
addLuaSprite("ouch2", true)
setObjectCamera('ouch2','other')
setBlendMode("ouch2","add")
doTweenColor('purple_hi2', 'ouch2', 'FFFFFFFF', 0.1, 'quartIn')
end

if songName == 'loading' then
debugPrint("")
elseif not hideHud and getPropertyFromClass('ClientPrefs', 'lockIn') then
makeLuaSprite("ouch3","LEFTLB", 0, -25)
setProperty('ouch3.alpha', 0)
addLuaSprite("ouch3", true)
setObjectCamera('ouch3','other')
scaleObject ('ouch3', 1.1, 1.1)
doTweenColor('purple_hi3', 'ouch3', 'FFFFFFFF', 0.1, 'quartIn')
end
end


function onUpdate()
if hideHud then
	if getProperty('health') > 0.4 then
	  doTweenAlpha('gone', 'ouch', 0, 1, 'linear');
	elseif getProperty('health') < 0.4 then
		doTweenAlpha('plow', 'ouch', 1, 0.5, 'linear');
	end

	if getProperty('health') > 1.6 then
	  doTweenAlpha('olow', 'ouch2', 1, 0.5, 'linear');
	elseif getProperty('health') < 1.6 then
		doTweenAlpha('gone2', 'ouch2', 0, 1, 'linear');
	end
end

if not hideHud and getPropertyFromClass('ClientPrefs', 'lockIn') then
if getProperty('health') > 0.4 then
	doTweenAlpha('gone1', 'ouch3', 0, 1, 'linear');
	end
	if getProperty('health') < 0.4 then
	doTweenAlpha('plow1', 'ouch3', 0.9, 0.5, 'linear');
end
end

if getProperty('health') < 0.4 then
if getProperty('boyfriend.animation.name') == 'idle' then
playAnim('boyfriend', 'scared')
setProperty('boyfriend.specialAnim', true)
end
end
end




function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'uhoh' then
        doTweenAlpha('plow', 'ouch', 1, 0.5, 'linear');
    end
    if tag == 'yay' then
        doTweenAlpha('gone', 'ouch', 0, 1, 'linear');
    end
  end
