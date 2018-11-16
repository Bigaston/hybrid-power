require("table_function")
require("garden_function")
require("player_function")
require("selector_function")
require("hud_function")
require("seed_function")
require("hybrid_function")

function love.load()
	love.window.setMode(1280, 720)
	love.window.setTitle("Game Off 2018")
	pico8 = love.graphics.newFont("fonts/PICO-8.ttf", 40)
	love.graphics.setFont(pico8)

	background = love.graphics.newImage("img/world.png")
	cars = love.graphics.newImage("img/Cars.png")

	init_hud()
	init_garden()
	init_seed()
	init_selector()
	init_player()
end

function love.update()
	update_player()
	update_seed()
	update_garden()
	update_selector()
	update_hud()
end

function love.draw()
	love.graphics.draw(background, 0, 0)
	draw_garden()
	draw_seed()
	love.graphics.draw(player.state, player.x, player.y)
	love.graphics.draw(cars, 1120, 240)

	draw_selector()
	draw_hud()
end

function love.keypressed(key, scancode, isrepeat)
	if scancode == "space" then
		player_action()
	end
end

function print_box(pText, pX, pY, pCol, pColBox, pCentered)
	if pCentered == true then
		pX = pX-((string.len(pText)*40)/2)
	end

	for i=0,2 do
		for l=0,2 do
			love.graphics.print({pColBox, pText}, i*10+pX, l*10+pY)
		end
	end

	love.graphics.print({pCol, pText}, 10+pX, 10+pY)
end