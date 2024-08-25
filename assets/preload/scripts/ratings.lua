function onCreatePost()
    if not hideHud and getPropertyFromClass('ClientPrefs', 'ratingsEnabled') then
        makeAnimatedLuaSprite("ratings", "ratings", 1050, 580)
        addLuaSprite("ratings", true)
        setScrollFactor('ratings', 0, 0)
        setObjectCamera('ratings', 'hud')
        setProperty('ratings.alpha', 0)
        scaleObject('ratings', 0.5, 0.5)
        runTimer('waitin', 10)
    end

    if downscroll then
        setProperty('ratings.y', 30)
    end

    addAnimationByPrefix('ratings', 'PLUS', 'PLUS', 24, false)
    addAnimationByPrefix('ratings', 'S', 'S', 24, false)
    addAnimationByPrefix('ratings', 'A', 'A', 24, false)
    addAnimationByPrefix('ratings', 'B', 'B', 24, false)
    addAnimationByPrefix('ratings', 'C', 'C', 24, false)
    addAnimationByPrefix('ratings', 'D', 'D', 24, false)
    addAnimationByPrefix('ratings', 'E', 'E', 24, false)
    addAnimationByPrefix('ratings', 'F', 'F', 24, false)
    addAnimationByPrefix('ratings', '?', '?', 24, false)

    objectPlayAnimation('ratings', '?', false)
end

local function playRatingAnimation()
    if curBeat % 2 == 0 then
        if rating >= 0.99 then
            objectPlayAnimation('ratings', 'PLUS', false)
        elseif rating >= 0.95 then
            objectPlayAnimation('ratings', 'S', false)
        elseif rating >= 0.90 then
            objectPlayAnimation('ratings', 'A', false)
        elseif rating >= 0.80 then
            objectPlayAnimation('ratings', 'B', false)
        elseif rating >= 0.70 then
            objectPlayAnimation('ratings', 'C', false)
        elseif rating >= 0.60 then
            objectPlayAnimation('ratings', 'D', false)
        elseif rating >= 0.50 then
            objectPlayAnimation('ratings', 'E', false)
        elseif rating >= 0.40 then
            objectPlayAnimation('ratings', 'F', false)
        elseif rating <= 0.20 then
            objectPlayAnimation('ratings', '?', false)
        else
            objectPlayAnimation('ratings', '?', false)
        end
    end
end

function onUpdate()
    playRatingAnimation()
end

function onTimerCompleted(tag)
    if tag == 'waitin' then
        doTweenAlpha('yooo', 'ratings', 1, 1, 'linear')
    end
end
