value = 0
eT = 0 --elapsed time
reach = {
  x = 0.6,
  y = 0.6
}
speed = {
  x = 2,
  y = 2
}
offset = {
  x = 0,
  y = 0
}
function onSongStart()
value = 1
end

function onUpdate(e)
if value == 1 then
  eT = eT + e
  setProperty('dadGroup.x', getProperty 'dadGroup.x' + math.sin((eT * speed.x) + offset.x) * reach.x)
  setProperty('dadGroup.y', getProperty 'dadGroup.y' + math.cos((eT * speed.y) + offset.y) * reach.y)
  if not mustHitSection then
    runHaxeCode 'game.moveCameraSection();'
  end
end
end
