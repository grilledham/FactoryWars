local utils = require 'utils'
local names = require 'names'

local raw = data.raw
local name = names.units.basic_rocket_car

local unit = utils.deepcopy(raw.car.car)
local turret = utils.deepcopy(raw.car.tank.turret_animation)
local animation = utils.combine_base_and_turret(unit.animation, turret, 0.5, {0.18, 0.415})

unit.type = 'unit'
unit.name = name
unit.localised_name = {name}
unit.subgroup = names.subgroups.basic_units
unit.order = 'i-c'
unit.max_pursue_distance = 64
unit.min_persue_time = 60 * 15
unit.distraction_cooldown = 30
unit.ai_settings = {
    do_separation = true
}
unit.run_animation = animation
unit.attack_parameters = {
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

unit.movement_speed = 0.35
unit.distance_per_frame = 0.15
unit.pollution_to_join_attack = 1000
unit.vision_distance = 40
unit.radar_range = 2
unit.has_belt_immunity = true

local item = {
    type = 'item',
    name = name,
    localised_name = {name},
    icon = unit.icon,
    icon_size = unit.icon_size,
    flags = {},
    subgroup = names.subgroups.basic_units,
    order = 'c-' .. name,
    stack_size = 10,
    place_result = name
}

local recipe = {
    type = 'recipe',
    name = name,
    localised_name = {name},
    category = names.deployers.basic_unit_deployer,
    enabled = true,
    ingredients = {
        {'engine-unit', 8},
        {'iron-gear-wheel', 5},
        {'solid-fuel', 15}
    },
    energy_required = 20,
    result = name
}

data:extend {unit, item, recipe}
