local utils = require 'utils'
local names = require 'names'

local raw = data.raw

local entity_name = names.entities.basic_gun_car
local item_name = names.items.basic_gun_car
local recipe_name = names.recipes.basic_gun_car

local ammo = raw['ammo']['firearm-magazine']
local entity = utils.deepcopy(raw.car.car)
local animation = utils.combine_base_and_turret(entity.animation, entity.turret_animation)

entity.type = 'unit'
entity.name = entity_name
entity.localised_name = {entity_name}
entity.subgroup = names.subgroups.basic_units
entity.order = 'i-c'
entity.max_pursue_distance = 64
entity.min_persue_time = 60 * 15
entity.distraction_cooldown = 30
entity.ai_settings = {
    do_separation = true
}
entity.run_animation = animation
entity.attack_parameters = {
    type = 'projectile',
    range = 18,
    cooldown = 10,
    projectile_creation_distance = 0.65,
    ammo_type = {
        category = 'bullet',
        action = {
            type = 'direct',
            action_delivery = {
                type = 'instant',
                source_effects = {
                    type = 'create-explosion',
                    entity_name = 'explosion-gunshot'
                },
                target_effects = {
                    {
                        type = 'create-entity',
                        entity_name = 'explosion-hit'
                    },
                    {
                        type = 'damage',
                        damage = {amount = 5, type = 'physical'}
                    }
                }
            }
        }
    },
    animation = animation
}

entity.movement_speed = 0.35
entity.distance_per_frame = 0.15
entity.pollution_to_join_attack = 1000
entity.vision_distance = 40
entity.radar_range = 2
entity.has_belt_immunity = true

local icons = {
    {icon = entity.icon, icon_size = 32},
    {icon = ammo.icon, icon_size = 32, scale = 0.5, shift = {-8, 8}}
}

local item = {
    type = 'item',
    name = item_name,
    localised_name = {item_name},
    icons = icons,
    flags = {},
    subgroup = names.subgroups.basic_units,
    order = 'c-' .. item_name,
    stack_size = 10,
    place_result = entity_name
}

local recipe = {
    type = 'recipe',
    name = recipe_name,
    localised_name = {recipe_name},
    category = names.crafting_categories.basic_units,
    enabled = true,
    ingredients = {
        {'engine-unit', 8},
        {'iron-gear-wheel', 5}
    },
    energy_required = 3,
    result = item_name
}

data:extend {entity, item, recipe}
