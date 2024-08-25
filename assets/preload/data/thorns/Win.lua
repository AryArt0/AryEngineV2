function onCreatePost()
 setProperty('camHUD.alpha', 1)
 end

 function onStartCountdown()
     doTweenAlpha('hudFadeIn', 'camHUD', 1, 0.5, 'linear');
 end
