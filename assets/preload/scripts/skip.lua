function onCreate()
    didskip = false;
    stop = false
    time = 9900000
    --in milliseconds
    if isStoryMode and downscroll then
    makeLuaText('skipText', '[CTRL] to Skip Song', 300, 500, -10)
    setTextFont('skipText', 'vcr2.ttf')
    setTextSize('skipText', 17);
    addLuaText('skipText')
   elseif isStoryMode and not downscroll then
    makeLuaText('skipText', '[CTRL] to Skip Song', 300, 500, 700)
    setTextSize('skipText', 17);
    setTextFont('skipText', 'vcr2.ttf')
    addLuaText('skipText')
end
end


function onUpdatePost()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.CONTROL') and not getProperty('startingSong') and not didskip and isStoryMode then
            didskip = true
            setProperty('cpuControlled', true)
            setProperty('skipText.visible', false)
            setPropertyFromClass('Conductor', 'songPosition', time)
            setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
            setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
            makeLuaSprite('BlackFlash', 'BlackFlash', -700, -100);
        		scaleObject('BlackFlash', 58, 62);
            setObjectCamera('BlackFlash', 'other');
        		addLuaSprite('BlackFlash', true)
        		setProperty('BlackFlash.visible', true);
            makeLuaText('skipText2', 'SKIPPED SONG...', 300, 1030, 690)
            setObjectCamera('skipText2', 'other');
            setTextSize('skipText2', 20);
            setTextFont('skipText2', 'vcr2.ttf')
            addLuaText('skipText2')
    elseif getPropertyFromClass('Conductor', 'songPosition') >= time and not didskip then
        didskip = true
        setProperty('skipText.visible', false)
    end
  end

function goodNoteHit(id, direction, noteType, isSustainNote)
setProperty('skipText.visible', false)
didskip = true
end
