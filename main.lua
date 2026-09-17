local battle = require("battle")
local pokemon = require("pokemon")

print("Pokemon Battle Simulator")

math.randomseed(os.time())

battle.battleVs(pokemon[1], pokemon[3])

-- pokemon[1] = charizard
-- pokemon[2] = venusaur
-- pokemon[3] = blastoise