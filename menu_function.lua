function init_menu()
	menu = {}

	menu.score = love.graphics.newImage("img/Score.png")
	menu.disp_score = false
	menu.logo = love.graphics.newImage("img/menu/Logo.png")
	menu.map = love.graphics.newImage("img/menu/menu_world.png")
	menu.select_y = 0
	menu.select_x = 1
	menu.left_arrow = love.graphics.newImage("img/menu/arrow1.png")
	menu.right_arrow = love.graphics.newImage("img/menu/arrow2.png")
	menu.kofi = love.graphics.newImage("img/menu/social1.png")
	menu.github = love.graphics.newImage("img/menu/social2.png")
	menu.twitter = love.graphics.newImage("img/menu/social3.png")
	menu.gamepad = love.graphics.newImage("img/menu/Gamepad_Connected.png")
end

function update_menu()

end

function draw_menu()
	if screen == "menu" then
		draw_main()
	else
		if menu.disp_score == true then
			love.graphics.draw(menu.score, 400, 160)
			print_center(player.score.." points", 640, 290, {0.1019,0.1098,0.1725,1}, 32)
			print_center("Wallet: "..player.wallet.."$", 640, 340, {0.1019,0.1098,0.1725,1}, 32)
		end
	end
end

function draw_main()
	love.graphics.draw(menu.map, 0, 0)
	love.graphics.draw(menu.logo, 384, 40)
	love.graphics.draw(menu.kofi, 10, 620)
	love.graphics.draw(menu.github, 1175, 620)
	love.graphics.draw(menu.twitter, 600, 620)

	print_box("PLAY", 640, 400, {0.1019,0.1098,0.1725,1}, {1,1,1}, true)

	if menu.select_y == 0 then
		love.graphics.draw(menu.left_arrow, 470, 380)
		love.graphics.draw(menu.right_arrow, 720, 380)
	else
		if menu.select_x == 0 then
			love.graphics.draw(menu.right_arrow, 110, 620)
		elseif menu.select_x == 1 then
			love.graphics.draw(menu.left_arrow, 500, 620)
			love.graphics.draw(menu.right_arrow, 700, 620)
		else
			love.graphics.draw(menu.left_arrow, 1075, 620)
		end
	end

	if gamepad ~= nil then
		love.graphics.draw(menu.gamepad, 1200, 0)
	end
end

function menu_action()
	if menu.select_y == 0 then
		reset()
		screen = "game"
	else
		if menu.select_x == 0 then
			love.system.openURL("https://ko-fi.com/Bigaston")
		elseif menu.select_x == 1 then
			love.system.openURL("https://twitter.com/Bigaston")
		elseif menu.select_x == 2 then
			love.system.openURL("https://github.com/Bigaston/hybrid-power")
		end
	end
end