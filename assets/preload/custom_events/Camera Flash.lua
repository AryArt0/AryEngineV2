function onCreate()
precacheImage('Flash')
end

function onEvent(n,v1,v2)


	if n == 'Camera Flash' then
		 makeLuaSprite('flash', 'Flash', -3000, -2500)
		 scaleObject('flash', 3.5, 3.5)
		 setBlendMode('flash', "add")
	      addLuaSprite('flash', true);
	      setLuaSpriteScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',2)
	      setProperty('flash.scale.y',2)
	      setProperty('flash.alpha',0)
		setProperty('flash.alpha',1)
		doTweenAlpha('flTw','flash',0,v1,'linear')
	end



end
