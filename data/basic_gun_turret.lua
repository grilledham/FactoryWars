local utils = require 'utils'
local names = require 'names'

local raw = data.raw

local entity_name = names.entities.basic_gun_turret
local item_name = names.items.basic_gun_turret
local recipe_name = names.recipes.basic_gun_turret

local entity = utils.deepcopy(raw['ammo-turret']['gun-turret'])
entity.type = 'turret'
entity.name = entity_name
entity.localised_name = {entity_name}
entity.inventory_size = nil
entity.automated_ammo_count = nil
local ap = entity.attack_parameters
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
entity.order = 'i-c'

local item = {
    type = 'item',
    name = item_name,
    localised_name = {item_name},
    icon = entity.icon,
    icon_size = entity.icon_size,
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
    enabled = false,
    ingredients = {
        {'metal-plate', 20},
        {'iron-gear-wheel', 10}
    },
    energy_required = 8,
    result = item_name
}

data:extend({entity, item, recipe})
