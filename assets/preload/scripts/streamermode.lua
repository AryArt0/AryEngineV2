dl = 0
dd = 0
du = 0
dr = 0

overlay = false

function onUpdate(elapsed)
if overlay then
    xoffset = {'707.5','757.5','807.5','857.5'}
    if not middlescroll then
    if keyPressed('left') then
        dl = dl + 1
        makeLuaSprite('datal' .. dl ,nil,note_1_Off-xoffset[1],719)
        addLuaSprite('datal' .. dl ,false)
        makeGraphic('datal'.. dl , 50, 25, 'c24b99')
        doTweenY('l' .. dl, 'datal' .. dl, -100, 1.35,'linear')
        setObjectCamera('datal'..dl,'other')
    end
    if keyPressed('down') then
        dd = dd + 1
        makeLuaSprite('datad' .. dd ,nil,note_2_Off-xoffset[2],719)
        addLuaSprite('datad' .. dd ,false)
        makeGraphic('datad'.. dd , 50, 25, '00ffff')
        doTweenY('d' .. dd, 'datad' .. dd,-100, 1.35,'linear')
        setObjectCamera('datad'..dd,'other')
    end
    if keyPressed('up') then
        du = du + 1
        makeLuaSprite('datau' .. du ,nil,note_3_Off-xoffset[3],719)
        addLuaSprite('datau'.. du ,false)
        makeGraphic('datau'.. du , 50, 25, '12fa05')
        doTweenY('u' .. du, 'datau' .. du,-100, 1.35,'linear')
        setObjectCamera('datau'..du,'other')
    end
    if keyPressed('right') then
        dr = dr + 1
        makeLuaSprite('datar' .. dr ,nil,note_4_Off-xoffset[4],719)
        addLuaSprite('datar' .. dr ,false)
        makeGraphic('datar'.. dr , 50, 25, 'f9393f')
        doTweenY('r' .. dr, 'datar' .. dr,-100, 1.35,'linear')
        setObjectCamera('datar'..dr,'other')
    end
    end

    if middlescroll then
    if keyPressed('left') then
        dl = dl + 1
        makeLuaSprite('datal' .. dl ,nil, 25, 719)
        addLuaSprite('datal' .. dl ,false)
        makeGraphic('datal'.. dl , 50, 25, 'c24b99')
        doTweenY('l' .. dl, 'datal' .. dl, -100, 1.35,'linear')
        setObjectCamera('datal'..dl,'other')
    end
    if keyPressed('down') then
        dd = dd + 1
        makeLuaSprite('datad' .. dd ,nil, 85,719)
        addLuaSprite('datad' .. dd ,false)
        makeGraphic('datad'.. dd , 50, 25, '00ffff')
        doTweenY('d' .. dd, 'datad' .. dd,-100, 1.35,'linear')
        setObjectCamera('datad'..dd,'other')
    end
    if keyPressed('up') then
        du = du + 1
        makeLuaSprite('datau' .. du ,nil, 145,719)
        addLuaSprite('datau'.. du ,false)
        makeGraphic('datau'.. du , 50, 25, '12fa05')
        doTweenY('u' .. du, 'datau' .. du,-100, 1.35,'linear')
        setObjectCamera('datau'..du,'other')
    end
    if keyPressed('right') then
        dr = dr + 1
        makeLuaSprite('datar' .. dr ,nil, 205,719)
        addLuaSprite('datar' .. dr ,false)
        makeGraphic('datar'.. dr , 50, 25, 'f9393f')
        doTweenY('r' .. dr, 'datar' .. dr,-100, 1.35,'linear')
        setObjectCamera('datar'..dr,'other')
    end
    end
    setProperty('lane.alpha', 0.7);
    setProperty('grad.alpha', 1);
    setTextColor('lanetxt', 'A6FF87')
    setTextColor('lanetxt2', '5c5c5c')
    doTweenAlpha('txtA', 'lanetxt', 1, 0.7, 'quadout');
    doTweenY('txtmove', 'lanetxt', 20 , 0.5, 'quadout')

    doTweenAlpha('txtB', 'lanetxt2', 1, 0.7, 'quadout');
    doTweenY('txtmove2', 'lanetxt2', 45 , 0.5, 'quadout')
    runTimer('beta', 2)
end

  if overlay == not overlay and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.FOUR') then
      overlay = overlay
    end

  if overlay == overlay and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.FOUR') then
      overlay = not (overlay)
      doTweenAlpha('lanegone', 'lane', 0, 3, 'quadout');
      doTweenAlpha('gradgone', 'grad', 0, 3.5, 'quadout');
  end

  if not overlay then
  doTweenAlpha('txxtB', 'lanetxt', 0, 0.7, 'quadout')
  doTweenY('txtmovee', 'lanetxt', -30, 0.5, 'quadout')

  doTweenAlpha('txxtB2', 'lanetxt2', 0, 0.7, 'quadout')
  doTweenY('txtmovee2', 'lanetxt2', -30, 0.5, 'quadout')

  setTextColor('lanetxt', 'FF7C7C')
end


 if (datal.y > 10)  then
    removeLuaSprite('datal' .. dl, true)
    end

    if (datad.y > 10)  then
       removeLuaSprite('datad' .. dd, true)
      end
      if (datau.y > 10)  then
         removeLuaSprite('datau' .. du, true)
         end

         if (datar.y > 10)  then
            removeLuaSprite('datar' .. dr, true)
            end
end

function onCreatePost()
    note_1_Off = getPropertyFromGroup('playerStrums', 0, 'x')
    note_2_Off = getPropertyFromGroup('playerStrums', 1, 'x')
    note_3_Off = getPropertyFromGroup('playerStrums', 2, 'x')
    note_4_Off = getPropertyFromGroup('playerStrums', 3, 'x')

    makeLuaSprite('lane',nil, 0, 0)
    addLuaSprite('lane', false)
    makeGraphic('lane', 295, 800, '000000')
    setObjectCamera('lane', 'other')
    setProperty('lane.alpha', 0)

    makeLuaSprite('grad', 'grad', 0, 0)
    scaleObject('grad', 0.46, 0.8)
    setObjectCamera('grad','other')
    setObjectOrder('grad', getObjectOrder('lane') + 4)
    setProperty('grad.alpha', 0)
    addLuaSprite('grad', false)

    makeLuaText('lanetxt', '[STREAMER MODE]', 0, 45, -25)
    setTextSize('lanetxt', 20, 20)
    setTextFont('lanetxt', 'vcr2.ttf')
    addLuaText('lanetxt', false)
    setObjectCamera('lanetxt','other')
    setObjectOrder('lanetxt', getObjectOrder('grad') + 1)
    setProperty('lanetxt.alpha', 0)

    makeLuaText('lanetxt2', '[BETA: May drop FPS]', 0, 55, 5)
    setTextSize('lanetxt2', 15, 15)
    setTextFont('lanetxt2', 'vcr2.ttf')
    addLuaText('lanetxt2', false)
    setObjectCamera('lanetxt2','other')
    setObjectOrder('lanetxt2', getObjectOrder('grad') + 1)
    setProperty('lanetxt2.alpha', 0)
end

function onTweenCompleted(tag)
 if tag == 'txxtB' then
    setProperty('lanetxt.alpha', 0)
   end
   if tag == 'l' then
  removeLuaSprite('datal' ..dl, true)
  end
   if tag == 'd' then
   removeLuaSprite('datad' ..dd, true)
   end
   if tag == 'u' then
   removeLuaSprite('datau' ..du, true)
   end
   if tag == 'r' then
   removeLuaSprite('datar' ..dr, true)
   end
 end

 function onTimerCompleted(tag)
 if tag == 'beta' then
 doTweenAlpha('betagone', 'lanetxt2', 0, 0.7, 'linear')
 end
 end
