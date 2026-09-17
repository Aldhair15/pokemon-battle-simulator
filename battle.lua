local effectiveness = require("effectiveness")

local function attack(attacker, defender, moveIndex)

    local move = attacker.moves[moveIndex]
    local multiplier = 1
    local moveEffectiveness = effectiveness[move.type]

    if moveEffectiveness ~= nil then
      if moveEffectiveness[defender.type] ~= nil then
        multiplier = moveEffectiveness[defender.type]
      end
    end

    print(attacker.name .. " Attacks " .. defender.name .. "!")

    if multiplier == 2 then
      print("The move " .. move.name .. " is super effective")
    elseif multiplier == 0.5 then
      print("The move " .. move.name .. " is not very effective")
    else
      print("The move: " .. move.name .. " is normal")
    end

    local damageM = math.floor(multiplier * move.damage)

    print("Move: " .. move.name .. " Dealt " .. damageM .. " damage to " .. defender.name)

    

    defender.hp = math.max(0, defender.hp - damageM)

    

    if defender.hp == 0 then
    print(defender.name .. " has been defeated!")
    else
    print(defender.name .. " now has: " .. defender.hp .. " HP")
    end

end

local function healPokemon(pokemon)
    local healChance = math.random(1,100)
    local hpBefore = pokemon.hp

    if pokemon.hp >= pokemon.maxHp then
      print("The pokemon " .. pokemon.name .. " already has full HP")

     else 

      if healChance <= 70 then
       local randomHeal = math.random(1,100)

       pokemon.hp = math.min(pokemon.maxHp, pokemon.hp + randomHeal)
       local realHeal = pokemon.hp - hpBefore

      print("The Pokemon " .. pokemon.name .." has healed for " .. realHeal .. " of HP")
      print("The Pokemon " .. pokemon.name .. " now has " .. pokemon.hp .. " of HP")

      else
       print("The heal of " .. pokemon.name .. " has failed.")
      end
    end

end

local function playerTurn(playerP,enemy)
  local choice

  print("Choose your move")
  for i = 1 , #playerP.moves do
    print(i .. ". " .. playerP.moves[i].name)
  end
  print( #playerP.moves + 1 .. ". Heal your " .. playerP.name)

  choice = tonumber(io.read())

  while choice == nil or choice < 1 or choice > #playerP.moves + 1 do

    print("Invalid Move")
  
    choice = tonumber(io.read())

  end

  if choice >= 1 and choice <= #playerP.moves then

    attack(playerP, enemy, choice)

    elseif choice == #playerP.moves + 1  then
     if playerP.hp >= playerP.maxHp then
     print("Your " .. playerP.name .." have full HP")
     else  
     healPokemon(playerP)
    end
  end

end

local function chooseAction(attackChance)
  local randomAction = math.random(1,100)

  if randomAction <= attackChance then
    return "attack"
  else
    return "heal"
  end

end

local function enemyTurn(enemy,playerP)

  local randomMove = math.random(1, #enemy.moves)
  local attackChance
 
  if enemy.hp >= enemy.maxHp * 0.90 then
    attackChance = 80
   elseif enemy.hp >= enemy.maxHp * 0.50 then
     attackChance = 50
   elseif enemy.hp >= enemy.maxHp * 0.35 then
      attackChance = 35
   else 
    attackChance = 20
  end

  local action = chooseAction(attackChance)
  
  if action == "attack" then
    attack(enemy, playerP, randomMove)
  else
    healPokemon(enemy)
  end
  
end

local function battleVs(playerP, enemy)

  print("Your pokemon: ".. playerP.name)
  print("HP: ".. playerP.hp)

  print("Enemy Pokemon: ".. enemy.name)
  print ("HP: ".. enemy.hp)

  while playerP.hp > 0 and enemy.hp >0 do
    playerTurn(playerP,enemy)
    if enemy.hp > 0 then
      enemyTurn(enemy,playerP)
    end
  end
  if playerP.hp <= 0 then
    print(enemy.name .. " has won the battle!")

   elseif enemy.hp <= 0 then
    print(playerP.name.. " has won the battle")
  end

end

local battle = {
    attack = attack,
    healPokemon = healPokemon,
    battleVs = battleVs,
    playerTurn = playerTurn,
    enemyTurn = enemyTurn,
    chooseAction = chooseAction
}

return battle