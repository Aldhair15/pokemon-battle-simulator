local moves = require("moves")

local charizard = {
    name = "Charizard",
    hp = 250,
    maxHp = 250,
    type = "Fire",
    moves = {
      moves[1],
      moves[2],
      moves[3],
      moves[10]
    }
}

local venusaur = {
    name= "Venusaur",
    hp = 280,
    maxHp = 280,
    type = "Grass",
    moves = {
        moves[4],
        moves[5],
        moves[6]
    }
}

local blastoise = {
    name = "Blastoise",
    hp = 300,
    maxHp = 300,
    type ="Water",
    moves = {
      moves[7],
      moves[8],
      moves[9]
    }
}

local pokemon = {
    charizard,
    venusaur,
    blastoise
}

return pokemon