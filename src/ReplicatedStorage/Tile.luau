local class = require(game.ReplicatedStorage.middleclass)

local Tile = class("Tile")
local MAX_STAGE = 2

local stages = {
	game.ReplicatedStorage.prefab.STAGE1,
	game.ReplicatedStorage.prefab.STAGE2
}

--Construtor
function Tile:initialize(instance)
	self.stage = 0
	self.position = instance.Position
	self.model = nil
end

function Tile:isComplete()
	return self.stage >= MAX_STAGE
end

function Tile:setStage(stage)
	self.stage = stage
	

	if(self.model ~= nil) then
		self.model:Destroy()
		self.model = nil
	end
	
	--mudando o modelo
	if self.stage > 0 then
		local prefab = stages[self.stage]
		local model = prefab:Clone()
		model.Parent = game.Workspace
		model:TranslateBy(self.position - model:GetPrimaryPartCFrame().p)
		self.model = model	
	
	if self.stage == MAX_STAGE then
		model.ClickDetector.MouseClick:Connect(function()
			self:setStage(0)
			_G.GameData.coins += 1
			print("Colheita Feita")
		end)
		end
	end
	
end

return Tile