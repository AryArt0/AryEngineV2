--Sets Probability of... (but please, don't set higher for lower things, exemple, misses = 50 and sicks = 25)
local MINrandom = 1 --To set the minimum can be the Random Generator (can't be 0, for some reason)
local MAXrandom = 100 --To set the maximum can be the Random Generator
local Rsicks = 5 --The number set here is the minimal the generator need to count that a "SICK"
local Rgoods = 2 --The number set here is the minimal betwen Rsicks to get "GOOD"
local Rbads = 1 --Like for Rgoods
local Rshits = 0.5 --Like for Rgoods and Rbads
local Rmisses = 0 --Instead of minimal, is maximum

--Sets settings, i do this to don't give you a headache because you don't have skill to change code entierly for just one things lol
local showbotscompareyou = false --Show the comparison of bots score, miss and accuracy with your's (example: PLAYER Score: 4500 BOT Score: 4000 done (+500)), did you underastand ? if you don't, set false and see yourself !
local comparisoncolor = false --Change the score, miss, accuracy color if it's lower or higher of your's (red if higher, green if lower (example: PLAYER Score: 4500 BOT Score: 4000, that make the BOT Score color to green) or white if it's equal)
local showbotaccuracydetails = true --Show the numbers of Sicks, Goods, Bads and Shits the bot have
local fairscore = false -- /!\ VERY EXPERIMENTAL /!\ if the chart have more note for opponent side or player side, the opponent score can be lower or higher
local scorebardif = false --The healthbar become a difference score bar (did you understand ?) (you have sub option bellow !)
    local dynamicbar = false --how to explain that ? (and yes, like funky friday health bar)
        local staticbar = 25000 --i need a translator (can be used only if the dynamicbar is false) (you maybe know how to use if you have played roblox MMM)
local CPUmissdosound = false --When the bot do a miss, that also make a random miss sound
local showtextsstatic = true --if true, the text score, accuracy and misses will not move
local textlikeplayer = false --it will add a copy of your score text but for the opponent and it will be under your text (and if you have the "Zoom score on hit" checked, the opponent text will also zoom if opponent hit)
    local showopponentbeforetext = true --just in case
local hideCPUstats = false --if true, it will hide the opponent score, miss and accuracy, the normal one, not the others like with "textlikeplayer"

--Presets: Totally random
--MIN 1
--MAX 5
--Rsicks 5
--Rgoods 4
--Rbads 3
--Rshits 2
--Rmisses 1

--Presets: doudouvi's skill
--MIN 1
--MAX 500
--Rsicks 50
--Rgoods 10
--Rbads 5
--Rshits 2
--Rmisses 1

--Default
--MIN 1
--MAX 100
--Rsicks 25
--Rgoods 10
--Rbads 5
--Rshits 2
--Rmisses 1
--if you modify somethings bellow but that bug, don't harass me

local CPUscore = 0
local CPUratingName = "?"
local CPUratingFC = ""
local altCPUscore = 0
local CPUsicks = 0
local CPUgoods = 0
local CPUbads = 0
local CPUshits = 0
local CPUmisses = 0
local CPUcombo = 0
local CPUrandomrating = 0
local CPUnotehit = 0
local CPUaccuracy = 0
local scoreTxtYdefault = {676.8, 115.2}

function onCreatePost()
    if textlikeplayer then
        setObjectOrder("CPUscoreTxt", 41)
    end
end

function onCreate()
isPixelStage = getPropertyFromClass('PlayState', 'isPixelStage')

    if downscroll then
        downorup = scoreTxtYdefault[2]
    else
        downorup = scoreTxtYdefault[1]
    end
    --makeLuaText('CPUaccuracy', '0', 250, 0, 325)
    if not downscroll then
    makeLuaText('CPUaccuracy', '0', 500, -105, 638)
    end
    if downscroll then
    makeLuaText('CPUaccuracy', '0', 500, -105, 98)
    end
    --makeLuaText('CPUmisses', 'Misses:'.. 0, 250, 0, 475)
    makeLuaText('CPUmisses', 'Misses:'.. 0, 500, -100, 1280)
    if hideHud then
    addLuaText('CPUaccuracy')
    addLuaText('CPUscore')
    addLuaText('CPUcombo')
    end
    if hideCPUstats then
        setProperty("CPUaccuracy.visible", false)
        setProperty("CPUmisses.visible", false)
        setProperty("CPUscore.visible", false)
    end
    if showbotaccuracydetails == true then
        addLuaText('CPUsicks');
        addLuaText('CPUgoods');
        addLuaText('CPUbads');
        addLuaText('CPUshits');
    end
    addLuaText('CPUmisses')
    setTextSize('CPUscore', 30)
    setTextSize('ScoreDif', 30)
    setTextSize('CPUaccuracy', (isPixelStage and 25 or 30))
    setTextFont('CPUaccuracy', (isPixelStage and 'pixel.otf' or 'thefontever.ttf'))
    setTextSize('CPUmisses', 30)
    setTextSize('accuracyDif', 30)
    setTextSize("missesdif", 30)
    setTextWidth("CPUaccuracy", 500)
    --Default Size = 16
    if textlikeplayer then
        if showopponentbeforetext then
            makeLuaText("CPUscoreTxt", "Opponent: Score: 0 | Misses: 0 | Rating: ?", 1280, 0, downorup + 22)
        else
            makeLuaText("CPUscoreTxt", "Score: 0 | Misses: 0 | Rating: ?", 1280, 0, downorup + 22)
        end
        setTextSize("CPUscoreTxt", 20)
        setTextBorder("CPUscoreTxt", 2, "000000")
        addLuaText("CPUscoreTxt")
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        if noteType == "Hurt Note" then
        else
        CPUnotehit = CPUnotehit + 1
    CPUrandomrating = getRandomInt(MINrandom,MAXrandom)
    if CPUrandomrating >= Rsicks then
        CPUsicks = CPUsicks + 1
        CPUcombo = CPUcombo + 1
    elseif CPUrandomrating >= Rgoods and CPUrandomrating < Rsicks then
        CPUgoods = CPUgoods + 1
        CPUcombo = CPUcombo + 1
    elseif CPUrandomrating >= Rbads and CPUrandomrating < Rgoods then
        CPUbads = CPUbads + 1
        CPUcombo = CPUcombo + 1
    elseif CPUrandomrating >= Rshits and CPUrandomrating < Rbads then
        CPUshits = CPUshits + 1
        CPUcombo = CPUcombo + 1
    elseif CPUrandomrating <= Rmisses then
        CPUmisses = CPUmisses + 1
        CPUcombo = 0
        if CPUmissdosound == true then
            playSound("missnote"..getRandomInt(1,3), 1)
        end
    end
    if scoreZoom and textlikeplayer then
        setProperty("CPUscoreTxt.scale.y", 1.075)
        setProperty("CPUscoreTxt.scale.x", 1.075)
        doTweenX("Zoomingcpuscorex", "CPUscoreTxt.scale", 1, 0.25, "linear")
        doTweenY("Zoomingcpuscorey", "CPUscoreTxt.scale", 1, 0.25, "linear")
    end
end
end
    CPUscore = CPUsicks*350+CPUgoods*200+CPUbads*100+CPUshits*50+-CPUmisses*10

end


function onUpdate(elapsed)
    CPUaccuracy = ((CPUsicks*100+CPUgoods*70+CPUbads*40+CPUshits*0+CPUmisses*0) / CPUnotehit)/100
    if comparisoncolor == true then
        if fairscore == true then
            if score == altCPUscore then
                setTextString("ScoreDif", "(=)")
                setTextColor('CPUscore', 'ffffff')
            elseif score > altCPUscore then
                setTextString("ScoreDif", "(+" .. round(score-altCPUscore, 0) .. ")")
                setTextColor('CPUscore', '00ff11')
            elseif score < altCPUscore then
                setTextString("ScoreDif", "(-" .. round(altCPUscore-score, 0) .. ")")
                setTextColor('CPUscore', 'ff0000')
            end
        else
    if score == CPUscore then
        setTextString("ScoreDif", "(=)")
        setTextColor('CPUscore', 'ffffff')
    elseif score > CPUscore then
        setTextString("ScoreDif", "(+" .. score-CPUscore .. ")")
        setTextColor('CPUscore', '00ff11')
    elseif score < CPUscore then
        setTextString("ScoreDif", "(-" .. CPUscore-score .. ")")
        setTextColor('CPUscore', 'ffffff')
    end
    end
    if rating == CPUaccuracy then
        setTextString("accuracyDif", "(=)")
        setTextColor('CPUaccuracy', 'ffffff')
    elseif rating > CPUaccuracy then
        setTextString("accuracyDif", "(+" .. round((rating-CPUaccuracy)* 100, 2) .. ")")
        setTextColor('CPUaccuracy', '00ff11')
    elseif rating < CPUaccuracy then
        setTextString("accuracyDif", "(-" .. round((CPUaccuracy-rating)* 100, 2) .. ")")
        setTextColor('CPUaccuracy', 'ff0000')
    end
    if misses == CPUmisses then
        setTextString("missesdif", "(=)")
        setTextColor('CPUmisses', 'ffffff')
    elseif misses < CPUmisses then
        setTextString("missesdif", "(-" .. CPUmisses-misses .. ")")
        setTextColor('CPUmisses', 'ffffff')
    elseif misses > CPUmisses then
        setTextString("missesdif", "(+" .. misses-CPUmisses .. ")")
        setTextColor('CPUmisses', 'ffffff')
    end
    else
        if score == CPUscore then
            setTextString("ScoreDif", "(=)")
        elseif score > CPUscore then
            setTextString("ScoreDif", "(+" .. score-altCPUscore .. ")")
        elseif score < CPUscore then
            setTextString("ScoreDif", "(-" .. altCPUscore-score .. ")")
        end
    if score == CPUscore then
        setTextString("ScoreDif", "(=)")
    elseif score > CPUscore then
        setTextString("ScoreDif", "(+" .. score-CPUscore .. ")")
    elseif score < CPUscore then
        setTextString("ScoreDif", "(-" .. CPUscore-score .. ")")
    end
    if rating == CPUaccuracy then
        setTextString("accuracyDif", "(=)")
    elseif rating > CPUaccuracy then
        setTextString("accuracyDif", "(+" .. round((rating-CPUaccuracy)* 100, 2) .. ")")
    elseif rating < CPUaccuracy then
        setTextString("accuracyDif", "(-" .. round((CPUaccuracy-rating)* 100, 2) .. ")")
    end
    if misses == CPUmisses then
        setTextString("missesdif", "(=)")
    elseif misses < CPUmisses then
        setTextString("missesdif", "(-" .. CPUmisses-misses .. ")")
    elseif misses > CPUmisses then
        setTextString("missesdif", "(+" .. misses-CPUmisses .. ")")
    end
    end
    if round(CPUaccuracy*100, 2) >= 0 then
        setTextString('CPUaccuracy', round(CPUaccuracy*100, 2))
    else
        setTextString('CPUaccuracy', '' )
    end

    local a = CPUaccuracy
    if a == 1 then
        CPUratingName = "Perfect!!"
    elseif a < 0.2 then
        CPUratingName = "You Suck!"
    elseif a < 0.4 then
        CPUratingName = "Shit"
    elseif a < 0.5 then
        CPUratingName = "Bad"
    elseif a < 0.6 then
        CPUratingName = "Bruh"
    elseif a < 0.69 then
        CPUratingName = "Meh"
    elseif a < 0.7 then
        CPUratingName = "Nice"
    elseif a < 0.8 then
        CPUratingName = "Good"
    elseif a < 0.9 then
        CPUratingName = "Great!"
    elseif a < 1 then
        CPUratingName = "Sick!!"
    end

    if CPUmisses >= 10 then
        CPUratingFC = "Clear"
    elseif CPUmisses > 0 then
        CPUratingFC = "SDCB"
    elseif CPUbads > 0 or CPUshits > 0 then
        CPUratingFC = "FC"
    elseif CPUgoods > 0 then
        CPUratingFC = "GFC"
    elseif CPUsicks > 0 then
        CPUratingFC = "SFC"
    end



    if textlikeplayer and CPUnotehit ~= 0 then
        if showopponentbeforetext then
            setTextString("CPUscoreTxt", "Opponent: Score: " .. CPUscore .. " | Misses: " .. CPUmisses .. " | Rating: " .. CPUratingName .. " (" .. round(CPUaccuracy*100, 2) .. "%) - " .. CPUratingFC)
        else
            setTextString("CPUscoreTxt", "Score: " .. CPUscore .. " | Misses: " .. CPUmisses .. " | Rating: " .. CPUratingName .. " (" .. round(CPUaccuracy*100, 2) .. "%) - " .. CPUratingFC)
        end
    end


    hitsDif = CPUnotehit - (hits + misses)
    reverthitsDif =  (hits + misses) - CPUnotehit
    --if hits < CPUnotehit then
    --altCPUscore = CPUscore / (hitsDif * 1.5)
    --elseif hits > CPUnotehit then
    --    altCPUscore = CPUscore * (reverthitsDif * 1.5)
    --else
    --    altCPUscore = CPUscore
    --end
    if hits < CPUnotehit then
        altCPUscore = CPUsicks*(350/(hitsDif/2))+CPUgoods*(200/(hitsDif/2))+CPUbads*(100/(hitsDif/2))+CPUshits*(50/(hitsDif/2))+-CPUmisses*(10/(hitsDif/2))
    elseif hits > CPUnotehit then
        altCPUscore = CPUsicks*(350*(reverthitsDif/2))+CPUgoods*(200*(reverthitsDif/2))+CPUbads*(100*(reverthitsDif/2))+CPUshits*(50*(reverthitsDif/2))+-CPUmisses*(10*(reverthitsDif/2))
    else
        altCPUscore = CPUsicks*350+CPUgoods*200+CPUbads*100+CPUshits*50+-CPUmisses*10
    end
    if fairscore == true then
        setTextString('CPUscore', 'Score:' .. round(altCPUscore,0))
        else
            setTextString('CPUscore', 'Score:' .. CPUscore)
        end
        setTextString('CPUcombo', 'Combo:' .. CPUcombo)
        setTextString('CPUsicks', 'Sicks:' .. CPUsicks);
        setTextString('CPUgoods', 'Goods:' .. CPUgoods);
        setTextString('CPUbads', 'Bads:' .. CPUbads);
        setTextString('CPUshits', 'Shits:' .. CPUshits);
        setTextString('CPUmisses', 'Misses:' .. CPUmisses)
        if scorebardif == true then
            if dynamicbar == true then

        if score == CPUscore then
            setProperty("health", 1)
        elseif score > CPUscore then
            setProperty("health", 1 - ((CPUscore - score) / (score + CPUscore)))    --setTextString("ScoreDif", "(+" .. score-CPUscore .. ")")
        elseif score < CPUscore then
            setProperty("health", 1 + ((score-CPUscore) / (score + CPUscore)))    --setTextString("ScoreDif", "(-" .. CPUscore-score .. ")")
        end
    else
        if score == CPUscore then
            setProperty("health", 1)
        elseif score > CPUscore then
            setProperty("health", 1 - ((CPUscore - score) / staticbar))    --setTextString("ScoreDif", "(+" .. score-CPUscore .. ")")
        elseif score < CPUscore then
            setProperty("health", 1 + ((score-CPUscore) / staticbar))    --setTextString("ScoreDif", "(-" .. CPUscore-score .. ")")
        end
    end

    end
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end

--Sick = 100%
--Good = 70%
--Bads = 40%
--Shits = 0%
--Miss = 0%

function onGameOver()
    if scorebardif == true then
    return Function_Stop
    end
end

--[[function goodNoteHit()
    debugPrint(getProperty("scoreTxt.scale.x")) --1.075
end]]
