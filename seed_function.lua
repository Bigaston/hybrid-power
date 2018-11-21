function init_seed()
	seed = {}
	-- unlock, image for seed, image for flower
	seed[1] = {true, love.graphics.newImage("img/seed/seed1.png"), flower.red, hud.red, 0}
	seed[2] = {false, love.graphics.newImage("img/seed/seed2.png"), flower.orange, hud.orange, 20}
	seed[3] = {false, love.graphics.newImage("img/seed/seed3.png"), flower.yellow, hud.yellow, 40}
	seed[4] = {false, love.graphics.newImage("img/seed/seed4.png"), flower.purple, hud.purple, 60}
	seed[5] = {false, love.graphics.newImage("img/seed/seed5.png"), flower.grey, hud.grey, 100}
	seed[6] = {false, love.graphics.newImage("img/seed/seed6.png"), flower.dark_blue, hud.dark_blue, 160}
	seed[7] = {false, love.graphics.newImage("img/seed/seed7.png"), flower.light_blue, hud.light_blue, 160}
	seed[8] = {false, love.graphics.newImage("img/seed/seed8.png"), flower.blue, hud.blue, 200}
	seed[9] = {false, love.graphics.newImage("img/seed/seed9.png"), flower.green, hud.green, 240}
	sign = love.graphics.newImage("img/Sign.png")
end

function update_seed()

end

function draw_seed()
	for i=1, table.getn(seed) do
		if seed[i][1] == true then
			love.graphics.draw(seed[i][2], 0, (i-1)*80)
		end

		if i>1 and seed[i-1][1] == true and seed[i][1] == false then
			love.graphics.draw(sign, 0, (i-1)*80)
			love.graphics.setFont(pico8_little)
			print_center(seed[i][5], 32, (i-1)*80+10, {0.1019,0.1098,0.1725,1}, 16)
			love.graphics.setFont(pico8)
		end
	end
end