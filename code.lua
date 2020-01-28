-- Place this function into a LocalScript
function developer_product_prompt(message)
	local MarketplaceService = game:GetService("MarketplaceService")
	local Players = game:GetService("Players")
	 
	local productID = 0000000  -- Change this to your developer product ID
	 
	local player = Players.LocalPlayer
	MarketplaceService:PromptProductPurchase(player, productID)
end

-- Place the following code into a Script in ServerScriptService
local MarketplaceService = game:GetService("MarketplaceService")
 
local function processReceipt(receiptInfo)
 
	-- Find the player who made the purchase in the server
	local player = game:GetService("Players"):GetPlayerByUserId(receiptInfo.PlayerId)
	if not player then
		-- The player probably left the game
		-- If they come back, the callback will be called again
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end
 
	-- Output what product they bought
	print(receiptInfo.PlayerId .. " just bought " .. receiptInfo.ProductId)
 
	-- IMPORTANT: Tell Roblox that the game successfully handled the purchase
	return Enum.ProductPurchaseDecision.PurchaseGranted
end
 
-- Set the callback (this can only be done once by one script on the server!)
MarketplaceService.ProcessReceipt = processReceipt

-- Place the following code into the Death Run script in SSS (ServerScriptService)
player.Character.Humanoid.WalkSpeed = 23 -- for runners

player.Character.Humanoid.WalkSpeed = 35 -- for trapper
