function init_hud()
	hud = {}
	hud.box = love.graphics.newImage("img/hud/hud_box.png")
	hud.red = love.graphics.newImage("img/hud/HUD_Flower1.png")
	hud.orange = love.graphics.newImage("img/hud/HUD_Flower2.png")
	hud.yellow = love.graphics.newImage("img/hud/HUD_Flower3.png")
	hud.purple = love.graphics.newImage("img/hud/HUD_Flower4.png")
	hud.grey = love.graphics.newImage("img/hud/HUD_Flower5.png")
	hud.dark_blue = love.graphics.newImage("img/hud/HUD_Flower6.png")
	hud.light_blue = love.graphics.newImage("img/hud/HUD_Flower7.png")
	hud.blue = love.graphics.newImage("img/hud/HUD_Flower8.png")
	hud.green = love.graphics.newImage("img/hud/HUD_Flower9.png")
	hud.explain = love.graphics.newImage("img/Tree.png")
	hud.open_explain = false
end

function update_hud()

end

function draw_hud()
	love.graphics.draw(hud.box, 590, 5)

	if player.in_hand_hud ~= nil then
		love.graphics.draw(player.in_hand_hud, 600, 15)
	end

	if hud.open_explain == true then
		love.graphics.draw(hud.explain, 976, 260)
	end
end