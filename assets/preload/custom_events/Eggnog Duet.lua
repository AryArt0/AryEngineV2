function onCreate()
precacheImage('BlackFlash')
makeLuaSprite('blackbg', 'BlackFlash', -1000, -600)
setObjectOrder('blackbg', getObjectOrder('gfGroup') + 1)
scaleObject('blackbg', 2.5, 2.5)
setProperty('shadow.alpha', 0)
setProperty('blackbg.alpha', 0)
addLuaSprite('blackbg', false)
end

function onEvent(name, value1, value2)
	if name == 'Eggnog Duet' and value1 == '1' then
	  doTweenAlpha('blackbgin', 'blackbg', 1, 1, 'linear');
		doTweenAlpha('oppgone', 'dad', 0, 1.5, 'linear');
		doTweenAlpha('boygone', 'boyfriend', 0, 1.5, 'linear');
	end
	if name == 'Eggnog Duet' and value1 == '0' then
		doTweenAlpha('blackbgout', 'blackbg', 0, 1, 'linear');
		doTweenAlpha('oppback', 'dad', 1, 0.5, 'linear');
		oTweenAlpha('boyback', 'boyfriend', 1, 0.5, 'linear');
		end
	if name == 'Eggnog Duet' and value2 == '1' then
	doTweenAlpha('oppshow', 'dad', 1, 2, 'linear');
	end
	if name == 'Eggnog Duet' and value2 == '2' then
	doTweenAlpha('boyshow', 'boyfriend', 1, 2, 'linear');
	end
end
