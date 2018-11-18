function execute_hybrid(pLin, pCol)
	update_hybrid(pLin-1, pCol)
	update_hybrid(pLin+1, pCol)
	update_hybrid(pLin, pCol-1)
	update_hybrid(pLin, pCol+1)
end

function update_hybrid(pLin, pCol)
	if pLin >= 1 and pLin <= 7 and pCol >= 1 and pCol <= 8 then 
		if garden[pLin][pCol][1] == nil then
			test_flower = {0,0,0,0,0,0,0,0,0}
			if pLin > 1 then
				test_flower = test_case(pLin-1, pCol, test_flower)
			end
		
			if pLin < 7 then
				test_flower = test_case(pLin+1, pCol, test_flower)
			end

			if pCol > 1 then
				test_flower = test_case(pLin, pCol-1, test_flower)
			end

			if pCol < 8 then
				test_flower = test_case(pLin, pCol+1, test_flower)
			end

			plant_hybrid(pLin, pCol, test_flower)
		end
	end
end

function plant_hybrid(pLin, pCol, pTest)
	if pTest[1] >= 2 then
		garden[pLin][pCol] = {flower.orange, 0}
	elseif pTest[2] >= 2 then
		garden[pLin][pCol] = {flower.yellow, 0}
	end
end

function test_case(pLin, pCol, pTest)
	flower_id = {flower.red, flower.orange, flower.yellow, flower.purple, flower.grey, flower.dark_blue, flower.light_blue, flower.blue, flower.green}
	if garden[pLin][pCol][2] >= 360 then
		for i=1,9 do
			if garden[pLin][pCol][1] == flower_id[i] then
				pTest[i] = pTest[i] + 1
			end
		end
	end

	return pTest
end