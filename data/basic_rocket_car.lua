local utils = require 'utils'
local names = require 'names'

local raw = data.raw

local entity_name = names.entities.basic_rocket_car
local item_name = names.items.basic_rocket_car
local recipe_name = names.recipes.basic_rocket_car

local ammo = raw['ammo']['rocket']
local entity = utils.deepcopy(raw.car.car)
local turret = utils.deepcopy(raw.car.tank.turret_animation)
local animation = utils.combine_base_and_turret(entity.animation, turret, 0.5, {0.18, 0.415})

local icons = {
    {icon = entity.icon, icon_size = 32},
    {icon = ammo.icon, icon_size = 32, scale = 0.5, shift = {-8, 8}}
}

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
    range = 25,
    cooldown = 60,
    projectile_creation_distance = 0.9,
    projectile_center = {0.0, 0.3},
    sound = {
        {
            filename = '__base__/sound/fight/rocket-launcher.ogg',
            volume = 1.0
        }
    },
    ammo_type = {
        category = 'rocket',
        target_type = 'entity',
        action = {
            type = 'direct',
            action_delivery = {
                {
                    type = 'projectile',
                    projectile = 'rocket',
                    starting_speed = 1 / 3,
                    range_deviation = 0.1,
                    max_range = 125 + 3
                },
                {
                    type = 'instant',
                    source_effects = {
                        type = 'create-explosion',
                        entity_name = 'explosion-gunshot'
                    }
                }
            }
        },
        final_action = {
            type = 'direct',
            action_delivery = {
                type = 'instant',
                target_effects = {
                    {
                        type = 'create-entity',
                        entity_name = 'small-scorchmark',
                        check_buildability = true
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
entity.icons = icons
entity.icon = nil

local item = {
    type = 'item',
    name = item_name,
    localised_name = {item_name},
    icons = icons,
    flags = {},
    subgroup = names.subgroups.basic_units,
    order = 'c-c',
    stack_size = 10,
    place_result = entity_name
}

local recipe = {
    type = 'recipe',
    name = recipe_name,
    localised_name = {recipe_name},
    category = names.crafting_categories.basic_units,
    enabled = false,
    ingredients = {
        {'iron-plate', 36},
        {'electronic-circuit', 16},
        {'engine-unit', 12},
        {'rocket-control-unit', 6}
    },
    energy_required = 20,
    result = item_name
}

data:extend {entity, item, recipe}
