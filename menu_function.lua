function init_menu()
	menu = {}

	menu.score = love.graphics.newImage("img/Score.png")
	menu.disp_score = false
end

function update_menu()

end

function draw_menu()
	if menu.disp_score == true then
		love.graphics.draw(menu.score, 400, 160)
		print_center(player.score.." points", 640, 290, {0.1019,0.1098,0.1725,1}, 32)
		print_center("Wallet: "..player.wallet.."$", 640, 340, {0.1019,0.1098,0.1725,1}, 32)
	end
end