local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function sendChatMessage(message)
    local success, err = pcall(function()
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
    end)
    if not success then
        warn("[TeamCheck Error]: "..err)
    end
end

sendChatMessage("✅ Team Check iniciado...")

local allowedTeams = {
    ["Assassins"] = true,
    ["Sheriffs"] = true
}

if LocalPlayer.Team and allowedTeams[LocalPlayer.Team.Name] then
    sendChatMessage("✅ Estás en el equipo correcto: " .. LocalPlayer.Team.Name .. ". Cargando el aimbot...")

    -- Cargar el aimbot original desde GitHub
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/agresiv111/script/refs/heads/main/main.lua"))()
    end)

    if not success then
        sendChatMessage("❌ Error al cargar el script externo: "..tostring(err))
    end
else
    sendChatMessage("❌ No estás en un equipo permitido. El aimbot no se ejecutará.")
end
