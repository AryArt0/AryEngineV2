function onCreatePost()
precacheSound('winner');

if songName == 'Blazin' then
cutscenehere = true
end

SeenRatingScreen= false
end


function onStepHit()
if not cutscenehere then
if getPropertyFromClass('flixel.FlxG', 'sound.music.time') >= songLength -140 then
setPropertyFromClass('flixel.FlxG', 'sound.music.volume',0)
setProperty('vocals.volume',0)
playSound('winner', 1)
makeLuaText('SPACE','LOADING...', getPropertyFromClass('flixel.FlxG', 'width'),
getProperty('scoreTxt.x'), getProperty('scoreTxt.y'));
setTextSize('SPACE', 35);
setTextColor('SPACE','FFFFFF')
setTextAlignment('SPACE', 'center');
setObjectCamera('SPACE', 'other');

if downscroll then
    setProperty('SPACE.y', 670)
  end

addLuaText('SPACE')
doTweenAlpha('hud', 'camHUD', 0, 0.5, 'linear')
Detener=true
end
end
end

function onUpdate()
if not cutscenehere then
if Detener==true then
setPropertyFromClass('Conductor', 'songPosition',Stored)
setPropertyFromClass('flixel.FlxG', 'sound.music.time',Stored)
setProperty('vocals.time',Stored)
if songName == 'Bopeebo-alt' or 'South-alt' or 'Spookeez-alt' and Detener==true then
SeenRatingScreen=true
endSong()
end
end

if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') and Detener==true then
playSound('winner', 1)
Detener=false
SeenRatingScreen=true
endSong()
end
end
end
