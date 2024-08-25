plNotes = 0
opNotes = 0
nuhuh = false
nuhuh1 = false
dontDoTheScript = false

function onCreate()
	--[[ if you don't want this script to happen in certain songs, put the song's data folder name in ""
	if songPath == "" then
		dontDoTheScript = true
	else

	end
	]]
	setProperty('skipArrowStartTween', true)
end

function onCreatePost()
	if not dontDoTheScript and not middlescroll then
		for i = 0,3 do
			setPropertyFromGroup('playerStrums', i, 'alpha', 1)
			setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
		end
	end
	if not dontDoTheScript and middlescroll then
		for i = 0,3 do
			setPropertyFromGroup('playerStrums', i, 'alpha', 1)
			setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
			setProperty('lane4', 'alpha', 1)
		end
	end
end

function onSongStart()
	if not dontDoTheScript and not middlescroll then
		if opNotes == 0 then
			for i = 0,3 do
				noteTweenAlpha('opponentStrums'..i, i, 0.5, 1.5, 'sineOut')
				end
			end

		if plNotes == 0 then
			for i = 4,7 do
				noteTweenAlpha('playerStrums'..i, i, 0.5, 1.5, 'sineOut')
			end
		end
	end

	if not dontDoTheScript and middlescroll then
		if plNotes == 0 then
			for i = 4,7 do
				noteTweenAlpha('playerStrums'..i, i, 0.5, 1.5, 'sineOut')
				doTweenAlpha('laneback1', 'lane4', 0.5, 1.5, 'sineOut')
			end
		end
	end
end

function onSpawnNote(id, direction, type, holdNote)
	if not dontDoTheScript then
		if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			opNotes = opNotes + 1
			if nuhuh == false then
				runTimer('opWait', 1, 1)
			end
			nuhuh = true
		else
			plNotes = plNotes + 1
			if nuhuh1 == false then
				runTimer('plWait', 1, 1)
			end
			nuhuh1 = true
		end
	end
end

function goodNoteHit()
	if not dontDoTheScript then
		plNotes = plNotes - 1
		runTimer('plStrum', 0.3, 1)
	end
end

function noteMiss()
	if not dontDoTheScript then
		plNotes = plNotes - 1
		runTimer('plStrum', 0.3, 1)
	end
end

function opponentNoteHit()
	if not dontDoTheScript and not middlescroll then
		opNotes = opNotes - 1
		runTimer('opStrum', 0.3, 1)
		else
		opNotes = opNotes - 0.5
		runTimer('opStrum', 0.6, 1)
	end
end

function onTimerCompleted(tag)
	if tag == 'opStrum' and opNotes == 0 and not middlescroll then
		for i = 0,3 do
			noteTweenAlpha('opponentStrums'..i, i, 0.5, 0.25, 'sineOut')
		end
	elseif tag == 'plStrum' and plNotes == 0 then
		for i = 4,7 do
			noteTweenAlpha('playerStrums'..i, i, 0.5, 0.25, 'sineOut')
			doTweenAlpha('lanegone1', 'lane4', 0.5, 0.7, 'sineOut')
			doTweenAlpha('combogone', 'osucombo', 0.5, 0.7, 'sineOut')
		end
	elseif tag == 'opWait' and not middlescroll then
		for i = 0,3 do
			noteTweenAlpha('opponentStrums'..i, i, 1, 0.25, 'sineOut')
		end
		nuhuh = false
	elseif tag == 'plWait' then
		for i = 4,7 do
			noteTweenAlpha('playerStrums'..i, i, 1, 0.25, 'sineOut')
			doTweenAlpha('laneback1', 'lane4', 1, 0.7, 'sineOut')
			doTweenAlpha('comboback', 'osucombo', 1, 0.7, 'sineOut')
		end
		nuhuh1 = false
	end
end
