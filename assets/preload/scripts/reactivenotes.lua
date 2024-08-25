function goodNoteHit(id, noteData, noteType, isSustainNote)


	-- just up (no directions) make + for down
 if noteData == 0 and not downscroll then
		noteTweenY('hitL', 4, defaultPlayerStrumY0 - 7, 0.1, 'sineIn')
		runTimer('returnL', 0.03, 5)
	elseif noteData == 1 and not downscroll then
		noteTweenY('hitD', 5, defaultPlayerStrumY1 - 7, 0.1, 'sineIn')
		runTimer('returnD', 0.03, 5)
	elseif noteData == 2 and not downscroll then
		noteTweenY('hitU', 6, defaultPlayerStrumY2 - 7, 0.1, 'sineIn')
		runTimer('returnU', 0.03, 5)
	elseif noteData == 3 and not downscroll then
		noteTweenY('hitR', 7, defaultPlayerStrumY3 - 7, 0.1, 'sineIn')
		runTimer('returnR', 0.03, 5)
	end

	if noteData == 0 and downscroll then
		 noteTweenY('hitLd', 4, defaultPlayerStrumY0 + 7, 0.1, 'sineIn')
		 runTimer('returnLd', 0.03, 5)
	 elseif noteData == 1 and downscroll then
		 noteTweenY('hitDd', 5, defaultPlayerStrumY1 + 7, 0.1, 'sineIn')
		 runTimer('returnDd', 0.03, 5)
	 elseif noteData == 2 and downscroll then
		 noteTweenY('hitUd', 6, defaultPlayerStrumY2 + 7, 0.1, 'sineIn')
		 runTimer('returnUd', 0.03, 5)
	 elseif noteData == 3 and downscroll then
		 noteTweenY('hitRd', 7, defaultPlayerStrumY3 + 7, 0.1, 'sineIn')
		 runTimer('returnRd', 0.03, 5)
end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)

	-- just up (no directions) make + for down
	if noteData == 0 and not downscroll then
		noteTweenY('hitLOP', 0, defaultOpponentStrumY0 - 7, 0.1, 'sineIn')
		runTimer('returnLOP', 0.03, 5)
	elseif noteData == 1  and not downscroll then
		noteTweenY('hitDOP', 1, defaultOpponentStrumY1 - 7, 0.1, 'sineIn')
		runTimer('returnDOP', 0.03, 5)
	elseif noteData == 2  and not downscroll then
		noteTweenY('hitUOP', 2, defaultOpponentStrumY2 - 7, 0.1, 'sineIn')
		runTimer('returnUOP', 0.03, 5)
	elseif noteData == 3  and not downscroll then
		noteTweenY('hitROP', 3, defaultOpponentStrumY3 - 7, 0.1, 'sineIn')
		runTimer('returnROP', 0.03, 5)
	end

	if noteData == 0 and downscroll then
	noteTweenY('hitLOPd', 0, defaultOpponentStrumY0 + 7, 0.1, 'sineIn')
	runTimer('returnLOPd', 0.03, 5)
elseif noteData == 1 and downscroll then
	noteTweenY('hitDOPd', 1, defaultOpponentStrumY1 + 7, 0.1, 'sineIn')
	runTimer('returnDOPd', 0.03, 5)
elseif noteData == 2 and downscroll then
	noteTweenY('hitUOPd', 2, defaultOpponentStrumY2 + 7, 0.1, 'sineIn')
	runTimer('returnUOPd', 0.03, 5)
elseif noteData == 3 and downscroll then
	noteTweenY('hitROPd', 3, defaultOpponentStrumY3 + 7, 0.1, 'sineIn')
	runTimer('returnROPd', 0.03, 5)
 end
end

function onTimerCompleted(tag, loops, loopsLeft)

	--=========================[BF]==============================--

	if tag == 'returnL' and not downscroll then -- Just up n down
		noteTweenY('backL', 4, defaultPlayerStrumY0, 0.5, 'sineIn')
	end
	if tag == 'returnD' and not downscroll then
		noteTweenY('backD', 5, defaultPlayerStrumY1, 0.5, 'sineIn')
	end
	if tag == 'returnU' and not downscroll then
		noteTweenY('backU', 6, defaultPlayerStrumY2, 0.5, 'sineIn')
	end
	if tag == 'returnR' and not downscroll  then
		noteTweenY('backR', 7, defaultPlayerStrumY3, 0.5, 'sineIn')
	end

	if tag == 'returnLd' and downscroll then -- Just up n down
		noteTweenY('backLd', 4, defaultPlayerStrumY0, 0.5, 'sineIn')
	end
	if tag == 'returnDd' and downscroll then
		noteTweenY('backDd', 5, defaultPlayerStrumY1, 0.5, 'sineIn')
	end
	if tag == 'returnUd' and downscroll then
		noteTweenY('backUd', 6, defaultPlayerStrumY2, 0.5, 'sineIn')
	end
	if tag == 'returnRd' and downscroll then
		noteTweenY('backRd', 7, defaultPlayerStrumY3, 0.5, 'sineIn')
	end

	--=========================[DAD]=============================--

	if tag == 'returnLOP' and not downscroll then -- Just up n down
		noteTweenY('backLOP', 0, defaultOpponentStrumY0, 0.5, 'sineIn')
	end
	if tag == 'returnDOP' and not downscroll  then
		noteTweenY('backDOP', 1, defaultOpponentStrumY1, 0.5, 'sineIn')
	end
	if tag == 'returnUOP' and not downscroll  then
		noteTweenY('backUOP', 2, defaultOpponentStrumY2, 0.5, 'sineIn')
	end
	if tag == 'returnROP' and not downscroll  then
		noteTweenY('backROP', 3, defaultOpponentStrumY3, 0.5, 'sineIn')
	end


		if tag == 'returnLOPd' and downscroll then -- Just up n down
			noteTweenY('backLOPd', 0, defaultOpponentStrumY0, 0.5, 'sineIn')
		end
		if tag == 'returnDOPd' and downscroll then
			noteTweenY('backDOPd', 1, defaultOpponentStrumY1, 0.5, 'sineIn')
		end
		if tag == 'returnUOPd' and downscroll then
			noteTweenY('backUOPd', 2, defaultOpponentStrumY2, 0.5, 'sineIn')
		end
		if tag == 'returnROPd' and downscroll then
			noteTweenY('backROPd', 3, defaultOpponentStrumY3, 0.5, 'sineIn')
		end
end
