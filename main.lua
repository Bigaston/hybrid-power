require("table_function")
require("garden_function")
require("player_function")
require("selector_function")
require("hud_function")
require("seed_function")
require("hybrid_function")
require("menu_function")
require("discord_function")
require("save_function")
require("back_function")
discordRPC = require("lib/discordRPC")

--[[
NEW SOUND EFFECT
- Start menu x
- Unlock seed x
- Grab seed x
- Rake & endgame x
- Sign info open x
- sign info close x
- New hyrid x
]]

function reset()
	in_game = true
	player.score = 0
	player.x = 960
	player.y = 240
	player.in_hand = nil
	player.in_hand_hud = nil
	menu.disp_score = false
	disp_back = false

	for lin=1,7 do
		for col=1,8 do
			garden[lin][col] = {nil, 0}
		end
	end
end

function love.load()
	pico8 = love.graphics.newFont("fonts/PICO-8.ttf", 32)
	pico8_little = love.graphics.newFont("fonts/PICO-8.ttf", 16)
	love.graphics.setFont(pico8)

	background = love.graphics.newImage("img/world.png")
	cars = love.graphics.newImage("img/Cars.png")

	in_game = true
	screen = "menu"

	gamepad = nil

	init_hud()
	init_garden()
	init_seed()
	init_selector()
	init_player()
	init_menu()

	if have_discord then
		init_discord()
	end

	load_data()
	init_back()

	music = love.audio.newSource("sound/theme.wav", "stream")
	music:setLooping(true)
	music:play()

	sound = {}
	sound.move_menu = love.audio.newSource("sound/menu_move.wav", "stream")
	sound.plant = love.audio.newSource("sound/plant.wav", "stream")
	sound.end_game = love.audio.newSource("sound/end_game.wav", "stream")
	sound.grab_seed = love.audio.newSource("sound/end_game.wav", "stream")
end

function love.update()
	update_menu()

	if gamepad ~= nil then
		update_joystick()
	end

	if screen == "menu" then
		if have_discord then
			update_discord()
		end
	else
		if in_game == true and disp_back == false then
			update_player()
			update_seed()
			update_garden()
			update_selector()
		end

		update_hud()
		if have_discord then
			update_discord()
		end
	end
end

function love.draw()
	if screen == "game" then
		love.graphics.draw(background, 0, 0)
		draw_garden()
		draw_seed()
		love.graphics.draw(player.state, player.x, player.y)
		love.graphics.draw(cars, 1120, 240)

		draw_selector()
		draw_hud()
		draw_back()
	end
	draw_menu()
end

function love.keypressed(key, scancode, isrepeat)
	if scancode == "space" then
		if screen == "menu" then
			menu_action()
			-- menu play
		else
			if disp_back == true then
				save_data()
				screen = "menu"
				reset()
				sound.move_menu:play()
			else
				player_action()				
			end
		end
	end

	if key == "escape" and screen == "game" and in_game == true then
		sound.move_menu:play()
		update_back()
	end

	if screen == "menu" then
		if scancode == "down" then
			menu.select_y = menu.select_y + 1
			sound.move_menu:play()
		end

		if scancode == "up" then
			menu.select_y = menu.select_y - 1
			sound.move_menu:play()
		end

		if scancode == "left" then
			menu.select_x = menu.select_x - 1
			sound.move_menu:play()
		end

		if scancode == "right" then
			menu.select_x = menu.select_x + 1
			sound.move_menu:play()
		end

		if menu.select_y < 0 then menu.select_y = 0 end
		if menu.select_y > 1 then menu.select_y = 1 end
		if menu.select_x < 0 then menu.select_x = 0 end
		if menu.select_x > 2 then menu.select_x = 2 end 
	end
end

function love.gamepadpressed(joystick, button)
	if gamepad == nil then
		gamepad = joystick
		joy_tic = 0
	else
		if button == "a" then
			if screen == "menu" then
				menu_action()
				-- menu play
			else
				if disp_back == true then
					save_data()
					screen = "menu"
					reset()
					sound.move_menu:play()
				else
					player_action()				
				end
			end
		end

		if button == "start" and screen == "game" and in_game == true then
			update_back()
			sound.move_menu:play()
		end
	end
end

function update_joystick()
	axis_x, axis_y = gamepad:getAxes()

	if joy_tic == 0 then
		if screen == "menu" then
			if axis_x < -0.5 then
				menu.select_x = menu.select_x - 1
				joy_tic = 15
				sound.move_menu:play()
			end

			if axis_x > 0.5 then
				menu.select_x = menu.select_x + 1
				joy_tic = 15
				sound.move_menu:play()
			end

			if axis_y < -0.5 then
				menu.select_y = menu.select_y - 1
				joy_tic = 15
				sound.move_menu:play()
			end

			if axis_y > 0.5 then
				menu.select_y = menu.select_y + 1
				joy_tic = 15	
				sound.move_menu:play()
			end

			if menu.select_y < 0 then menu.select_y = 0 end
			if menu.select_y > 1 then menu.select_y = 1 end
			if menu.select_x < 0 then menu.select_x = 0 end
			if menu.select_x > 2 then menu.select_x = 2 end 
		elseif in_game == true and disp_back == false then
			if axis_x < -0.5 then
				player.x = player.x - 4
				player.state = player.left
			end

			if axis_x > 0.5 then
				player.x = player.x + 4
				player.state = player.right
			end

			if axis_y < -0.5 then
				player.y = player.y - 4
				player.state = player.up
			end

			if axis_y > 0.5 then
				player.y = player.y + 4
				player.state = player.down
			end

			if player.x < 0 then player.x = 0 end
			if player.x > 1200 then player.x = 1200 end
			if player.y < 0 then player.y = 0 end
			if player.y > 640 then player.y = 640 end
		end
	elseif joy_tic ~= nil then
		joy_tic = joy_tic - 1
	end
end

function print_box(pText, pX, pY, pCol, pColBox, pCentered)
	if pCentered == true then
		pX = pX-((string.len(pText)*32)/2)
	end

	for i=0,2 do
		for l=0,2 do
			love.graphics.print({pColBox, pText}, i*8+pX, l*8+pY)
		end
	end

	love.graphics.print({pCol, pText}, 8+pX, 8+pY)
end

function print_center(pText, pX, pY, pCol, pSize)
	pX = pX-((string.len(pText)*pSize)/2)

	love.graphics.print({pCol, pText}, 10+pX, 10+pY)
end

function print_right(pText, pX, pY, pCol, pSize)
	pX = pX-(string.len(pText)*pSize)
	love.graphics.print({pCol, pText}, pX, pY)
end

function love.quit()
	save_data()
end