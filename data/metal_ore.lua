local utils = require 'utils'
local names = require 'names'

local raw = data.raw

local metal_ore = {
    type = 'resource',
    name = 'metal-ore',
    localised_name = {'metal-ore'},
    flags = {'placeable-neutral'},
    icon = '__base__/graphics/icons/iron-ore.png',
    icon_size = 32,
    map_color = {b = 0.57999999999999998, g = 0.525, r = 0.41499999999999995},
    minable = {
        mining_particle = 'iron-ore-particle',
        mining_time = 1,
        result = 'metal-plate'
    },
    order = 'a-b-b',
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    map_grid = false,
    highlight = true,
    resource_patch_search_radius = 12,
    infinite = true,
    infinite_depletion_amount = 0,
    normal = 100,
    minimum = 100,
    stage_counts = {0},
    stages = {
        sheet = {
            filename = '__base__/graphics/entity/iron-ore/iron-ore.png',
            frame_count = 8,
            priority = 'extra-high',
            size = 64,
            variation_count = 8,
            scale = 4 / 2,
            hr_version = {
                filename = '__base__/graphics/entity/iron-ore/hr-iron-ore.png',
                frame_count = 8,
                priority = 'extra-high',
                size = 128,
                variation_count = 8,
                scale = 4 / 4
            }
        }
    },
    tree_removal_max_distance = 1024,
    tree_removal_probability = 0.8
}

local metal_plate = utils.deepcopy(raw['item']['iron-plate'])
metal_plate.name = 'metal-plate'
metal_plate.localised_name = {'metal-plate'}

data:extend {metal_ore, metal_plate}
