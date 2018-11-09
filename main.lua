require("table_function")
require("garden_function")
require("player_function")

function love.load()
	love.window.setMode(1280, 720)
	love.window.setTitle("Game Off 2018")

	background = love.graphics.newImage("img/world.png")
	cars = love.graphics.newImage("img/Cars.png")

	init_player()
	init_garden()
end

function love.update()
	update_garden()

	update_player()
end

function love.draw()
	love.graphics.draw(background, 0, 0)
	draw_garden()
	love.graphics.draw(player.state, player.x, player.y)
	love.graphics.draw(cars, 1120, 240)
end