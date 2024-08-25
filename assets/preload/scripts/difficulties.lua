function onCreate()
if not hideHud and getPropertyFromClass('ClientPrefs', 'HudDifficulty') then
if difficulty == 4 then

makeAnimatedLuaSprite('night', 'huddifficulties/hudnight', 40, 568)
addAnimationByPrefix('night', 'night', 'idle', 16, true)
setObjectCamera('night', 'hud')
setProperty('night.alpha', 0.8)
scaleObject('night', 0.65, 0.65)
addLuaSprite('night', false)


elseif difficulty == 3 then
makeLuaSprite('erect', 'huddifficulties/huderect', 40, 568)
setObjectCamera('erect', 'hud')
setProperty('erect.alpha', 0.8)
scaleObject('erect', 0.65, 0.65)
addLuaSprite('erect', false)
elseif difficulty == 2 then
makeLuaSprite('hard', 'huddifficulties/hudhard', 40, 570)
setObjectCamera('hard', 'hud')
setProperty('hard.alpha', 0.8)
scaleObject('hard', 0.65, 0.65)
addLuaSprite('hard', false)
elseif difficulty == 1 then
makeLuaSprite('normal', 'huddifficulties/hudnormal', 40, 570)
setObjectCamera('normal', 'hud')
setProperty('normal.alpha', 0.8)
scaleObject('normal', 0.65, 0.65)
addLuaSprite('normal', false)
elseif difficulty == 0 then
makeLuaSprite('easy', 'huddifficulties/hudeasy', 40, 570)
setObjectCamera('easy', 'hud')
setProperty('easy.alpha', 0.8)
scaleObject('easy', 0.65, 0.65)
addLuaSprite('easy', false)
end
end

if not hideHud and getPropertyFromClass('ClientPrefs', 'HudDifficulty') then
if difficulty == 4 and downscroll then
setProperty('night.y', getProperty('night.y') - 445)
elseif difficulty == 3 and downscroll then
setProperty('erect.y', getProperty('erect.y') - 440)
elseif difficulty == 2 and downscroll then
setProperty('hard.y', getProperty('hard.y') - 440)
elseif difficulty == 1 and downscroll then
setProperty('normal.y', getProperty('normal.y') - 440)
elseif difficulty == 0 and downscroll then
setProperty('easy.y', getProperty('easy.y') - 440)
end
end
end
