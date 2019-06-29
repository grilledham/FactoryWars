local utils = require 'utils'
local names = require 'names'

local t1_name = names.entities.basic_metal_miner
local t2_name = names.entities.advanced_metal_miner
local t3_name = names.entities.superior_metal_miner

local raw = data.raw

local t1 = utils.deepcopy(raw['mining-drill']['electric-mining-drill'])
t1.name = t1_name
t1.localised_name = {t1_name}
t1.minable = {mining_time = 0.3, result = t1_name}
t1.mining_speed = 2.5
t1.resource_searching_radius = 0.49
t1.drawing_box = {{-1.6, -2.5}, {1.5, 1.6}}
t1.energy_usage = '0.1MW'

local t1_item = utils.deepcopy(raw['item']['electric-mining-drill'])
t1_item.name = t1_name
t1_item.localised_name = {t1_name}
t1_item.place_result = t1_name
t1_item.order = 'a-a'

local t1_recipe = {
    type = 'recipe',
    name = t1_name,
    localised_name = {t1_name},
    enabled = true,
    ingredients = {
        {'iron-gear-wheel', 5},
        {'metal-plate', 10}
    },
    energy_required = 2,
    result = t1_name
}

local t2 = utils.deepcopy(raw['mining-drill']['electric-mining-drill'])
t2.name = t2_name
t2.localised_name = {t2_name}
t2.minable = {mining_time = 0.3, result = t2_name}
t2.mining_speed = 7.5
t2.resource_searching_radius = 0.49
t2.drawing_box = {{-1.6, -2.5}, {1.5, 1.6}}
t2.energy_usage = '1MW'
utils.multiply_animation_value(t2.animations, 'animation_speed', 3)

local t2_item = utils.deepcopy(raw['item']['electric-mining-drill'])
t2_item.name = t2_name
t2_item.localised_name = {t2_name}
t2_item.place_result = t2_name
t2_item.order = 'a-b'

local t2_recipe = {
    type = 'recipe',
    name = t2_name,
    localised_name = {t2_name},
    enabled = true,
    ingredients = {
        {'electronic-circuit', 30},
        {'iron-gear-wheel', 50},
        {'metal-plate', 100}
    },
    energy_required = 2,
    result = t2_name
}

local t3 = utils.deepcopy(raw['mining-drill']['electric-mining-drill'])
t3.name = t3_name
t3.localised_name = {t3_name}
t3.minable = {mining_time = 0.3, result = t3_name}
t3.mining_speed = 22.5
t3.resource_searching_radius = 0.49
t3.drawing_box = {{-1.6, -2.5}, {1.5, 1.6}}
t3.energy_usage = '10MW'
utils.multiply_animation_value(t3.animations, 'animation_speed', 9)

local t3_item = utils.deepcopy(raw['item']['electric-mining-drill'])
t3_item.name = t3_name
t3_item.localised_name = {t3_name}
t3_item.place_result = t3_name
t3_item.order = 'a-c'

local t3_recipe = {
    type = 'recipe',
    name = t3_name,
    localised_name = {t3_name},
    enabled = true,
    ingredients = {
        {'electronic-circuit', 300},
        {'iron-gear-wheel', 500},
        {'metal-plate', 1000}
    },
    energy_required = 2,
    result = t3_name
}

data:extend {t1, t1_item, t1_recipe, t2, t2_item, t2_recipe, t3, t3_item, t3_recipe}
