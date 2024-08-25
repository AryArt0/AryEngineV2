function onCreatePost()
if not middlescroll then
if downscroll then
    makeLuaText("osucombo", "0x", 1280, 0, 595) --left: 0 right: 775
    setTextSize("osucombo", 32)
  	setTextFont('osucombo', 'combo.ttf')
    setTextAlignment("osucombo", "right")
    addLuaText('osucombo')
    makeLuaText("osucombosh", "0x", 1280, 0, 595) --left: 0 right: 775
    setTextSize("osucombosh", 34)
    setTextFont('osucombosh', 'combo.ttf')
    setTextAlignment("osucombosh", "right")
    addLuaText('osucombosh')
    setProperty('osucombosh.alpha', 0.5)
    else
    makeLuaText("osucombo", "0x", 1280, 0, 85) --left: 0 right: 775
    setTextSize("osucombo", 32)
    setTextFont('osucombo', 'combo.ttf')
    setTextAlignment("osucombo", "right")
    addLuaText('osucombo')
    makeLuaText("osucombosh", "0x", 1280, 0, 85) --left: 0 right: 775
    setTextSize("osucombosh", 34)
    setTextFont('osucombosh', 'combo.ttf')
    setTextAlignment("osucombosh", "right")
    addLuaText('osucombosh')
    setProperty('osucombosh.alpha', 0.5)
end
end

if middlescroll then
if downscroll then
    makeLuaText("osucombo", "0x", 955, 0, 595) --left: 0 right: 775
    setTextSize("osucombo", 32)
  	setTextFont('osucombo', 'combo.ttf')
    setTextAlignment("osucombo", "right")
    addLuaText('osucombo')
    makeLuaText("osucombosh", "0x", 955, 0, 595) --left: 0 right: 775
    setTextSize("osucombosh", 34)
    setTextFont('osucombosh', 'combo.ttf')
    setTextAlignment("osucombosh", "right")
    addLuaText('osucombosh')
    setProperty('osucombosh.alpha', 0.5)
    else
    makeLuaText("osucombo", "0x", 955, 0, 85) --left: 0 right: 775
    setTextSize("osucombo", 32)
    setTextFont('osucombo', 'combo.ttf')
    setTextAlignment("osucombo", "right")
    addLuaText('osucombo')
    makeLuaText("osucombosh", "0x", 955, 0, 85) --left: 0 right: 775
    setTextSize("osucombosh", 34)
    setTextFont('osucombosh', 'combo.ttf')
    setTextAlignment("osucombosh", "right")
    addLuaText('osucombosh')
    setProperty('osucombosh.alpha', 0.5)
end
end
			setProperty('osucombo.alpha', 0)
      setProperty('osucombosh.alpha', 0)
end

function onUpdate()
if getProperty('combo') == 1 then
setTextColor("osucombo", "FFFFFF")
setTextColor("osucombosh", "FFFFFF")
elseif getProperty('combo') >= 100 and getProperty('combo') <= 199 then
setTextColor("osucombo", "9BF3FF")
setTextColor("osucombosh", "9BF3FF")
elseif getProperty('combo') >= 200 and getProperty('combo') <= 299 then
setTextColor("osucombo", "FDFF98")
setTextColor("osucombosh", "FFF460")
elseif getProperty('combo') >= 300 and getProperty('combo') <= 399 then
setTextColor("osucombo", "FFB187")
setTextColor("osucombosh", "FFD39B")
elseif getProperty('combo') >= 400 and getProperty('combo') <= 499 then
setTextColor("osucombo", "FF7C7C")
setTextColor("osucombosh", "FF7C7C")
elseif getProperty('combo') >= 500 and getProperty('combo') <= 999 then
setTextColor("osucombo", "FF9AD5")
setTextColor("osucombosh", "FF9AD5")
elseif getProperty('combo') >= 1000 then
setTextColor("osucombo", "E6A9FF")
setTextColor("osucombosh", "E6A9FF")
end
end

function onUpdatePost(elapsed)
    setTextString("osucombosh", getProperty("combo") .. "x")
end

function goodNoteHit(id, direction, noteType, isSustainNote)
if not middlescroll then
    if downscroll and not isSustainNote then
        setProperty("osucombo.scale.x", 1.005)
        setProperty("osucombo.scale.y", 1.005)
        setProperty("osucombo.x", 0) --left: 50 right: 725
        setProperty("osucombo.y", 580)

        doTweenX("osuxs", "osucombo.scale", 1, 0.25, "linear")
        doTweenY("osuys", "osucombo.scale", 1, 0.35, "linear")
        doTweenX("osux", "osucombo", 0, 0.25, "linear")
        doTweenY("osuy", "osucombo", 595, 0.25, "linear")

        setTextString("osucombo", getProperty("combo")-1 .. "x")
        runTimer("combocauter", 0.25)

        setProperty("osucombosh.scale.x", 1.25)
        setProperty("osucombosh.scale.y", 1.25)
        setProperty("osucombosh.x", -150) --left: 50 right: 725
        setProperty("osucombosh.y", 575)
        setProperty('osucombosh.alpha', 0.5)

        doTweenX("osuxss", "osucombosh.scale", 1, 1.25, "linear")
        doTweenY("osuyss", "osucombosh.scale", 1, 1.25, "linear")
        doTweenX("osuxsh", "osucombosh", -115, 0.25, "linear")
        doTweenY("osuysh", "osucombosh", 595, 1.25, "linear")
        doTweenAlpha("osuassh", "osucombosh", 0, 0.25, "linear")

        elseif not downscroll and not isSustainNote then

        setProperty("osucombo.scale.x", 1.005)
        setProperty("osucombo.scale.y", 1.005)
        setProperty("osucombo.x", 0) --left: 50 right: 725
        setProperty("osucombo.y", 75)

        doTweenX("osuxs", "osucombo.scale", 1, 0.25, "linear")
        doTweenY("osuys", "osucombo.scale", 1, 0.35, "linear")
        doTweenX("osux", "osucombo", 0, 0.25, "linear")
        doTweenY("osuy", "osucombo", 85, 0.25, "linear")

        setTextString("osucombo", getProperty("combo")-1 .. "x")
        runTimer("combocauter", 0.25)

        setProperty("osucombosh.scale.x", 1.25)
        setProperty("osucombosh.scale.y", 1.25)
        setProperty("osucombosh.x", -150) --left: 50 right: 725
        setProperty("osucombosh.y", 75)
        setProperty('osucombosh.alpha', 0.5)

        doTweenX("osuxss", "osucombosh.scale", 1, 1.25, "linear")
        doTweenY("osuyss", "osucombosh.scale", 1, 1.25, "linear")
        doTweenX("osuxsh", "osucombosh", -115, 0.25, "linear")
        doTweenY("osuysh", "osucombosh", 80, 0.25, "linear")
        doTweenAlpha("osuassh", "osucombosh", 0, 0.25, "linear")
    end
    end

    if middlescroll then
        if downscroll and not isSustainNote then
            setProperty("osucombo.scale.x", 1.005)
            setProperty("osucombo.scale.y", 1.005)
            setProperty("osucombo.x", 0) --left: 50 right: 725
            setProperty("osucombo.y", 580)

            doTweenX("osuxs", "osucombo.scale", 1, 0.25, "linear")
            doTweenY("osuys", "osucombo.scale", 1, 0.35, "linear")
            doTweenX("osux", "osucombo", 0, 0.25, "linear")
            doTweenY("osuy", "osucombo", 595, 0.25, "linear")

            setTextString("osucombo", getProperty("combo")-1 .. "x")
            runTimer("combocauter", 0.25)

            setProperty("osucombosh.scale.x", 1.25)
            setProperty("osucombosh.scale.y", 1.25)
            setProperty("osucombosh.x", -120) --left: 50 right: 725
            setProperty("osucombosh.y", 575)
            setProperty('osucombosh.alpha', 0.5)

            doTweenX("osuxss", "osucombosh.scale", 1, 1.25, "linear")
            doTweenY("osuyss", "osucombosh.scale", 1, 1.25, "linear")
            doTweenX("osuxsh", "osucombosh", -95, 0.25, "linear")
            doTweenY("osuysh", "osucombosh", 595, 1.25, "linear")
            doTweenAlpha("osuassh", "osucombosh", 0, 0.25, "linear")

            elseif not downscroll and not isSustainNote then

            setProperty("osucombo.scale.x", 1.005)
            setProperty("osucombo.scale.y", 1.005)
            setProperty("osucombo.x", 0) --left: 50 right: 725
            setProperty("osucombo.y", 75)

            doTweenX("osuxs", "osucombo.scale", 1, 0.25, "linear")
            doTweenY("osuys", "osucombo.scale", 1, 0.35, "linear")
            doTweenX("osux", "osucombo", 0, 0.25, "linear")
            doTweenY("osuy", "osucombo", 85, 0.25, "linear")

            setTextString("osucombo", getProperty("combo")-1 .. "x")
            runTimer("combocauter", 0.25)

            setProperty("osucombosh.scale.x", 1.25)
            setProperty("osucombosh.scale.y", 1.25)
            setProperty("osucombosh.x", -120) --left: 50 right: 725
            setProperty("osucombosh.y", 75)
            setProperty('osucombosh.alpha', 0.5)

            doTweenX("osuxss", "osucombosh.scale", 1, 1.25, "linear")
            doTweenY("osuyss", "osucombosh.scale", 1, 1.25, "linear")
            doTweenX("osuxsh", "osucombosh", -85, 0.25, "linear")
            doTweenY("osuysh", "osucombosh", 80, 0.25, "linear")
            doTweenAlpha("osuassh", "osucombosh", 0, 0.25, "linear")
        end
        end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "combocauter" then
        setTextString("osucombo", getProperty("combo") .. "x")
    end
end
