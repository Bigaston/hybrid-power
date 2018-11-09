function init_garden()
	garden = array(7,8, {nil, 0})

	flower = {}
	flower.seed = love.graphics.newImage("img/flower/Flower1.png")
	flower.state1 = love.graphics.newImage("img/flower/Flower2.png")
	flower.state2 = love.graphics.newImage("img/flower/Flower3.png")
	flower.red = love.graphics.newImage("img/flower/Flower4.png")
	flower.orange = love.graphics.newImage("img/flower/Flower5.png")
	flower.yellow = love.graphics.newImage("img/flower/Flower6.png")
	flower.purple = love.graphics.newImage("img/flower/Flower7.png")
	flower.grey = love.graphics.newImage("img/flower/Flower8.png")
	flower.dark_blue = love.graphics.newImage("img/flower/Flower9.png")
	flower.light_blue = love.graphics.newImage("img/flower/Flower10.png")
	flower.blue = love.graphics.newImage("img/flower/Flower11.png")
	flower.green = love.graphics.newImage("img/flower/Flower12.png")
end

function update_garden()
	for row=1,7 do
		for col=1,8 do
			if garden[row][col][1] ~= nil then
				garden[row][col][2] = garden[row][col][2] + 1
			end
		end
	end
end

function draw_garden()
	for row=1,7 do
		for col=1,8 do
			if garden[row][col][1] ~= nil then
				if garden[row][col][2] < 60 then
					love.graphics.draw(flower.seed, row*80 + 240, col*80)
				elseif garden[row][col][2] < 180 then
					love.graphics.draw(flower.state1, row*80 + 240, col*80)
				elseif garden[row][col][2] < 360 then
					love.graphics.draw(flower.state2, row*80 + 240, col*80)
				else
					love.graphics.draw(garden[row][col][1], row*80 + 240, col*80)
				end
			end
		end
	end
end