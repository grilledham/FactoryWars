local utils = require 'utils'
local names = require 'names'

local raw = data.raw
local name = 'inf-gun-turret'

local turret = utils.deepcopy(raw['ammo-turret']['gun-turret'])
turret.type = 'turret'
turret.name = name
turret.inventory_size = nil
turret.automated_ammo_count = nil
local ap = turret.attack_parameters
ap.ammo_category = nil
ap.ammo_type = {
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
}
turret.order = 'i-c'
--[[ turret.energy_source = {
    type = 'void'
} ]]

local item = {
    type = 'item',
    name = name,
    localised_name = {name},
    icon = turret.icon,
    icon_size = turret.icon_size,
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
    enabled = false,
    ingredients = {
        {'engine-unit', 8},
        {'iron-gear-wheel', 5},
        {'solid-fuel', 15}
    },
    energy_required = 20,
    result = name
}

data:extend({turret, item, recipe})
