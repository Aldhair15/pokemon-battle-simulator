# Pokemon Battle Simulator

A small turn-based Pokémon battle simulator developed in Lua as a programming portfolio project.

The project was created to practice Lua programming, modular code organization, tables, functions, game logic, randomization, and basic AI decision-making.

## Features

* Turn-based Pokémon battles
* Multiple playable Pokémon
* Multiple moves for each Pokémon
* Pokémon and move types
* Type effectiveness system
* Super effective and not very effective attacks
* Damage calculation based on type effectiveness
* HP management
* Healing system with a success chance
* Enemy AI with different attack and healing probabilities based on its HP
* Win and loss conditions
* Modular Lua files using `require()`

## Project Structure

```text
Pokemon Battle Simulator/
├── main.lua
├── battle.lua
├── pokemon.lua
├── moves.lua
├── effectiveness.lua
├── .gitignore
└── README.md
```

### `main.lua`

Entry point of the application. It initializes the random number generator, loads the required modules, and starts a battle.

### `battle.lua`

Contains the main battle logic, including:

* Attacking
* Damage calculation
* Healing
* Player turns
* Enemy turns
* Enemy decision-making
* Battle victory and defeat conditions

### `pokemon.lua`

Contains the Pokémon data, including their names, HP, types, and available moves.

### `moves.lua`

Contains the available moves and their properties, such as damage and type.

### `effectiveness.lua`

Contains the type effectiveness table used to calculate damage multipliers.

## How to Run

Make sure Lua is installed on your system.

Clone or download the repository and open a terminal in the project directory.

Run:

```bash
lua main.lua
```

The battle will start in the terminal.

## Battle System

During the player's turn, the available moves are displayed along with a healing option.

Attacks calculate their damage based on the move's type and the opponent Pokémon's type.

The current effectiveness system uses:

| Attacking Type | Defending Type | Multiplier |
| -------------- | -------------- | ---------: |
| Fire           | Grass          |         2x |
| Fire           | Water          |       0.5x |
| Grass          | Fire           |       0.5x |
| Grass          | Water          |         2x |
| Water          | Fire           |         2x |
| Water          | Grass          |       0.5x |

Other type combinations currently deal neutral damage (1x).

The enemy uses a simple AI system that changes its probability of attacking or healing depending on its current HP.

## Technologies

* Lua 5.5
* Visual Studio Code
* Git / GitHub

## Future Improvements

Possible improvements for future versions include:

* Replace numeric move references with named identifiers
* Add more Pokémon and moves
* Expand the type effectiveness system
* Add status effects
* Add more advanced enemy AI
* Allow the player to choose their Pokémon
* Add multiple battle modes
* Improve the user interface
* Add additional game mechanics
