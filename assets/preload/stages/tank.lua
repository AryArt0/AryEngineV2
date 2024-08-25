function onCreate()
if not isStoryMode then
	setPropertyFromClass('PauseSubState', 'songName', 'pausemusic/week7pause')
	playSound("intromusic/week7pause", 2, 'lol')
	end
end


function onStartCountdown()
soundFadeIn('lol', 2, 2, 0)
end

function onPause()
stopSound('lol')
end
