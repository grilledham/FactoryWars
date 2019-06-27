local fireutil = {}

local function make_color(r_, g_, b_, a_)
    return {r = r_ * a_, g = g_ * a_, b = b_ * a_, a = a_}
end

function fireutil.foreach(table_, fun_)
    for _, tab in pairs(table_) do
        fun_(tab)
        if tab.hr_version then
            fun_(tab.hr_version)
        end
    end
    return table_
end

function fireutil.flamethrower_turret_prepared_animation(shft, opts)
    local diffuse_layer = {
        filename = '__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun.png',
        priority = 'medium',
        counterclockwise = false,
        line_length = 8,
        width = 82,
        height = 66,
        frame_count = 1,
        axially_symmetrical = false,
        direction_count = 64,
        shift = util.by_pixel(-2, -26),
        hr_version = {
            filename = '__base__/graphics/entity/flamethrower-turret/hr-flamethrower-turret-gun.png',
            priority = 'medium',
            counterclockwise = false,
            line_length = 8,
            width = 158,
            height = 128,
            frame_count = 1,
            axially_symmetrical = true,
            direction_count = 64,
            shift = util.by_pixel(-1, -25),
            scale = 0.5,
            repeat_count = nil
        }
    }
    local glow_layer = {
        filename = '__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-active.png',
        counterclockwise = false,
        line_length = 8,
        width = 82,
        height = 66,
        frame_count = 1,
        axially_symmetrical = false,
        direction_count = 64,
        shift = util.by_pixel(-2, -26),
        tint = make_color(1, 1, 1, 0.5),
        blend_mode = 'additive',
        hr_version = {
            filename = '__base__/graphics/entity/flamethrower-turret/hr-flamethrower-turret-gun-active.png',
            counterclockwise = false,
            line_length = 8,
            width = 158,
            height = 126,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 64,
            shift = util.by_pixel(-1, -25),
            tint = make_color(1, 1, 1, 0.5),
            blend_mode = 'additive',
            scale = 0.5,
            repeat_count = nil
        }
    }
    local mask_layer = {
        filename = '__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-mask.png',
        flags = {'mask'},
        counterclockwise = false,
        line_length = 8,
        width = 74,
        height = 56,
        frame_count = 1,
        axially_symmetrical = false,
        direction_count = 64,
        shift = util.by_pixel(-2, -28),
        apply_runtime_tint = true,
        hr_version = {
            filename = '__base__/graphics/entity/flamethrower-turret/hr-flamethrower-turret-gun-mask.png',
            flags = {'mask'},
            counterclockwise = false,
            line_length = 8,
            width = 144,
            height = 112,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 64,
            shift = util.by_pixel(-1, -28),
            apply_runtime_tint = true,
            scale = 0.5,
            repeat_count = nil
        }
    }
    local shadow_layer = {
        filename = '__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-shadow.png',
        counterclockwise = false,
        line_length = 8,
        width = 90,
        height = 56,
        frame_count = 1,
        axially_symmetrical = false,
        direction_count = 64,
        shift = util.by_pixel(32, 0),
        draw_as_shadow = true,
        hr_version = {
            filename = '__base__/graphics/entity/flamethrower-turret/hr-flamethrower-turret-gun-shadow.png',
            counterclockwise = false,
            line_length = 8,
            width = 182,
            height = 116,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 64,
            shift = util.by_pixel(31, -1),
            draw_as_shadow = true,
            scale = 0.5,
            repeat_count = nil
        }
    }

    local ret_layers =
        opts and opts.attacking and {diffuse_layer, glow_layer, mask_layer, shadow_layer} or
        {diffuse_layer, mask_layer, shadow_layer}

    return {
        layers = fireutil.foreach(
            ret_layers,
            function(tab)
                if tab.shift then
                    tab.shift = {tab.shift[1] + shft[1], tab.shift[2] + shft[2]}
                end
            end
        )
    }
end

function fireutil.flamethrower_prepared_animation(opts)
    return fireutil.flamethrower_turret_prepared_animation(fireutil.turret_gun_shift.north, opts)
    --[[  east = fireutil.flamethrower_turret_prepared_animation(fireutil.turret_gun_shift.east, opts),
        south = fireutil.flamethrower_turret_prepared_animation(fireutil.turret_gun_shift.south, opts),
        west = fireutil.flamethrower_turret_prepared_animation(fireutil.turret_gun_shift.west, opts) ]]
end

fireutil.turret_gun_shift = {
    north = util.by_pixel(0.0, -6.0),
    east = util.by_pixel(18.5, 9.5),
    south = util.by_pixel(0.0, 19.0),
    west = util.by_pixel(-12.0, 5.5)
}

local utils = require 'utils'
local names = require 'names'

local raw = data.raw
local name = names.units.basic_toxic_car

local unit = utils.deepcopy(raw.car.car)
local turret = fireutil.flamethrower_prepared_animation({attacking = true})

local animation = utils.combine_base_and_turret(unit.animation, turret, 0.5, {0.0, 0.0})

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
