function onCreatePost()
setPropertyFromClass('lime.app.Application', 'current.window.title', "FNF: MarkedEngine")
setProperty('botplayTxt.x', 720)
setProperty('botplayTxt.y', 160)
end

function onStartCountdown()
if botPlay then
debugPrint('Botplay')
end

if hideHud then
debugPrint('Multiplayer')
end

if songName == 'loading' then
debugPrint("")
else
debugPrint(""..songName.." - "..difficultyName.."")
end
end



  function onUpdate()
     mousevisible = getPropertyFromClass('flixel.FlxG', 'mouse.visible')
      if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SLASH') and mousevisible then
  		setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
      debugPrint('Mouse Hidden')
      playSound('tick0', 1)
    elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SLASH') and not mousevisible then
    setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);
    debugPrint('Mouse Visible')
    playSound('tick1', 1)
    end


if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.FIVE') and not botPlay then
setProperty('cpuControlled', true);
setProperty('botplayTxt.visible', true);
setProperty('botplayTxt.x', 720)
setProperty('botplayTxt.y', 160)
playSound('tick1', 1)
debugPrint('Botplay enabled')
elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.FIVE') and botPlay then
setProperty('cpuControlled', false);
setProperty('botplayTxt.visible', false);
debugPrint('Botplay disabled')
playSound('tick0', 1)
end
end
