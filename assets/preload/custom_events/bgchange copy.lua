function onEvent(name, value1, value2)
   if name == 'bgchange copy' then
    makeLuaSprite(value2, value1, -200, -100);
    addLuaSprite(value2, false);



    end
end
