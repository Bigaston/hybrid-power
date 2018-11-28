-- Save patern : 0000        0 0 0 0 0 0 0 0 
--              Wallet        Seed unlocked

function save_data()
	love.filesystem.write("hybrid.save", create_data())
end

function load_data()
	if love.filesystem.read("hybrid.save") == nil or string.len(love.filesystem.read("hybrid.save"))~=12 then
		love.filesystem.write("hybrid.save", create_data())
	else
		local save_data = love.filesystem.read("hybrid.save")
		player.wallet = tonumber(string.sub(save_data, 1, 4))

		for i=5,12 do
			if string.sub(save_data, i, i)=="1" then
				seed[i-3][1] = true
			end
		end
	end
end

function create_data()
	local data = ""

	local wallet_string = ""..player.wallet

	while string.len(wallet_string) ~= 4 do
		wallet_string = "0"..wallet_string
	end

	data = data..wallet_string

	for i=2,9 do
		if seed[i][1] == true then
			data = data.."1"
		else
			data = data.."0"
		end
	end

	return data
end