function opponentNoteHit()
if not hideHud and getPropertyFromClass('ClientPrefs', 'drain') then
    health = getProperty('health')
    if getProperty('health') > 0.4 then
        setProperty('health', health- 0.018);
    end
  end

  if hideHud then
      health = getProperty('health')
      if getProperty('health') > 0.02264 then
          setProperty('health', health- 0.02263);
      end
    end
end
