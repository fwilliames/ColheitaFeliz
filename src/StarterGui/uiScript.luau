local RunService = game:GetService("RunService")

local gameGui = script.Parent.GameGUI
local coinsLabel = gameGui.CoinsLabel

local lastCoins = -1

local function updateUI(deltaTime)
	local currentCoins = _G.GameData.coins
	
	if lastCoins ~= currentCoins then
		lastCoins = currentCoins
		local text = `Coins: {currentCoins}`
		coinsLabel.Text = text
	end
end

RunService.Heartbeat:Connect(updateUI)