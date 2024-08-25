local heyAnimationOnSpace = true --Change this to true if you want the hey animation to play when pressing the space key.
local AltAnims = {'singLEFT-alt', 'singDOWN-alt', 'singUP-alt', 'singRIGHT-alt', 'idle-alt', 'hey-alt'} --The names for the alt animations.
local NormAnims = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'} --The names for the normal animations.

function goodNoteHit(i, d, t, s)
    if getProperty('combo') >= 199 then --You can change the combo number that activates the alt animations here.
        playAnim('boyfriend', AltAnims[d + 1])
    elseif getProperty('combo') < 175 then --Set this the same as the combo number above!
        playAnim('boyfriend', NormAnims[d + 1])
    end
end

function onUpdatePost()
    if getProperty('combo') >= 199 then --You can also indivitually change the combo number that activates the alt idle and hey aniamtion!
        if getProperty('boyfriend.animation.name') == 'idle' then
            playAnim('boyfriend', AltAnims[5])
        elseif getProperty('boyfriend.animation.name') == 'hey' then
            playAnim('boyfriend', AltAnims[6])
            setProperty('boyfriend.specialAnim', true)
        end
    end
  end

  function onUpdate()
   	if keyJustPressed('space') then
  		characterPlayAnim('boyfriend', 'hey', true);
      characterPlayAnim('gf', 'cheer', true);
  		setProperty('boyfriend.specialAnim', true);
      setProperty('gf.specialAnim', true);
      if getProperty('boyfriend.curCharacter') == 'bf' or getProperty('boyfriend.curCharacter') == 'bf-christmas' or getProperty('boyfriend.curCharacter') == 'bf2' or getProperty('boyfriend.curCharacter') == 'bf-pixel' then
  		playSound('hey', 0.8); --plays the "Yeah!" SFX, put this "--" before 'playsound' to disable, the numbers are the volume, max volume is 1.0.
      else
      playSound('hey1', 1)
      end
      end

      --secondary taunt
      if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') and getProperty('boyfriend.curCharacter') == 'bf' then
  		characterPlayAnim('boyfriend', 'Laugh', true);
  		setProperty('boyfriend.specialAnim', true);
  		playSound('BF Laugh', 0.8); --plays the Laugh SFX, put this "--" before 'playsound' to disable, the numbers are the volume, max volume is 1.0.
      end
  end
