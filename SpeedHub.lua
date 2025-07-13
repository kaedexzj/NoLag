-- EggPetRandomizer.lua
-- Pet Randomizer using QuantumOnyx Spawner API

-- Load Spawner from GitHub
local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua"))()

-- UI buttons
local gui = script.Parent
local espButton = gui:WaitForChild("ESPButton")
local autoButton = gui:WaitForChild("AutoButton")
local onceButton = gui:WaitForChild("OnceButton")

-- Internal state
local pets = Spawner.GetPets()
local espEnabled = false
local autoEnabled = false

-- Function to hatch a pet from an egg
local function hatchRandomPet()
	local chosenPet = pets[math.random(1, #pets)]
	local weight = math.random(1, 5)
	local age = math.random(1, 3)

	Spawner.SpawnEgg("Night Egg") -- or any default egg
	wait(2)
	Spawner.SpawnPet(chosenPet, weight, age)

	print("Hatched:", chosenPet, "- Weight:", weight, "KG - Age:", age)
end

-- ESP Toggle
espButton.Text = "ESP: OFF"
espButton.MouseButton1Click:Connect(function()
	espEnabled = not espEnabled
	espButton.Text = "ESP: " .. (espEnabled and "ON" or "OFF")

	-- Your ESP logic goes here (if needed)
end)

-- Auto Randomizer Toggle (every 15 seconds)
autoButton.Text = "Auto: OFF"
autoButton.MouseButton1Click:Connect(function()
	autoEnabled = not autoEnabled
	autoButton.Text = "Auto: " .. (autoEnabled and "ON" or "OFF")

	if autoEnabled then
		task.spawn(function()
			while autoEnabled do
				hatchRandomPet()
				wait(15)
			end
		end)
	end
end)

-- Randomize Once Button
onceButton.Text = "Randomize Once"
onceButton.MouseButton1Click:Connect(function()
	hatchRandomPet()
end)
