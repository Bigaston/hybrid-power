local appId = require("lib/gameID")

-- Use discordRPC.lua by Joel Schumacher (see lib/LICENCE.md for more information)

function init_discord()
    discordRPC.initialize(appId, true)
    now = os.time(os.date("*t"))
    presence = {
        details = "In the menu!",
        startTimestamp = now,
        largeImageKey = "logo",
        largeImageText = player.wallet.." in wallet!"
    }

    nextPresenceUpdate = 0
end

function update_discord()
    if screen == "menu" then
        statut = "In the menu!"
    else
        statut = "Playing normal mode!"
    end

    if nextPresenceUpdate < love.timer.getTime() then
        presence = {
            details = statut,
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