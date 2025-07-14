local Spawner = {}

local pets = {"Snail", "Praying Mantis", "Dragonfly", "Giant Ant", "Caterpillar"}

function Spawner.GetPets()
	return pets
end

function Spawner.SpawnEgg(eggName)
	local egg = Instance.new("Part")
	egg.Name = eggName
	egg.Size = Vector3.new(2, 2, 2)
	egg.Shape = Enum.PartType.Ball
	egg.Position = Vector3.new(0, 10, 0)
	egg.Anchored = true
	egg.BrickColor = BrickColor.Random()
	egg.Parent = workspace
end

function Spawner.SpawnPet(petName, weight, age)
	local pet = Instance.new("Model")
	pet.Name = petName

	local body = Instance.new("Part")
	body.Name = "Body"
	body.Size = Vector3.new(2, 2, 2)
	body.Position = Vector3.new(0, 10, 0)
	body.Anchored = true
	body.Parent = pet

	local nameTag = Instance.new("BillboardGui", body)
	nameTag.Size = UDim2.new(0, 100, 0, 50)
	nameTag.AlwaysOnTop = true

	local label = Instance.new("TextLabel", nameTag)
	label.Size = UDim2.new(1, 0, 1, 0)
	label.Text = petName .. " (" .. weight .. "kg, Age " .. age .. ")"
	label.TextScaled = true
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.new(1, 1, 1)

	pet.Parent = workspace
end

return Spawner
