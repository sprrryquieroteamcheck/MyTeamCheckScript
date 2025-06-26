local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Función para enviar mensaje al chat
local function sendChatMessage(message)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
end

-- Equipos permitidos (Ajusta los nombres exactos si es necesario)
local allowedTeams = {
    ["Assassins"] = true,
    ["Sheriffs"] = true
}

if LocalPlayer.Team and allowedTeams[LocalPlayer.Team.Name] then
    sendChatMessage("✅ Team Check: Estás en el equipo permitido (" .. LocalPlayer.Team.Name .. "). Ejecutando el script...")

    -- Carga el aimbot original desde GitHub
    loadstring(game:HttpGet("https://raw.githubusercontent.com/agresiv111/script/refs/heads/main/main.lua"))()
else
    sendChatMessage("❌ Team Check: No estás en un equipo válido. No se ejecutará el script.")
end
