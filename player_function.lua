function init_player()
	player = {}
	player.x = 960
	player.y = 240
	player.select_x = 1
	player.select_y = 1
	player.dx = 0
	player.dy = 0
	player.left = love.graphics.newImage("img/player/Player1.png")
	player.right = love.graphics.newImage("img/player/Player2.png")
	player.up = love.graphics.newImage("img/player/Player3.png")
	player.down = love.graphics.newImage("img/player/Player4.png")
	player.state = player.left
	player.in_hand = nil
	player.in_hand_hud = nil
	player.score = 0
end

function update_player()
	if love.keyboard.isScancodeDown("a", "left") then
		player.x = player.x - 4
		player.state = player.left
	end

	if love.keyboard.isScancodeDown("d", "right") then
		player.x = player.x + 4
		player.state = player.right
	end

	if love.keyboard.isScancodeDown("w", "up") then
		player.y = player.y - 4
		player.state = player.up
	end

	if love.keyboard.isScancodeDown("s", "down") then
		player.y = player.y + 4
		player.state = player.down
	end

	if player.x < 0 then player.x = 0 end
	if player.x > 1200 then player.x = 1200 end
	if player.y < 0 then player.y = 0 end
	if player.y > 640 then player.y = 640 end
end

function player_action()
	if player.select_x == 0 then
		if seed[player.select_y+1][1] == true then
			player.in_hand = seed[player.select_y+1][3]
			player.in_hand_hud = seed[player.select_y+1][4]
		end
	elseif player.select_x >= 4 and player.select_x <= 11 then
		if player.select_y >= 1 and player.select_y <= 7 then
			if garden[player.select_y][player.select_x-3][1] == nil then
				garden[player.select_y][player.select_x-3] = {player.in_hand, 0}
				player.in_hand = nil
				player.in_hand_hud = nil
			else
				if garden[player.select_y][player.select_x-3][2] >= 360 then
					player.score = player.score + garden[player.select_y][player.select_x-3][1][2]
				end
				garden[player.select_y][player.select_x-3][1] = nil
			end
		end
	end
end