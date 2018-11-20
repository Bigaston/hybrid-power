function init_selector()
	selector = {}
	selector.anim= {}
	selector.anim[1] = love.graphics.newImage("img/selector/Selector1.png")
	selector.anim[2] = love.graphics.newImage("img/selector/Selector2.png")
	selector.anim[3] = love.graphics.newImage("img/selector/Selector3.png")
	selector.anim[4] = love.graphics.newImage("img/selector/Selector4.png")
	selector.anim[5] = love.graphics.newImage("img/selector/Selector5.png")

	selector.state = 1
	selector.tic = 0
end

function update_selector()
	selector.tic = selector.tic + 1

	if selector.tic >= 15 then
		selector.state = selector.state + 1
		selector.tic = 0

		if selector.state == 6 then
			selector.state = 1
		end
	end

	player.dx = math.floor((player.x + 40)/ 80)
	player.dy = math.floor((player.y + 40)/ 80)



	if player.dx <= 1 then
		player.select_x = 0
		player.select_y = player.dy
	elseif player.dx > 3 and player.dx < 12 and player.dy > 0 and player.dy < 8 then
		if player.state == player.right then
			player.select_y = player.dy
			player.select_x = player.dx + 1
		elseif player.state == player.left then
			player.select_y = player.dy 
			player.select_x = player.dx - 1
		elseif player.state == player.up then
			player.select_y = player.dy - 1
			player.select_x = player.dx
		elseif player.state == player.down then
			player.select_y = player.dy + 1
			player.select_x = player.dx
		end
	elseif player.dx == 3 then
		player.select_x = 4
		player.select_y = player.dy
	elseif player.dx == 12 then
		player.select_x = 11
		player.select_y = player.dy
	elseif player.dy == 0 then
		player.select_y = 1
		player.select_x = player.dx 
	elseif player.dy == 8 then
		player.select_y = 7
		player.select_x = player.dx
	elseif (player.dx == 13 and player.dy == 2) or (player.dx==14 and player.dy >= 1 and player.dy <= 3) or (player.dx == 15 and player.dy == 2) then
		player.select_x = 14
		player.select_y = 2
	elseif (player.dx == 13 and player.dy == 6) or (player.dx==14 and player.dy >= 5 and player.dy <= 7) or (player.dx == 15 and player.dy == 6) then
		player.select_x = 14
		player.select_y = 6
	else
		player.select_x = 1
	end
end

function draw_selector()
	if player.select_x >= 4 and player.select_x <= 11 then
		if player.select_y >= 1 and player.select_y <= 7 then
			love.graphics.draw(selector.anim[selector.state], player.select_x * 80, player.select_y * 80)
		end
	end

	if player.select_x == 0 then
		if seed[player.select_y+1][1] == true then
			love.graphics.draw(selector.anim[selector.state], player.select_x * 80, player.select_y * 80)
		end
	end

	if player.select_x == 14 then
		love.graphics.draw(selector.anim[selector.state], player.select_x * 80, player.select_y * 80)
	end
end