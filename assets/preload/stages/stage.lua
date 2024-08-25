
function onCreate()

if songName == 'Tutorial' then
playSound("intromusic/tutorialpause", 0.5, 'lol')
setPropertyFromClass('PauseSubState', 'songName', 'pausemusic/tutorialpause')
else
playSound("intromusic/week1pause", 0.5, 'lol')
setPropertyFromClass('PauseSubState', 'songName', 'pausemusic/week1pause')
end


setPropertyFromClass('PauseSubState', 'songName', 'pausemusic/week1pause')
makeAnimatedLuaSprite('audience_front', 'backgrounds/stage/audience_front', -800, -60);
      luaSpriteAddAnimationByPrefix('audience_front', 'audience_front', 'frontbop')
setLuaSpriteScrollFactor('audience_front', 0.9, 0.9);

    makeAnimatedLuaSprite('audience_mid', 'backgrounds/stage/audience_mid', -600, -150);
        	luaSpriteAddAnimationByPrefix('audience_mid', 'audience_mid', 'midbop')
		setLuaSpriteScrollFactor('audience_mid', 0.9, 0.9);
		scaleObject('audience_mid', 1, 1);

		makeAnimatedLuaSprite('audience_back', 'backgrounds/stage/audience_back', -600, -100);
        	luaSpriteAddAnimationByPrefix('audience_back', 'audience_back', 'backbop')
		setLuaSpriteScrollFactor('audience_back', 0.9, 0.9);
		scaleObject('audience_back', 1, 1);


if songName == 'Fresh' or songName == 'Fresh Erect' then
  addLuaSprite('audience_front', true);
	addLuaSprite('audience_mid', true);
elseif songName == 'Dad Battle' or songName == 'Dad Battle Erect' then
addLuaSprite('audience_front', true);
addLuaSprite('audience_mid', true);
addLuaSprite('audience_back', true)
end
end



function onStartCountdown()
soundFadeIn('lol', 2.5, 0.5, 0)
end

function onPause()
stopSound('lol')
end
