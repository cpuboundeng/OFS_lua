Settings = {}
Settings.Speed = 0.5		-- how much points to add
SetSettings(Settings)

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

function addPoint(duration, position)
	TmpScript:AddActionUnordered((duration*Settings.Speed)+LastAt, position)
	LastAt = (duration*Settings.Speed)+LastAt
	
end


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
--print (LastAt)

addPoint(330, 30)
addPoint(1740,30)
addPoint(200,40)
addPoint(1740,40)
addPoint(260,50)
addPoint(1740,50)
addPoint(400,100)
addPoint(1600,100)
addPoint(400,60)
addPoint(1600,60)
addPoint(330,100)
addPoint(1660,100)
addPoint(400,60)
addPoint(1600,60)
addPoint(400,100)
addPoint(3600,100)
addPoint(400,0)
addPoint(1600,0)



for idx, action in ipairs(TmpScript.actions) do
	print (string.format('Add Point: %s (%s)', action.at, action.pos))	
	CurrentScript:AddActionUnordered(action.at, action.pos, true) -- mark all added actions as selected
end
