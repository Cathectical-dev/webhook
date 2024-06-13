function SendMessage(url, message)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["content"] = message
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent")
end

function SendMessageEMBED(url, embed)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["description"] = embed.description,
                ["color"] = embed.color,
                ["fields"] = embed.fields,
                ["footer"] = {
                    ["text"] = embed.footer.text
                }
            }
        }
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent")
end

-- Example usage
local url = "https://discord.com/api/webhooks/1250868168608448543/JnbIoaXYFbTR98gzTtfiZ6LnwOkB7GhdgXHSKVwVOnh-wP6g1VpJp21iW03vvf3zOflY"
SendMessage(url, "Hello")

local player = game.Players.LocalPlayer
local embed = {
    ["title"] = "Player executed Script",
    ["description"] = "A player has executed the Script, see Information below:",
    ["color"] = 65280,
    ["fields"] = {
        {
            ["name"] = "Username",
            ["value"] = player.Name -- Correctly accessing the local player's username
        },
        {
            ["name"] = "User ID",
            ["value"] = player.UserId -- Correctly accessing the local player's user ID
        }
    },
    ["footer"] = {
        ["text"] = "This is the footer text"
    }
}
SendMessageEMBED(url, embed)
