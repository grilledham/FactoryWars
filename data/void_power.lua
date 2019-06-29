local utils = require 'utils'
local names = require 'names'

local void_fuel_name = names.items.void_fuel
local t1_name = names.entities.basic_void_generator
local t2_name = names.entities.advanced_void_generator
local t3_name = names.entities.superior_void_generator

local raw = data.raw

local reactor = raw['reactor']['nuclear-reactor']
local small_meltdown = utils.deepcopy(reactor.meltdown_action)
local target_effects = small_meltdown.action_delivery.target_effects
target_effects[1].repeat_count = 10
target_effects[1].speed_from_center = 0.05
target_effects[5].action.repeat_count = 200
target_effects[5].action.radius = 5

local category = {
    type = 'fuel-category',
    name = 'void'
}

local void_fuel = {
    type = 'item',
    name = void_fuel_name,
    localised_name = {void_fuel_name},
    stack_size = 1,
    icon = '__core__/graphics/clear.png',
    icon_size = 128,
    flags = {'hidden'},
    fuel_category = 'void',
    fuel_value = math.huge .. 'YJ'
}

local t1 = utils.deepcopy(raw['generator']['steam-engine'])
t1.name = t1_name
t1.localised_name = {t1_name}
t1.fluid_usage_per_tick = nil
t1.fluid_box = nil
t1.maximum_temperature = nil
t1.burner = {
    fuel_inventory_size = 1,
    fuel_category = 'void'
}
t1.max_power_output = '1MW'
t1.minable = {mining_time = 0.3, result = t1_name}

local t1_item = {
    type = 'item',
    name = t1_name,
    localised_name = {t1_name},
    icon = t1.icon,
    icon_size = 32,
    flags = {},
    subgroup = 'energy',
    order = 'c-a',
    stack_size = 10,
    place_result = t1_name
}

local t1_recipe = {
    type = 'recipe',
    name = t1_name,
    localised_name = {t1_name},
    enabled = true,
    ingredients = {
        {'metal-plate', 10},
        {'iron-gear-wheel', 5}
    },
    energy_required = 3,
    result = t1_name
}

local t2 = utils.deepcopy(raw['generator']['steam-turbine'])
t2.name = t2_name
t2.localised_name = {t2_name}
t2.fluid_usage_per_tick = nil
t2.fluid_box = nil
t2.maximum_temperature = nil
t2.burner = {
    fuel_inventory_size = 1,
    fuel_category = 'void'
}
t2.max_power_output = '25MW'
t2.minable = {mining_time = 0.3, result = t2_name}
t2.dying_explosion = nil
t2.dying_trigger_effect = {type = 'nested-result', action = small_meltdown}

local t2_item = {
    type = 'item',
    name = t2_name,
    localised_name = {t2_name},
    icon = t2.icon,
    icon_size = 32,
    flags = {},
    subgroup = 'energy',
    order = 'c-b',
    stack_size = 10,
    place_result = t2_name
}

local t2_recipe = {
    type = 'recipe',
    name = t2_name,
    localised_name = {t2_name},
    enabled = true,
    ingredients = {
        {'metal-plate', 100},
        {'iron-gear-wheel', 50}
    },
    energy_required = 3,
    result = t2_name
}

local t3 = utils.deepcopy(raw['generator']['steam-turbine'])
t3.name = t3_name
t3.localised_name = {t3_name}
t3.fluid_usage_per_tick = nil
t3.fluid_box = nil
t3.maximum_temperature = nil
t3.burner = {
    fuel_inventory_size = 1,
    fuel_category = 'void'
}
t3.max_power_output = '2500MW'
t3.icon = reactor.icon
t3.icon_size = reactor.icon_size
t3.minable = {mining_time = 0.3, result = t3_name}
t3.corpse = 'nuclear-reactor-remnants'
t3.dying_explosion = nil
t3.dying_trigger_effect = {type = 'nested-result', action = reactor.meltdown_action}
t3.collision_box = {{-2.2, -2.2}, {2.2, 2.2}}
t3.selection_box = {{-2.5, -2.5}, {2.5, 2.5}}
t3.max_health = 500
local animation = {
    layers = {
        {
            filename = '__base__/graphics/entity/nuclear-reactor/reactor.png',
            width = 160,
            height = 160,
            shift = {-0.03125, -0.1875},
            hr_version = {
                filename = '__base__/graphics/entity/nuclear-reactor/hr-reactor.png',
                width = 320,
                height = 320,
                scale = 0.5,
                shift = {-0.03125, -0.1875}
            }
        },
        {
            filename = '__base__/graphics/entity/nuclear-reactor/reactor-shadow.png',
            width = 263,
            height = 162,
            shift = {1.625, 0},
            draw_as_shadow = true,
            hr_version = {
                filename = '__base__/graphics/entity/nuclear-reactor/hr-reactor-shadow.png',
                width = 525,
                height = 323,
                scale = 0.5,
                shift = {1.625, 0},
                draw_as_shadow = true
            }
        },
        {
            filename = '__base__/graphics/entity/nuclear-reactor/reactor-lights-color.png',
            width = 160,
            height = 160,
            shift = {-0.03125, -0.1875},
            blend_mode = 'additive',
            hr_version = {
                filename = '__base__/graphics/entity/nuclear-reactor/hr-reactor-lights-color.png',
                width = 320,
                height = 320,
                scale = 0.5,
                shift = {-0.03125, -0.1875},
                blend_mode = 'additive'
            }
        }
    }
}
t3.horizontal_animation = animation
t3.vertical_animation = animation

local t3_item = {
    type = 'item',
    name = t3_name,
    localised_name = {t3_name},
    icon = t3.icon,
    icon_size = 32,
    flags = {},
    subgroup = 'energy',
    order = 'c-c',
    stack_size = 10,
    place_result = t3_name
}

local t3_recipe = {
    type = 'recipe',
    name = t3_name,
    localised_name = {t3_name},
    enabled = true,
    ingredients = {
        {'metal-plate', 1000},
        {'iron-gear-wheel', 500}
    },
    energy_required = 3,
    result = t3_name
}

data:extend {category, void_fuel, t1, t1_item, t1_recipe, t2, t2_item, t2_recipe, t3, t3_item, t3_recipe}
