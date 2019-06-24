local utils = require 'utils'
local names = require 'names'

local raw = data.raw
local name = names.deployers.basic_unit_deployer

local machine = utils.deepcopy(raw['assembling-machine']['assembling-machine-1'])

machine.name = name
machine.localised_name = {name}

local scale = 2

utils.multiply_animation_value(machine.animation, 'scale', scale)
utils.scale_area(machine.collision_box, scale)
utils.scale_area(machine.selection_box, scale)
machine.crafting_categories = {name}
machine.crafting_speed = 1
machine.ingredient_count = nil
machine.allowed_effects = {'consumption', 'speed', 'pollution'}
machine.module_specification = {
    module_slots = 1
}
machine.minable = {result = name, mining_time = 1}
machine.flags = {'placeable-neutral', 'player-creation', 'no-automated-item-removal'}
machine.fluid_boxes = {
    {
        production_type = 'output',
        pipe_picture = nil,
        pipe_covers = nil,
        base_area = 1,
        base_level = 1,
        pipe_connections = {{type = 'output', position = {0, -3}}}
    },
    off_when_no_fluid_recipe = false
}
machine.scale_entity_info_icon = true
machine.energy_usage = '400kW'
--[[ machine.energy_source = {
    type = 'electric',
    usage_priority = 'secondary-input',
    emissions_per_minute = 4
} ]]
machine.is_deployer = true

local item = {
    type = 'item',
    name = name,
    icon = machine.icon,
    icon_size = machine.icon_size,
    flags = {},
    subgroup = 'basic-units',
    order = 'aa' .. name,
    place_result = name,
    stack_size = 50
}

local category = {
    type = 'recipe-category',
    name = name
}

local technology_name = names.technologies.basic_units

local subgroup = {
    type = 'item-subgroup',
    name = technology_name,
    group = 'combat',
    order = 'y'
}

local recipe = {
    type = 'recipe',
    name = name,
    localised_name = {name},
    enabled = false,
    ingredients = {
        {'iron-plate', 50},
        {'iron-gear-wheel', 80},
        {'iron-stick', 50}
    },
    energy_required = 100,
    result = name
}

local technology = {
    type = 'technology',
    name = technology_name,
    localised_name = {technology_name},
    localised_description = '',
    icon_size = machine.icon_size,
    icon = machine.icon,
    effects = {
        {
            type = 'unlock-recipe',
            recipe = name
        }
        --[[  {
            type = 'unlock-recipe',
            recipe = names.units.smg_guy
        } ]]
    },
    unit = {
        count = 25,
        ingredients = {
            {'automation-science-pack', 1}
            --{"logistic-science-pack", 1},
        },
        time = 30
    },
    prerequisites = {'automation'},
    order = 'y-a'
}

data:extend {
    machine,
    item,
    category,
    subgroup,
    recipe,
    technology
}
