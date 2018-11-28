function init_back()
	disp_back = false
	back_img = love.graphics.newImage("img/Back.png")
end

function update_back()
	if disp_back == false then
		disp_back = true
	else
		disp_back = false
	end
end

function draw_back()
	if disp_back == true then
		love.graphics.draw(back_img, 360, 200)
	end	
end