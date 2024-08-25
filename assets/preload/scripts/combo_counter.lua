coloredText = true

function onCreate()
	setPropertyFromClass('ClientPrefs', 'comboOffset[0]', 9999)
	setProperty('showComboNum', false)
end


function onCreatePost()
	local comboTextX = 445

	setProperty('comboSpr.visible', false)

if not middlescroll then
if not downscroll then
	makeLuaText('comboTxt', '', 385, comboTextX, 155)
end

if downscroll then
   makeLuaText('comboTxt', '', 385, comboTextX, 455)
end
end

if middlescroll or songName == 'Blazin' then
if not downscroll then
	makeLuaText('comboTxt', '', 385, 800, 200)
end

if downscroll then
   makeLuaText('comboTxt', '', 385, 800, 450)
end
end


	setTextSize('comboTxt', 42)
	setTextBorder('comboTxt', 3, '000000')
	setTextFont('comboTxt', 'combo.ttf')
	setTextAlignment('comboTxt', 'center')
	addLuaText('comboTxt')
end


function goodNoteHit(id, direction, noteType, isSustainNote)

	local rawNoteRating = getPropertyFromGroup('notes', id, 'rating')
	local noteRating = rawNoteRating



	if coloredText then
		local colorScore = "FFFFFF"
	end

	combo = getProperty('combo')

	if not isSustainNote then
		if rawNoteRating == 'sick' then
			noteRating = "Sick!!"

		 if combo >= 0 and combo <= 100 then
			colorScore = "FFFFFF"
			elseif combo >= 100 and combo <= 199 then
 			colorScore = "9BF3FF"
			elseif combo >= 200 and combo <= 299 then
 			colorScore = "FDFF98"
			elseif combo >= 300 and combo <= 399 then
 			colorScore = "FFB187"
			elseif combo >= 400 and combo <= 499 then
 			colorScore = "FF7C7C"
			elseif combo >= 500  and combo <= 999 then
 			colorScore = "FF9AD5"
			elseif combo >= 1000 then
 			colorScore = "E6A9FF"
		end

		elseif rawNoteRating == 'good' then
			noteRating = "Good!"

			if getProperty('combo') >= 0 and combo <= 100 then
			 colorScore = "FFFFFF"
			 elseif combo >= 100 and combo <= 199 then
			 colorScore = "9BF3FF"
			 elseif combo >= 200 and combo <= 299 then
			 colorScore = "FDFF98"
			 elseif combo >= 300 and combo <= 399 then
			 colorScore = "FFB187"
			 elseif combo >= 400 and combo <= 499 then
			 colorScore = "FF7C7C"
			 elseif combo >= 500 and combo <= 999 then
			 colorScore = "FF9AD5"
			 elseif combo >= 1000 then
			 colorScore = "E6A9FF"
		 end

		elseif rawNoteRating == 'bad' then
			noteRating = "Bad"
			colorScore = "CECECE"
		elseif rawNoteRating == 'shit' then
			noteRating = "Shit"
			colorScore = "8D8D8D"
		else
			noteRating = "HOW"
			colorScore = "FFFFFF"
		end
	end

	if not isSustainNote then
		setProperty('comboTxt.scale.x', 1.4)
		setProperty('comboTxt.scale.y', 1.4)
		setProperty('comboTxt.alpha', 1)
		cancelTween('comboTxtAlphaTween')
		setTextString('comboTxt', noteRating .. "\n")
	end

	if coloredText then
		setTextColor('comboTxt', colorScore)
	end

	if not isSustainNote then
		doTweenX('scaleTweenX', 'comboTxt.scale', 1, 2.2, 'expoOut');
		doTweenY('scaleTweenY', 'comboTxt.scale', 1, 2.2, 'expoOut');
		doTweenAlpha('comboTxtAlphaTween', 'comboTxt', 0, 1, 'linear')
	end
end

	function noteMiss(id, direction, noteType, isSustainNote)
	setTextString('comboTxt', 'Miss..')
	setTextColor('comboTxt', 'FF6060')


	if not isSustainNote then
		setProperty('comboTxt.scale.x', 1.4)
		setProperty('comboTxt.scale.y', 1.4)
		setProperty('comboTxt.alpha', 1)
			setTextColor('comboTxt', 'FF6060')
		cancelTween('comboTxtAlphaTween')
	end

	if not isSustainNote then
		doTweenX('scaleTweenX', 'comboTxt.scale', 1, 2.2, 'expoOut');
		doTweenY('scaleTweenY', 'comboTxt.scale', 1, 2.2, 'expoOut');
		doTweenAlpha('comboTxtAlphaTween', 'comboTxt', 0, 1, 'linear')
	end
	end

function onTweenCompleted(tag)
	if tag == 'comboTxtAlphaTween' then
		comboTxt.alpha = 0
	end
end
