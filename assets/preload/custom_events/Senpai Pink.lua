function onCreate()
makeLuaSprite("pink","kawaii",-140,-50)
addLuaSprite("pink",true)
setObjectCamera('pink','other')
setBlendMode('pink', 'add')
setProperty('pink.alpha', 0)
end

function onEvent(name, value1, value2)
   if name == 'Senpai Pink' and value1 == '1' then
   setProperty('pink.alpha', 1)
   elseif name == 'Senpai Pink' and value1 == '0' then
    setProperty('pink.alpha', 0)
    end
end
