
--options

local psychRating = false --whether or not the extra psych engine rating will appear, turn this off for accuracy i guess

function onCreatePost()
 setProperty('camHUD.alpha', 0)

    setProperty('scoreTxt.visible', false)
    setProperty('timeBarBG.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('timeTxt.visible', false)

if not hideHud then

    makeLuaText('plus', '+', 0, getProperty('healthBarBG.x') - getProperty('healthBarBG.width') / 2 - 25, getProperty('healthBarBG.y') + 23)
    setTextSize('plus', 30)
    setProperty('plus.alpha', 0)
    setTextFont('plus', 'vcr2.ttf')
    setProperty('plus.alpha', 0)
    setTextBorder('plus', 2.85, '000000')
    setObjectOrder('plus', getObjectOrder('healthbar') + 1)
    addLuaText('plus')
    setObjectCamera('plus', 'hud')

    makeLuaText('newScoreTxt', '', 0, getProperty('healthBarBG.x') - getProperty('healthBarBG.width') / 2, getProperty('healthBarBG.y') + 26)
    setTextSize('newScoreTxt', 20)
    setTextFont('newScoreTxt', 'vcr2.ttf')
    setTextBorder('newScoreTxt', 2.75, '000000')
    setObjectOrder('newScoreTxt', getObjectOrder('healthbar') + 1)
    addLuaText('newScoreTxt')
    setObjectCamera('newScoreTxt', 'hud')


    makeLuaText('newScoreTxtf', '', 0, getProperty('healthBarBG.x') - getProperty('healthBarBG.width') / 2, getProperty('healthBarBG.y') + 26)
    setTextSize('newScoreTxtf', 24)
    setTextFont('newScoreTxtf', 'vcr2.ttf')
    setTextBorder('newScoreTxtf', 2.75, '000000')
    setObjectOrder('newScoreTxtf', getObjectOrder('newScoreTxt') + 1)
    addLuaText('newScoreTxtf')
    setObjectCamera('newScoreTxtf', 'hud')


    makeLuaText('missTxt', '', 0, getProperty('healthBarBG.x') - getProperty('healthBarBG.width') / 2, getProperty('newScoreTxt.y') - 26)
    setTextSize('missTxt', 20)
    setTextFont('missTxt', 'vcr2.ttf')
    setTextBorder('missTxt', 2.75, '000000')
    setObjectOrder('missTxt', getObjectOrder('healthbar') + 1)
    addLuaText('missTxt')
    setObjectCamera('missTxt', 'hud')

    makeLuaText('accuracyTxt', '', 0, getProperty('healthBarBG.x') - getProperty('healthBarBG.width') / 2, getProperty('missTxt.y') - 26)
    setTextSize('accuracyTxt', 20)
    setTextFont('accuracyTxt', 'vcr2.ttf')
    setTextBorder('accuracyTxt', 2.75, '000000')
    setObjectOrder('accuracyTxt', getObjectOrder('healthbar') + 1)
    addLuaText('accuracyTxt')
    setObjectCamera('accuracyTxt', 'hud')

    if psychRating then
        makeLuaText('ratingTxt', '', 0, getProperty('healthBarBG.x') - getProperty('healthBarBG.width') / 2, getProperty('accuracyTxt.y') - 26)
        setTextSize('ratingTxt', 20)
        setTextBorder('ratingTxt', 2.75, '000000')
        addLuaText('ratingTxt')
        setObjectCamera('ratingTxt', 'hud')
    end
end

    --downscroll positions
    if downscroll then
     if difficulty == 0 or difficulty == 1 or difficulty == 2 or difficulty == 3 then
        setProperty('newScoreTxt.y', getProperty('healthBarBG.y') + 95)
        setProperty('missTxt.y', getProperty('newScoreTxt.y') + 30)
        setProperty('accuracyTxt.y', getProperty('missTxt.y') + 25)
        setProperty('ratingTxt.y', getProperty('accuracyTxt.y') + 26)
        elseif downscroll then
        setProperty('newScoreTxt.y', getProperty('healthBarBG.y') + 90)
        setProperty('missTxt.y', getProperty('newScoreTxt.y') + 26)
        setProperty('accuracyTxt.y', getProperty('missTxt.y') + 26)
        setProperty('ratingTxt.y', getProperty('accuracyTxt.y') + 26)
        end
        end
        end

function onUpdate()
    if hits < 1 and misses < 1 then
        setTextString('newScoreTxt', '000000')
        setProperty('newScoreTxt.alpha', 0.7)
        setTextSize('newScoreTxt', 25)
        setTextString('missTxt', 'Misses: 0')
        setTextString('accuracyTxt', 'Accuracy: 0%')
        setTextString('ratingTxt', 'Rating: ?')

        if psychRating then
            setTextString('ratingTxt', 'Rating: ?')
        end
    else
        setTextString('newScoreTxt', '' .. score)
        setTextString('newScoreTxtf', '' .. score)
        setTextSize('newScoreTxt', 25)
        setProperty('newScoreTxt.alpha', 1)

        setTextString('missTxt', 'Misses: ' .. misses)
        setTextString('accuracyTxt', 'Accuracy: ' .. round(rating * 100, 2) .. '%')
        setTextString('ratingTxt', 'Rating: ' .. ratingName .. ' - ' .. ratingFC)

        if psychRating then
            setTextString('ratingTxt', 'Rating: ' .. ratingName .. ' - ' .. ratingFC)
        end
    end
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end

--icons

function onBeatHit()
    setProperty('iconP1.scale.x', 1.1)
    setProperty('iconP1.scale.y', 1.1)
    setProperty('iconP2.scale.x', 1.1)
    setProperty('iconP2.scale.y', 1.1)
end

function onStartCountdown()
if not hideHud then
    doTweenAlpha('hudFadeIn', 'camHUD', 1, 0.5, 'linear');
end
end


function goodNoteHit(id, noteData, noteType, isSustainNote)
if not hideHud and not isSustainNote and not botplay then
        cancelTween('plusTween')
        setProperty('plus.alpha', 1)
        setTextString('plus', '+')

if not middlescroll then
        if not downscroll then
        setProperty('plus.x', getProperty('healthBarBG.x') - getProperty('healthBarBG.width') / 2 - 25)
        setProperty('plus.y', getProperty('healthBarBG.y') + 23)
        elseif downscroll then
        setProperty('plus.x', getProperty('healthBarBG.x') - getProperty('healthBarBG.width') / 2 - 25)
        setProperty('plus.y', getProperty('healthBarBG.y') + 90)
        end
        end

        if middlescroll then
                if not downscroll then
                setProperty('plus.x', 15)
                setProperty('plus.y', 663)
                elseif downscroll then
                setProperty('plus.x', 15)
                setProperty('plus.y', 170)
                end
              end



        doTweenAlpha('plusAlpha', 'plus', 0, 0.3, 'quadIn')


        if not isSustainNote then
        setProperty("newScoreTxtf.scale.x", 1.25)
        setProperty("newScoreTxtf.scale.y", 1.25)
        if not downscroll then
        setProperty("newScoreTxtf.x", 40)
        setProperty("newScoreTxtf.y", 667)
        elseif downscroll then
        setProperty("newScoreTxtf.x", 40)
        setProperty("newScoreTxtf.y", 175)
        end

        setProperty('newScoreTxtf.alpha', 0.4)
        doTweenAlpha("scoreassh", "newScoreTxtf", 0, 0.25, "linear")
        end



    end
end


function noteMiss(id, direction, noteType, isSustainNote)
setProperty('plus.alpha', 1)
setTextString('plus', '-')
if not middlescroll then
if not downscroll then
setProperty('plus.x', getProperty('healthBarBG.x') - getProperty('healthBarBG.width') / 2 - 23)
setProperty('plus.y', getProperty('healthBarBG.y') + 18)
elseif downscroll then
setProperty('plus.x', getProperty('healthBarBG.x') - getProperty('healthBarBG.width') / 2 - 23)
setProperty('plus.y', getProperty('healthBarBG.y') + 88)
end
end

if middlescroll then
if not downscroll then
setProperty('plus.x', 20)
setProperty('plus.y', 658)
elseif downscroll then
setProperty('plus.x', 20)
setProperty('plus.y', 168)
end
end

doTweenX('plusTween', 'plus', -0.25, 1, 'circOut')
doTweenAlpha('plusAlpha', 'plus', 0, 0.5, 'quadIn')
end

      function noteMissPress()
      setProperty('plus.alpha', 1)
      setTextString('plus', '-')

      if not middlescroll then
      if not downscroll then
      setProperty('plus.x', getProperty('healthBarBG.x') - getProperty('healthBarBG.width') / 2 - 23)
      setProperty('plus.y', getProperty('healthBarBG.y') + 18)
      elseif downscroll then
      setProperty('plus.x', getProperty('healthBarBG.x') - getProperty('healthBarBG.width') / 2 - 23)
      setProperty('plus.y', getProperty('healthBarBG.y') + 88)
      end
      end

      if middlescroll then
      if not downscroll then
      setProperty('plus.x', 20)
      setProperty('plus.y', 658)
      elseif downscroll then
      setProperty('plus.x', 20)
      setProperty('plus.y', 168)
      end
      end

      doTweenX('plusTween', 'plus', -0.25, 1, 'circOut')
      doTweenAlpha('plusAlpha', 'plus', 0, 0.5, 'quadIn')
    end


    function onStartCountdown()
        doTweenAlpha('hudFadeIn', 'camHUD', 1, 0.5, 'linear');
    end
