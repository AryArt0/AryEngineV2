local tagT = {}
local pixel = false
misses = 0
function onCreatePost() luaDebugMode = true precacheImage('NOTE_assets') pixel = getProperty('isPixelStage') end
function goodNoteHit(id, dir, type, sus)
 if not sus then
 if getProperty('combo') >= 200 and getPropertyFromClass('ClientPrefs', 'comboGlow') then
   tag = makeStrumAsset(dir, function (t, d, x, y, s)
    tagT[d] = t
    scaleObject(t, 0.55, 0.55)
    updateHitbox(t)
    setProperty(t..'.x', getPropertyFromGroup('playerStrums', d, 'x') - 56)
    setProperty(t..'.y', getPropertyFromGroup('playerStrums', d, 'y') - 59)
    setProperty(t..'.offset.x',  45)
    setProperty(t..'.offset.y',  43)
    setProperty(t..'.alpha',  0.45)
    setBlendMode(t, 'ADD')
    setObjectCamera(t, 'hud')
    playAnim(t, 'confirm')
    doTweenX(t..'aaa', t..'.scale', 0.86, 0.5, 'quadOut')
    doTweenY(t..'bbb', t..'.scale', 0.86, 0.5, 'quadOut')
    runTimer(t..'b', 0.15)
   end)
 end
 end
end
function onTimerCompleted(t) for i,v in pairs(tagT) do if t == v..'b' then doTweenAlpha('strum'..v..'a', v, 0, 0.6, 'quadOut') removeLuaSprite(v, false) addLuaSprite(v, true) end end end
function makeStrumAsset(dir, custom, x, y, tag)
 local animTable = { [0] = 'Left', [1] = 'Down', [2] = 'Up', [3] = 'Right'}
 local colorTable = { [0] = 'Purple', [1] = 'Blue', [2] = 'Green', [3] = 'Red'}
 local tag = tag or 'strum'..animTable[dir]
 local skin = getPropertyFromGroup('playerStrums', dir, 'texture') or 'NOTE_assets'
 local x = x or getPropertyFromGroup('playerStrums', dir, 'x')
 local y = y or getPropertyFromGroup('playerStrums', dir, 'y')
 local anims = {
    {name = 'static', prefix = 'arrow'..animTable[dir]:upper()},
    {name = 'pressed', prefix = animTable[dir]:lower()..' press'},
    {name = 'confirm', prefix = animTable[dir]:lower()..' confirm'},
    {name = 'note', prefix = colorTable[dir]:lower()},
 }
 makeAnimatedLuaSprite(tag, skin, x, y)
 for i = 1,#anims do addAnimationByPrefix(tag, anims[i]['name'], anims[i]['prefix'], 24, false)end
 setObjectOrder(tag, getObjectOrder(tag) or getObjectOrder('boyfriendGroup'))
 addLuaSprite(tag, false)
 if custom then custom(tag, dir, x, y, skin) end
 return tag
end

-- Made by Daniel (skry#4271)
