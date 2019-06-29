local utils = require 'utils'
local nil_value = utils.nil_value
local raw = data.raw

local names = require 'names'
local item_names = names.items

utils.apply_data_changes(
    raw['simple-entity'],
    {
        ['rock-huge'] = {
            minable = {
                mining_particle = 'stone-particle',
                mining_time = 3,
                result = 'metal-plate',
                count = 45
            },
            loot = nil_value
        },
        ['rock-big'] = {
            minable = {
                mining_particle = 'stone-particle',
                mining_time = 2,
                result = 'metal-plate',
                count = 20
            },
            loot = nil_value
        },
        ['sand-rock-big'] = {
            minable = {
                mining_particle = 'stone-particle',
                mining_time = 2,
                result = 'metal-plate',
                count = 30
            },
            loot = nil_value
        }
    }
)

utils.apply_data_changes(
    raw['lab'],
    {
        ['lab'] = {
            energy_usage = '0.5MW',
            inputs = {
                item_names.basic_science_pack,
                item_names.advanced_science_pack,
                item_names.superior_science_pack,
                item_names.experimental_science_pack
            }
        }
    }
)
