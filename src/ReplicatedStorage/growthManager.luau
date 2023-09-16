local GrowthManager = {}

local growthChancePerSec = 0.1


function GrowthManager:run(deltaTime)
	
	local tiles = _G.GameData.tiles
	
	--Ignora se o tile estiver no estagio maximo
	for _,tile in tiles do
		
		if tile:isComplete() then
			continue
		end
		
		--Calcular a chance de crescimento
		local chance = growthChancePerSec * deltaTime
		if math.random() > chance then
			continue
		end
		
		--cresce
		tile:setStage(tile.stage + 1)
		
		
	end
	
end

return GrowthManager
