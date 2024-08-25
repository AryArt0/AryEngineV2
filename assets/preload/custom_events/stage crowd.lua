function onCreate()

makeAnimatedLuaSprite('audience_front', 'backgrounds/stage/audience_front', -800, -60);
      luaSpriteAddAnimationByPrefix('audience_front', 'audience_front', 'frontbop')
setLuaSpriteScrollFactor('audience_front', 0.9, 0.9);
setProperty('audience_front.alpha', 0)
addLuaSprite('audience_front', true);

    makeAnimatedLuaSprite('audience_mid', 'backgrounds/stage/audience_mid', -600, -150);
        	luaSpriteAddAnimationByPrefix('audience_mid', 'audience_mid', 'midbop')
		setLuaSpriteScrollFactor('audience_mid', 0.9, 0.9);
		scaleObject('audience_mid', 1, 1);
    setProperty('audience_mid.alpha', 0)
    addLuaSprite('audience_mid', true);

		makeAnimatedLuaSprite('audience_back', 'backgrounds/stage/audience_back', -600, -100);
        	luaSpriteAddAnimationByPrefix('audience_back', 'audience_back', 'backbop')
		setLuaSpriteScrollFactor('audience_back', 0.9, 0.9);
		scaleObject('audience_back', 1, 1);
    setProperty('audience_back.alpha', 0)
    addLuaSprite('audience_back', true)
    end


function onEvent(name, value1, value2)
   if name == 'stage crowd' and value1 == '1' then
   setProperty('audience_front.alpha', 1)
   elseif name == 'stage crowd' and value1 == '2' then
  setProperty('audience_front.alpha', 1)
  setProperty('audience_mid.alpha', 1)
      elseif name == 'stage crowd' and value1 == '3' then
    setProperty('audience_front.alpha', 1)
    setProperty('audience_mid.alpha', 1)
    setProperty('audience_back.alpha', 1)
    end

close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
