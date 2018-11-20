function init_garden()
	garden = array(7,8, {nil, 0})

	flower = {}
	flower.seed = {love.graphics.newImage("img/flower/Flower1.png"), 0}
	flower.state1 = {love.graphics.newImage("img/flower/Flower2.png"), 0}
	flower.state2 = {love.graphics.newImage("img/flower/Flower3.png"), 0}
	flower.red = {love.graphics.newImage("img/flower/Flower4.png"), 5}
	flower.orange = {love.graphics.newImage("img/flower/Flower5.png"), 10}
	flower.yellow = {love.graphics.newImage("img/flower/Flower6.png"), 20}
	flower.purple = {love.graphics.newImage("img/flower/Flower7.png"), 30}
	flower.grey = {love.graphics.newImage("img/flower/Flower8.png"), 50}
	flower.dark_blue = {love.graphics.newImage("img/flower/Flower9.png"),80}
	flower.light_blue = {love.graphics.newImage("img/flower/Flower10.png"), 80}
	flower.blue = {love.graphics.newImage("img/flower/Flower11.png"), 100}
	flower.green = {love.graphics.newImage("img/flower/Flower12.png"), 120}
end

function update_garden()
	for lin=1,7 do
		for col=1,8 do
			if garden[lin][col][1] ~= nil then
				garden[lin][col][2] = garden[lin][col][2] + 1

				if garden[lin][col][2] == 360 then
					execute_hybrid(lin,col)
				end
			end
		end
	end
end

function draw_garden()
	for lin=1,7 do
		for col=1,8 do
			if garden[lin][col][1] ~= nil then
				if garden[lin][col][2] < 60 then
					love.graphics.draw(flower.seed[1], col*80 + 240, lin*80)
				elseif garden[lin][col][2] < 180 then
					love.graphics.draw(flower.state1[1], col*80 + 240, lin*80)
				elseif garden[lin][col][2] < 360 then
					love.graphics.draw(flower.state2[1], col*80 + 240, lin*80)
				else
					love.graphics.draw(garden[lin][col][1][1], col*80 + 240, lin*80)
				end
			end
		end
	end
end

function finish_game()
	for lin=1,7 do
		for col=1,8 do
			if garden[lin][col][1] ~= nil then
				player.score = player.score + garden[lin][col][1][2]
			end
		end
	end

	player.wallet = player.wallet + player.score

	if player.wallet > 9999 then
		player.wallet = 9999
	end

	menu.disp_score = true
	in_game = false
end