function onCreate()
precacheImage('cloud')
end

function onEvent(name, value1, value2)
   if name == 'bgchange' then
    makeLuaSprite(value2, value1, -1500,-1300);
    scaleObject('value1', -1, -1);
    addLuaSprite(value2, false);

    makeLuaSprite('clouds', 'clouds', -2000, 450);
    setScrollFactor('clouds', 0.9, 0.9);
    scaleObject('clouds', 2, 2);
    setProperty('clouds.velocity.x', 100);
    addLuaSprite('clouds', true)



    end
end

function onCreatePost()
	doTweenX('cloud_tween', 'clouds', 500, 60, 'linear')
end
