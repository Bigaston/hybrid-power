require("table_function")
require("garden_function")
require("player_function")
require("selector_function")
require("hud_function")
require("seed_function")
require("hybrid_function")
require("menu_function")
require("discord_function")

--[[ TODO

Sauvegardes : https://love2d.org/forums/viewtopic.php?t=77821
Menu principal
Musiques
]]

function reset()
	in_game = true
	player.score = 0
	init_garden()
	menu.disp_score = false
end

function love.load()
	love.window.setMode(1280, 720)
	love.window.setTitle("Hybrid Power")
	pico8 = love.graphics.newFont("fonts/PICO-8.ttf", 32)
	pico8_little = love.graphics.newFont("fonts/PICO-8.ttf", 16)
	love.graphics.setFont(pico8)

	background = love.graphics.newImage("img/world.png")
	cars = love.graphics.newImage("img/Cars.png")


	in_game = true

	init_hud()
	init_garden()
	init_seed()
	init_selector()
	init_player()
	init_menu()
	init_discord()
end

function love.update()
	if in_game == true then
		update_player()
		update_seed()
		update_garden()
		update_selector()
	end

	update_hud()
	update_discord()
end

function love.draw()
	love.graphics.draw(background, 0, 0)
	draw_garden()
	draw_seed()
	love.graphics.draw(player.state, player.x, player.y)
	love.graphics.draw(cars, 1120, 240)

	draw_selector()
	draw_hud()
	draw_menu()
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

function print_center(pText, pX, pY, pCol, pSize)
	pX = pX-((string.len(pText)*pSize)/2)

	love.graphics.print({pCol, pText}, 10+pX, 10+pY)
end

function print_right(pText, pX, pY, pCol, pSize)
	pX = pX-(string.len(pText)*pSize)
	love.graphics.print({pCol, pText}, pX, pY)
end