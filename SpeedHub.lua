local Spawner = {}

Spawner.GetPets = function()
    return {"Snail", "Praying Mantis", "Dragonfly", "Giant Ant", "Caterpillar"}
end

Spawner.SpawnPet = function(name, weight, age)
    print("Pet Spawned:", name, "Weight:", weight, "Age:", age)
end

Spawner.SpawnEgg = function(name)
    print("Egg Spawned:", name)
end

Spawner.Load = function()
    print("Default UI Loaded (placeholder)")
end

return Spawner
