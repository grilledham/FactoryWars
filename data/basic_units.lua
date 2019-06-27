local utils = require 'utils'
local names = require 'names'

local raw = data.raw

local entity_name = names.entities.basic_unit_deployer
local item_name = names.items.basic_unit_deployer
local recipe_name = names.recipes.basic_unit_deployer

local scale = 2
local entity = utils.deepcopy(raw['assembling-machine']['assembling-machine-1'])

entity.name = entity_name
entity.localised_name = {entity_name}
utils.multiply_animation_value(entity.animation, 'scale', scale)
utils.scale_area(entity.collision_box, scale)
utils.scale_area(entity.selection_box, scale)
entity.crafting_categories = {names.crafting_categories.basic_units}
entity.crafting_speed = 1
entity.ingredient_count = nil
entity.allowed_effects = nil
entity.module_specification = nil
entity.minable = {result = item_name, mining_time = 1}
entity.flags = {'placeable-neutral', 'player-creation', 'no-automated-item-removal'}
entity.fluid_boxes = {
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
entity.scale_entity_info_icon = true
entity.energy_usage = '400kW'
--[[ entity.energy_source = {
    type = 'electric',
    usage_priority = 'secondary-input',
    emissions_per_minute = 4
} ]]
entity.is_deployer = true

local item = {
    type = 'item',
    name = item_name,
    icon = entity.icon,
    icon_size = entity.icon_size,
    flags = {},
    subgroup = names.subgroups.basic_units,
    order = 'aa' .. item_name,
    place_result = entity_name,
    stack_size = 50
}

local technology_name = names.technologies.basic_units

local category = {
    type = 'recipe-category',
    name = technology_name
}

local subgroup = {
    type = 'item-subgroup',
    name = technology_name,
    group = 'combat',
    order = 'y'
}

local recipe = {
    type = 'recipe',
    name = recipe_name,
    localised_name = {recipe_name},
    enabled = false,
    ingredients = {
        {'iron-plate', 50},
        {'iron-gear-wheel', 80},
        {'iron-stick', 50}
    },
    energy_required = 100,
    result = item_name
}

local technology = {
    type = 'technology',
    name = technology_name,
    localised_name = {technology_name},
    localised_description = '',
    icon_size = entity.icon_size,
    icon = entity.icon,
    effects = {
        {
            type = 'unlock-recipe',
            recipe = item_name
        },
        {
            type = 'unlock-recipe',
            recipe = names.items.basic_gun_car
        }
    },
    unit = {
        count = 25,
        ingredients = {
            {'automation-science-pack', 1}
        },
        time = 30
    },
    prerequisites = {'automation'},
    order = 'y-a'
}

data:extend {
    entity,
    item,
    category,
    subgroup,
    recipe,
    technology
}
