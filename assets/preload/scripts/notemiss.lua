function goodNoteHit()
   combo = getProperty('combo')
    ratingP = getProperty('accuracy')
end

function onUpdatePost(elapsed)
		if flinch == true then
			setProperty('iconP1.animation.curAnim.curFrame', 1)
		end
	end

function noteMiss(id, direction, noteType, isSustainNote)
characterPlayAnim('gf', 'sad', true);
setProperty('gf.specialAnim', true);
flinch = true
runTimer('flinch', 0.5)

if hideHud then
if getProperty('health') < 0.1 then
setProperty('health', 0.01)
end
end

if isSustainNote then
misses = getProperty('songMisses') - 1
setMisses(misses)

setProperty('combo', combo)
end

if not hideHud then
            makeLuaSprite("left_l","LEFTL",-140, -50)
            addLuaSprite("left_l",true)
            setObjectCamera('left_l','other')
            setBlendMode("left_l","add")
            scaleObject('left_l', 1, 1)
            doTweenColor('purple_hi', 'left_l', 'FFFFFFFF', 0.1, 'quartIn')
            runTimer("purple",0.1)
            end

            if hideHud then
            makeLuaSprite('ouch2p', 'p1hurt', -140,-50)
            addLuaSprite("ouch2p", true)
            setObjectCamera('ouch2p','other')
            setBlendMode("ouch2p","add")
            doTweenColor('ouch22', 'ouch2p', 'FFFFFFFF', 0.1, 'quartIn')
            runTimer("ouchp1",0.1)
            end

            if direction == 0 then
            playSound("missnote2", 0.5)
            elseif direction == 1 then
            playSound("missnote1", 0.5)
            elseif direction == 2 then
            playSound("missnote3", 0.5)
            elseif direction == 3 then
            playSound("missnote1", 0.5)


        end

        cameraShake('camGame', 0.001, 0.1);
        cameraShake('camHud', 0.003, 0.1);
      end


      function onUpdateScore()
       ratingP = getProperty('accuracy')
       end



      function noteMissPress()
      characterPlayAnim('gf', 'sad', true);
      setProperty('gf.specialAnim', true);
      flinch = true
    	runTimer('flinch', 0.5)

      if hideHud then
      if getProperty('health') < 0.1 then
      setProperty('health', 0.01)
      end
      end

      if not hideHud then
      makeLuaSprite("mph","LEFTL",-140,-100)
      addLuaSprite("mph",true)
      setObjectCamera('mph','other')
      setBlendMode("mph","add")
      scaleObject('mph', 1, 1)
      runTimer("mph1",0.1)

      health = getProperty('health')
      setProperty('health', health - 0.025)
      end

      misses = getProperty('songMisses') - 1
      setMisses(misses)

      cameraShake('camGame', 0.001, 0.1);
      cameraShake('camHud', 0.003, 0.1);

      setProperty('combo', combo)
      setAccuracy(ratingP)
      end




function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'purple' then
        doTweenAlpha('purple_l', 'left_l',0, 1.25, 'linear');
    end
    if tag == 'mph1' then
        doTweenAlpha('mph12', 'mph', 0, 1.25, 'linear');
    end
    if tag == 'ouchp1' then
        doTweenAlpha('ouchlol', 'ouch2p', 0, 1.25, 'linear');
    end
    if tag == 'flinch' then
  		flinch = false
  	end
  end


function onTweenCompleted(tag)
    if tag == 'purple_l' then
        removeLuaSprite('left_l', true);
    end
    if tag == 'mph1' then
        removeLuaSprite('mph', true);
    end
    if tag == 'ouchlol' then
        removeLuaSprite('ouch2p', true);
    end
end
