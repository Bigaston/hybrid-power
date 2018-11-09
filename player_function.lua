function init_player()
	player = {}
	player.x = 960
	player.y = 240
	player.left = love.graphics.newImage("img/player/Player1.png")
	player.right = love.graphics.newImage("img/player/Player2.png")
	player.up = love.graphics.newImage("img/player/Player3.png")
	player.down = love.graphics.newImage("img/player/Player4.png")
	player.state = player.left
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