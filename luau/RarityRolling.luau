--Rarity Rolling Is an advanced, widely used concept in roblox games.

--But it is done differently than you would expect.

-- This script is supposed to go in a modulescript under a script in game. 

--_______________________________________________________________________________________ MODULESCRIPT
local module = {}

local parts = {
	["Legendary"] = game.ServerStorage.Legendary,
	["Epic"] = game.ServerStorage.Epic,
	["Rare"] = game.ServerStorage.Rare,
	["Common"] = game.ServerStorage.Common
} -- Define some parts ( WILL NOT WORK IN YOUR GAME AUTOMATICALLY )
local rarities = {
	["Legendary"] = 1,
	["Epic"] = 15,
	["Rare"] = 30,
	["Common"] = 54
} -- Define your rarities in % chances (You can mess with this, it shouldnt mess anything up)

function roll()
  local totalnum = 0 -- Sum of all rarities
  
  for _, rarity in rarities do -- get all rarities to add to sum
    totalnum += rarity -- add rarity to sum
  end -- Get the total sum of all of the percentages so that you can make things as rare as u want :)
  
	local num = math.random(1, totalnum) -- Number to start on, makes the rarities more realistic to get.
	local count = 0 -- Define what will decide what you get.
	local found = false -- Make sure you dont mess anything up lol
	
	for rarity, weight in rarities do
		count += weight
		if num <= count then -- Checks if your number is less than count for more realistic chances.
      if parts[rarity] ~= nil then
  			found = true -- make sure it doesnt automatically make your part common if it finds the part
  			return parts[rarity] -- return part
      end
		end
	end
	
	if found ~= true then -- Make sure to return a part incase something goes wrong.
		return parts["Common"]
	end
end

print(roll) -- Tells you the rarity in console.
module.roll = roll -- Make sure your serverscript can read the part/rarity.
--________________________________________________________________________________________


-- this is the script that will visualize your rarities/spawn them (AND RUN YOUR MODULESCRIPT)
--________________________________________________________________________________________ ServerScript/ NOT A LOCALSCRIPT with the modulescript beneath it.
local module = require(script.ModuleScript) -- Run your module

while wait(0.1) do
	local newpart = module.roll():Clone() -- Get the part
	if newpart then -- Make sure part exists
		newpart.Parent = workspace -- Spawn it in workspace.
	end
end
--________________________________________________________________________________________ 
