function onCreate()
precacheImage('Vignette')
precacheImage('BlackFlash')
makeLuaSprite('vig', 'Vignette', 205, 300);
scaleObject('vig', 1.8, 1.6)
addLuaSprite('vig', true);
setProperty('vig.alpha', 0)

makeLuaSprite('vig2', 'BlackFlash', -1200, -100);
scaleObject('vig2', 2.5, 2.5)
addLuaSprite('vig2', true);
setProperty('vig2.alpha', 0)

makeLuaSprite('vig3', 'BlackFlash', -1200, -100);
scaleObject('vig3', 2.5, 2.5)
addLuaSprite('vig3', true);
setProperty('vig3.alpha', 0)
end

function onEvent(name, value1, value2)
   if name == 'Lit Up Vignette' then
   if value1 == '1' then
    setProperty('vig.alpha', 1)
    setProperty('vig2.alpha', 1)
    doTweenAlpha('vig2in', 'vig2', 0, 2, linear)
    end
    if value1 == '0' then
    setProperty('vig.alpha', 0)
    setProperty('vig2.alpha', 1)
    setProperty('vig3.alpha', 0)
    doTweenAlpha('vig2in', 'vig2', 0, 0.5, linear)
    end
    if value2 == '1' then
    setProperty('vig2.alpha', 1)
    doTweenAlpha('vig2in', 'vig2', 0, 0.35, linear)
    end
    if value2 == '2' then
    setProperty('vig3.alpha', 1)
    end
  end
end
