
function onCreatePost()
if not hideHud and not middlescroll then
	makeLuaSprite('Health', 'healthbarSacorg')
	setObjectCamera('Health', 'hud')
	scaleObject('Health', 0.9, 0.75)
	addLuaSprite('Health', true)
	setObjectOrder('Health', getObjectOrder('healthBar') + 1)
	setProperty('healthBar.visible', true)
end
end

function onUpdatePost(elapsed)
	setProperty('Health.x', getProperty('healthBar.x') - 47)
	setProperty('Health.y', getProperty('healthBar.y') - 35)
end
