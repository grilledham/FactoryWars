local utils = require 'utils'
local names = require 'names'

local raw = data.raw
local name = 'inf-gun'

local gun = utils.deepcopy(raw['gun']['submachine-gun'])
gun.name = name
local ap = gun.attack_parameters
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

data:extend({gun, recipe})
