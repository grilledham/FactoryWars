local utils = require 'utils'
local names = require 'names'

local entity_name = names.entities.metal_miner
local item_name = names.items.metal_miner
local recipe_name = names.recipes.metal_miner

local raw = data.raw

local entity = utils.deepcopy(raw['mining-drill']['electric-mining-drill'])
entity.name = entity_name
entity.localised_name = {entity_name}
entity.minable = {mining_time = 0.3, result = item_name}
entity.mining_speed = 1
entity.resource_searching_radius = 0.49
entity.drawing_box = {{-1.6, -2.5}, {1.5, 1.6}}

local item = utils.deepcopy(raw['item']['electric-mining-drill'])
item.name = item_name
item.localised_name = {item_name}
item.place_result = item_name

local recipe = {
    type = 'recipe',
    name = recipe_name,
    localised_name = {recipe_name},
    enabled = true,
    ingredients = {
        {'electronic-circuit', 3},
        {'iron-gear-wheel', 5},
        {'iron-plate', 10}
    },
    energy_required = 2,
    result = item_name
}

data:extend {entity, item, recipe}
