function onCreate()
precacheImage('roseslockin')
end

function onEvent(name, value1, value2)
   if name == 'Roses Focus' and value2 == '1' then
   removeLuaSprite('roseslockin')
   elseif name == 'Roses Focus' then
    makeLuaSprite('roseslockin', 'roseslockin', -300, -100);
    setProperty('roseslockin.alpha', 0)
    addLuaSprite('roseslockin', false);

    doTweenAlpha('roseslockinin', 'roseslockin', 1, value1, 'linear')

    end
end
