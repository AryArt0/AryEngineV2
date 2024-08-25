
function onCreatePost()
if not hideHud and getPropertyFromClass('ClientPrefs', 'keys') then
if downscroll and getPropertyFromClass('ClientPrefs', 'HudDifficulty') then
 if getPropertyFromClass('ClientPrefs', 'HudDifficulty') and difficulty == 0 or difficulty == 1 or difficulty == 2 or difficulty == 3 or difficulty == 4 then
    makeLuaSprite('upButton', nil, 90, 30)
    makeGraphic('upButton', 44, 44, 'FFFFFF')
    end
  end

   if downscroll and not getPropertyFromClass('ClientPrefs', 'HudDifficulty') then
    makeLuaSprite('upButton', nil, 90, 50)
    makeGraphic('upButton', 44, 44, 'FFFFFF')
    end


  if not downscroll and getPropertyFromClass('ClientPrefs', 'HudDifficulty') then
    if difficulty == 0 or difficulty == 1 or difficulty == 2 or difficulty == 3 or difficulty == 4 then
    makeLuaSprite('upButton', nil, 87, 473)
    makeGraphic('upButton', 44, 44, 'FFFFFF')
    end
  end

    if not downscroll and not getPropertyFromClass('ClientPrefs', 'HudDifficulty') then
    makeLuaSprite('upButton', nil, 90, 515)
    makeGraphic('upButton', 44, 44, 'FFFFFF')
    end

    addLuaSprite('upButton', true)
    setObjectCamera('upButton', 'hud')
	setProperty('upButton.alpha', 0.3)

  makeLuaSprite('downButton', nil, getProperty('upButton.x'), getProperty('upButton.y') + 47)
  makeGraphic('downButton', 44, 44, 'FFFFFF')

  addLuaSprite('downButton', true)
  setObjectCamera('downButton', 'hud')
setProperty('downButton.alpha', 0.3)

  makeLuaSprite('leftButton', nil, getProperty('downButton.x') - 47, getProperty('downButton.y'))
  makeGraphic('leftButton', 44, 44, 'FFFFFF')

  addLuaSprite('leftButton', true)
  setObjectCamera('leftButton', 'hud')
setProperty('leftButton.alpha', 0.3)

  makeLuaSprite('rightButton', nil, getProperty('downButton.x') + 47, getProperty('downButton.y'))
  makeGraphic('rightButton', 44, 44, 'FFFFFF')

  addLuaSprite('rightButton', true)
  setObjectCamera('rightButton', 'hud')
setProperty('rightButton.alpha', 0.3)

  makeLuaSprite('upText', 'arrow', getProperty('upButton.x') + 7.3, getProperty('upButton.y') + 7.1)
  setObjectOrder('upText', getObjectOrder('upButton') + 1)
  setObjectCamera('upText', 'hud')
  scaleObject('upText', 0.19, 0.19)
  addLuaSprite('upText')

  makeLuaSprite('downText', 'arrow', getProperty('downButton.x') + 7.3, getProperty('downButton.y') + 7.1)
  setObjectOrder('downText', getObjectOrder('downButton') + 1)
  setTextAlignment('downText', 'center')
  setObjectCamera('downText', 'hud')
  setProperty('downText.angle', 180)
  scaleObject('downText', 0.185, 0.185)
  addLuaSprite('downText')

  makeLuaSprite('leftText', 'arrow', getProperty('leftButton.x') + 7.3, getProperty('leftButton.y') + 7.1)
  setObjectOrder('leftText', getObjectOrder('leftButton') + 1)
  setTextAlignment('leftText', 'center')
  setObjectCamera('leftText', 'hud')
  scaleObject('leftText', 0.18, 0.18)
  setProperty('leftText.angle', -90)
  addLuaSprite('leftText')

  makeLuaSprite('rightText', 'arrow', getProperty('rightButton.x') + 7.5, getProperty('rightButton.y') + 7.2)
  setObjectOrder('rightText', getObjectOrder('rightButton') + 1)
  setTextAlignment('rightText', 'center')
  setObjectCamera('rightText', 'hud')
  scaleObject('rightText', 0.18, 0.18)
  setProperty('rightText.angle', 90)
  addLuaSprite('rightText')
end
end

function onUpdate(elapsed)
    --this bit might be poorly done idk
    if keyPressed('up') then
        setProperty('upButton.alpha', 1)
        cancelTween('upFade')
    else
        doTweenAlpha('upFade', 'upButton', 0.3, 0.15, 'linear')
    end

    if keyPressed('down') then
        setProperty('downButton.alpha', 1)
        cancelTween('downFade')
    else
        doTweenAlpha('downFade', 'downButton', 0.3, 0.15, 'linear')
        setTextColor('downText', 'FFFFFF')
    end

    if keyPressed('left') then
        setProperty('leftButton.alpha', 1)
        cancelTween('leftFade')
        setTextColor('leftText', '7F7F7F')
    else
        doTweenAlpha('leftFade', 'leftButton', 0.3, 0.15, 'linear')
        setTextColor('leftText', 'FFFFFF')
    end

    if keyPressed('right') then
        setProperty('rightButton.alpha', 1)
        cancelTween('rightFade')
        setTextColor('rightText', '7F7F7F')
    else
        doTweenAlpha('rightFade', 'rightButton', 0.3, 0.15, 'linear')
        setTextColor('rightText', 'FFFFFF')
    end
end
