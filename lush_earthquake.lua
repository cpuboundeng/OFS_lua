--Settings = {}
-- Settings.Points = 1		-- how much points to add
--SetSettings(Settings)

-- prevent invalid numbers
--Settings.Points = math.floor(clamp(Settings.Points,1,10))

local TmpScript = Funscript:new()
local at1 = -1 		-- first timestamp
local at2 = -1 		-- second timestamp
local pos1 = -1		-- first position
local pos2 = -1 	-- second position
local dt = 0 		--delta timestamp
local dp = 0 		--delta position
local LastPos = 0
local LastAt = 0


for idx, action in ipairs(CurrentScript.actions) do
	if action.selected then
		-- get the current data
		if at1 == -1 then 
			at1 = action.at
			pos1 = action.pos
			LastAt = action.at
		elseif at2 == -1 then
			at2 = action.at
			pos2 = action.pos
			LastAt = action.at
		end  
		--print (at1," ", at2," ", pos1," ", pos2)
		-- if both points are known
		if at1 >= 0 and at2 >= 0 then
			--print (at1," ", at2," ", pos1," ", pos2)			
			-- Use the second point as first point for the next pair
			-- Reset the value of the second point for the next loop
			at1 = at2
			at2 = -1
			pos1 = pos2
			pos2 = -1
		end		
	end
end
print (LastAt)

TmpScript:AddActionUnordered(LastAt, 0)
TmpScript:AddActionUnordered(LastAt+165, 30)
TmpScript:AddActionUnordered(LastAt+165+870, 30)
TmpScript:AddActionUnordered(LastAt+165+870+100, 40)
TmpScript:AddActionUnordered(LastAt+165+870+100+870, 40)
TmpScript:AddActionUnordered(LastAt+165+870+100+870+125, 50)
TmpScript:AddActionUnordered(LastAt+165+870+100+870+125+870, 50)
TmpScript:AddActionUnordered(LastAt+165+870+100+870+125+870+200, 100)
TmpScript:AddActionUnordered(LastAt+165+870+100+870+125+870+200+800, 100)
TmpScript:AddActionUnordered(LastAt+165+870+100+870+125+870+200+800+200, 60)




for idx, action in ipairs(TmpScript.actions) do
	print (string.format('Add Point: %s (%s)', action.at, action.pos))	
	CurrentScript:AddActionUnordered(action.at, action.pos, true) -- mark all added actions as selected
end
