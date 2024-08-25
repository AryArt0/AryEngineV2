function onCreate()
if not hideHud then
setProperty('health', 2);
health = getProperty('health')
runTimer('yes', 0.3)
end
end

function onTimerCompleted(tag)
if tag == 'yes' then
setProperty('health', 1)
end
end
