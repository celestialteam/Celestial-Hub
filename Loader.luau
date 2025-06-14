local Games = {
    [139558143435709] = { script = 'Games/RaiseDeveloper-139558143435709.luau' } -- Raise a Developer
}

local LoadQueue = {}

function LoadScript(path: string)
    return loadstring(game:HttpGet(`https://raw.githubusercontent.com/celestialteam/Celestial-Hub/refs/heads/main/{path}`))
end


if Games[game.PlaceId] then
    table.insert(LoadQueue, Games[game.PlaceId].script)
end

table.insert(LoadQueue, 'Universal.luau')


--// rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Celestial Hub",
    Icon = 0,
    LoadingTitle = "github.com/celestialteam",
    LoadingSubtitle = "discord @realestfloriz",
    Theme = "Amethyst",
    ToggleUIKeybind = Enum.KeyCode.RightShift,
    DisableRayfieldPrompts = true,
    DisableBuildWarnings = true,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "celestialteam",
        FileName = "RaiseADev"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

for _, script in LoadQueue do
    LoadScript(script)()(Rayfield, Window)
end