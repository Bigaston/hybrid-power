discordRPC = require("lib/discordRPC")
local appId = require("lib/gameID")

-- Use discordRPC.lua by Joel Schumacher (see lib/LICENCE.md for more information)

function init_discord()
    discordRPC.initialize(appId, true)
    now = os.time(os.date("*t"))
    presence = {
        details = "Playing Normal Mode",
        startTimestamp = now,
        largeImageKey = "logo",
        largeImageText = player.wallet.." in wallet!"
    }

    nextPresenceUpdate = 0
end

function update_discord()
    if nextPresenceUpdate < love.timer.getTime() then
        presence = {
            details = "Playing Normal Mode",
            largeImageKey = "logo",
            startTimestamp = now,
            largeImageText = player.wallet.." in wallet!"
        }
        discordRPC.updatePresence(presence)
        nextPresenceUpdate = love.timer.getTime() + 2.0
    end
    discordRPC.runCallbacks()
end

function draw_discord()

end