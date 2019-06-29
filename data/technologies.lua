local utils = require 'utils'
local names = require 'names'

local raw = data.raw

data:extend {
    {
        type = 'technology',
        name = technology_names.superior_metal_mining,
        localised_name = {technology_names.superior_metal_mining},
        icon_size = 128,
        icon = '__base__/graphics/technology/demo/basic-mining.png',
        effects = {
            {
                type = 'unlock-recipe',
                recipe = t3_name
            }
        },
        unit = {
            count = 1000,
            ingredients = {
                {item_names.basic_science_pack, 1},
                {item_names.advanced_science_pack, 1},
                {item_names.superior_science_pack, 1}
            },
            time = 1
        },
        order = 'a-c',
        prerequisites = {technology_names.advanced_metal_mining, technology_names.superior_science_pack}
    }
}
