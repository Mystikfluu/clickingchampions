local library = loadstring(game:HttpGet(('https://pastebin.com/raw/FsJak6AT')))()
local w = library:CreateWindow("Clicking Champions")
local Pets = w:CreateFolder("Pets")
local Petslist = require(game.ReplicatedStorage.SharedModules.Tables).Pets

Pets:Toggle("Delete common", function(toggle)
  _G.common = toggle
  spawn(function()
    while wait() and _G.common do
    for i, v in pairs(game.Players.LocalPlayer.Pets:GetChildren()) do
      local petname = v.Value
      local rarity = Petslist[petname].rarity
      if(rarity == "Common") then
        local args = {
          [1] = v.Name
        }
        game:GetService("ReplicatedStorage").Events.Server.RequestPetDelete:InvokeServer(unpack(args))
      end
    end
  end
end)
end)
Pets:Toggle("Delete Rare", function(toggle)
_G.Rare = toggle
spawn(function()
  while wait() and _G.Rare do
  for i, v in pairs(game.Players.LocalPlayer.Pets:GetChildren()) do
    local petname = v.Value
    local rarity = Petslist[petname].rarity
    if(rarity == "Rare") then
      local args = {
        [1] = v.Name
      }
      game:GetService("ReplicatedStorage").Events.Server.RequestPetDelete:InvokeServer(unpack(args))
    end
  end
end
end)
end)

Pets:Toggle("Auto craft", function(toggle)
_G.craft = toggle
spawn(function()
while wait(0.1) and _G.craft do
for i, v in pairs(game.Players.LocalPlayer.Pets:GetChildren()) do
  wait()
  local args = {
    [1] = v.Name
  }
  game:GetService("ReplicatedStorage").Events.Server.RequestPetCraft:InvokeServer(unpack(args))
end
end
end)
end)
