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

local entity_name = names.entities.basic_flame_car
local item_name = names.items.basic_flame_car
local recipe_name = names.recipes.basic_flame_car

local ammo = raw['ammo']['flamethrower-ammo']
local entity = utils.deepcopy(raw.car.car)
local turret = fireutil.flamethrower_prepared_animation({attacking = true})

local icons = {
    {icon = entity.icon, icon_size = 32},
    {icon = ammo.icon, icon_size = 32, scale = 0.5, shift = {-8, 8}}
}

local animation = utils.combine_base_and_turret(entity.animation, turret, 0.5, {0.0, 0.0})

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
    type = 'stream',
    ammo_category = 'flamethrower',
    cooldown = 1,
    projectile_creation_distance = 0.6,
    gun_barrel_length = 1.4,
    gun_center_shift = {-0.17, -1.15},
    range = 9,
    min_range = 3,
    cyclic_sound = {
        begin_sound = {
            {
                filename = '__base__/sound/fight/flamethrower-start.ogg',
                volume = 1
            }
        },
        middle_sound = {
            {
                filename = '__base__/sound/fight/flamethrower-mid.ogg',
                volume = 1
            }
        },
        end_sound = {
            {
                filename = '__base__/sound/fight/flamethrower-end.ogg',
                volume = 1
            }
        }
    },
    ammo_type = {
        category = 'flamethrower',
        target_type = 'position',
        clamp_position = true,
        action = {
            type = 'direct',
            action_delivery = {
                type = 'stream',
                stream = 'tank-flamethrower-fire-stream',
                max_length = 9,
                duration = 1
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
    order = 'c-b',
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
        {'flamethrower-ammo', 6}
    },
    energy_required = 2,
    result = item_name
}

data:extend {entity, item, recipe}
