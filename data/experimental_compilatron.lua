local utils = require 'utils'
local names = require 'names'

local raw = data.raw

local entity_name = names.entities.experimental_compilatron
local item_name = names.items.experimental_compilatron
local recipe_name = names.recipes.experimental_compilatron

local ammo = raw['ammo']['firearm-magazine']
local entity = utils.deepcopy(raw.unit.compilatron)

entity.type = 'unit'
entity.name = entity_name
entity.localised_name = {entity_name}
entity.subgroup = names.subgroups.experimental_units
entity.order = 'i-c'
entity.max_pursue_distance = 32
entity.min_persue_time = 60 * 15
entity.distraction_cooldown = 30
entity.ai_settings = {
    do_separation = true
}
utils.multiply_animation_value(entity.run_animation, 'scale', 10)
utils.scale_area(entity.collision_box, 20)
utils.shift_area(entity.selection_box, {0, 0.4})
utils.scale_area(entity.selection_box, 7)
entity.movement_speed = 0.05
entity.distance_per_frame = 0.15
entity.pollution_to_join_attack = 1000
entity.vision_distance = 40
entity.radar_range = 4
entity.has_belt_immunity = true
entity.healing_per_tick = 50 / 60
entity.max_health = 50000
local animation = entity.attack_parameters.animation
entity.attack_parameters = {
    type = 'beam',
    ammo_category = 'combat-robot-beam',
    damage_modifier = 200,
    cooldown = 1,
    range = 35,
    ammo_type = {
        category = 'combat-robot-beam',
        action = {
            type = 'direct',
            action_delivery = {
                type = 'beam',
                beam = 'electric-beam',
                max_length = 40,
                duration = 5,
                source_offset = {0.15, -0.5}
            }
        }
    },
    animation = animation
}
entity.resistances = {
    {
        type = 'physical',
        decrease = 10,
        percent = 50
    },
    {
        type = 'impact',
        decrease = 50
    },
    {
        type = 'poison',
        percent = 100
    },
    {
        type = 'explosion',
        decrease = 100,
        percent = 25
    },
    {
        type = 'fire',
        decrease = 5,
        percent = 80
    },
    {
        type = 'laser',
        decrease = 10,
        percent = 50
    },
    {
        type = 'acid',
        decrease = 5,
        percent = 95
    },
    {
        type = 'electric',
        decrease = 10,
        percent = 50
    }
}

local item = {
    type = 'item',
    name = item_name,
    localised_name = {item_name},
    icon = entity.icon,
    icon_size = 32,
    flags = {},
    subgroup = names.subgroups.experimental_units,
    order = 'c-' .. item_name,
    stack_size = 10,
    place_result = entity_name
}

local recipe = {
    type = 'recipe',
    name = recipe_name,
    localised_name = {recipe_name},
    category = names.crafting_categories.experimental_units,
    enabled = true,
    ingredients = {
        {'engine-unit', 8},
        {'iron-gear-wheel', 5}
    },
    energy_required = 3,
    result = item_name
}

local technology_name = names.technologies.experimental_units

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

data:extend {entity, item, recipe, category, subgroup}
