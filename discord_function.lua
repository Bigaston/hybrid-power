discordRPC = require("lib/discordRPC")
local appId = require("lib/gameID")

function init_discord()
    discordRPC.initialize(appId, true)
    local now = os.time(os.date("*t"))
    presence = {
        details = "Playing Normal Mode",
        startTimestamp = now,
        largeImageKey = "logo"
    }

    nextPresenceUpdate = 0
end

function update_discord()
    if nextPresenceUpdate < love.timer.getTime() then
        presence = {
            details = "Playing Normal Mode",
            startTimestamp = now,
            largeImageKey = "logo"
        }
        discordRPC.updatePresence(presence)
        nextPresenceUpdate = love.timer.getTime() + 2.0
    end
    discordRPC.runCallbacks()
end

function draw_discord()

end