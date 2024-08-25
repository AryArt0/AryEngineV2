function onCreatePost()
if not hideHud and not middlescroll then
    makeLuaSprite('hbOverlay', 'hbOverlay', 0, 0)
    setObjectCamera('hbOverlay', 'hud')
    setObjectOrder('hbOverlay', getObjectOrder('healthBar') + 1)
    setProperty('hbOverlay.alpha', 0.7)
    addLuaSprite('hbOverlay')
    end


if middlescroll then
if getPropertyFromClass('ClientPrefs', 'MiddleUnderlay') then
    makeLuaSprite('lane4', nil, 400, -100)
    makeGraphic('lane4', 467, 900, '000000')
    setObjectCamera('lane4', 'hud')
    setProperty('lane4.alpha', 0.9)
    addLuaSprite('lane4', false)
    end

    for i = 0,3 do
      setPropertyFromGroup('strumLineNotes',i,'x',-330)
    end
  end
end

function onUpdatePost()
    setProperty('hbOverlay.x', getProperty('healthBar.x'))
    setProperty('hbOverlay.y', getProperty('healthBar.y'))
    setProperty('hbOverlay.alpha', math.max(getProperty('healthBar.alpha') - 0.3, math.min(0.7, getProperty('healthBar.alpha'))))
end

switchedCol = false
function onBeatHit()
    setTimeBarColors((switchedCol and '4343af' or '31b0d1'), '000000')
    switchedCol = not switchedCol
end

function onDestroy()
    setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': MarkedEngine")
end
