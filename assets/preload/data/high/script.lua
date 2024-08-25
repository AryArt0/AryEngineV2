local stop_countdown = true


function onCreatePost()
if stop_countdown == true then
    stop_countdown = false
		playSound("traffic", 0.5)

		return Function_Stop
	end

	return Function_Continue
end



-- crash prevention
function onUpdate() end
function onUpdatePost() end
