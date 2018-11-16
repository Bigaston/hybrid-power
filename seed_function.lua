function init_seed()
	seed = {}
	-- unlock, image for seed, image for flower
	seed[1] = {true, love.graphics.newImage("img/seed/seed1.png"), flower.red, hud.red}
	seed[2] = {false, love.graphics.newImage("img/seed/seed2.png"), flower.orange, hud.orange}
	seed[3] = {false, love.graphics.newImage("img/seed/seed3.png"), flower.yellow, hud.yellow}
	seed[4] = {false, love.graphics.newImage("img/seed/seed4.png"), flower.purple, hud.purple}
	seed[5] = {false, love.graphics.newImage("img/seed/seed5.png"), flower.grey, hud.grey}
	seed[6] = {false, love.graphics.newImage("img/seed/seed6.png"), flower.dark_blue, hud.dark_blue}
	seed[7] = {false, love.graphics.newImage("img/seed/seed7.png"), flower.light_blue, hud.light_blue}
	seed[8] = {false, love.graphics.newImage("img/seed/seed8.png"), flower.blue, hud.blue}
	seed[9] = {false, love.graphics.newImage("img/seed/seed9.png"), flower.green, hud.green}
end

function update_seed()

end

function draw_seed()
	for i=1, table.getn(seed) do
		if seed[i][1] == true then
			love.graphics.draw(seed[i][2], 0, (i-1)*80)
		end
	end
end