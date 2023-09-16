print("Hello World")
_G.GameData = require(game.ReplicatedStorage.gameData)

local Tile = require(game.ReplicatedStorage.Tile)
local GrowthManager = require(game.ReplicatedStorage.growthManager)

local RunService = game:GetService("RunService")

local tiles = {}

RunService.RenderStepped:Wait(workspace.Tiles:WaitForChild("Tile"))
local tilesChildrens = workspace.Tiles:GetChildren()

for _, tileInstance in tilesChildrens do
	local myTile = Tile:new(tileInstance)
	table.insert(_G.GameData.tiles,myTile)
end

--GrowthManager:run(deltaTime)
RunService.Heartbeat:Connect(function(deltaTime)
	GrowthManager:run(deltaTime)
end)