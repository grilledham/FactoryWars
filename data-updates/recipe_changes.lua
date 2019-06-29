local utils = require 'utils'
local nil_value = utils.nil_value

local changes = {
    ['copper-plate'] = {enabled = false},
    ['iron-plate'] = {enabled = false},
    ['pipe-to-ground'] = {enabled = false},
    ['steam-engine'] = {enabled = false},
    ['electric-mining-drill'] = {enabled = false},
    ['burner-mining-drill'] = {enabled = false},
    ['boiler'] = {enabled = false},
    ['stone-furnace'] = {enabled = false},
    ['wooden-chest'] = {enabled = false},
    ['burner-inserter'] = {enabled = false},
    ['offshore-pump'] = {enabled = false},
    ['pistol'] = {enabled = false},
    ['firearm-magazine'] = {enabled = false},
    ['light-armor'] = {enabled = false},
    ['iron-gear-wheel'] = {
        ingredients = {{'metal-plate', 2}},
        result = 'iron-gear-wheel',
        normal = nil_value,
        expensive = nil_value
    },
    ['copper-cable'] = {
        ingredients = {{'metal-plate', 1}}
    },
    ['electronic-circuit'] = {
        ingredients = {
            {'metal-plate', 1},
            {'copper-cable', 3}
        },
        result = 'electronic-circuit',
        normal = nil_value,
        expensive = nil_value
    },
    ['stone-brick'] = {
        ingredients = {{'metal-plate', 1}},
        result = 'stone-brick',
        category = 'crafting'
    },
    ['iron-stick'] = {
        ingredients = {{'metal-plate', 1}}
    },
    ['small-electric-pole'] = {
        ingredients = {
            {'iron-stick', 1},
            {'copper-cable', 1}
        }
    },
    ['pipe'] = {
        ingredients = {{'metal-plate', 1}}
    },
    ['transport-belt'] = {
        ingredients = {
            {'metal-plate', 1},
            {'iron-gear-wheel', 1}
        }
    },
    ['splitter'] = {
        ingredients = {
            {'metal-plate', 5},
            {'iron-gear-wheel', 5},
            {'transport-belt', 2}
        }
    },
    ['inserter'] = {
        ingredients = {
            {'metal-plate', 1},
            {'iron-gear-wheel', 1}
        }
    },
    ['lab'] = {
        ingredients = {
            {'metal-plate', 5},
            {'iron-gear-wheel', 5},
            {'copper-cable', 10}
        }
    },
    ['iron-chest'] = {
        ingredients = {{'metal-plate', 4}}
    },
    ['assembling-machine-1'] = {
        {'metal-plate', 10},
        {'iron-gear-wheel', 5}
    },
    ['engine-unit'] = {
        ingredients = {
            {'iron-stick', 4},
            {'iron-gear-wheel', 1}
        },
        category = 'crafting'
    },
    ['flamethrower-ammo'] = {
        ingredients = {
            {'metal-plate', 2},
            {'iron-stick', 4}
        },
        category = 'crafting',
        energy_required = 1
    },
    ['rocket-control-unit'] = {
        ingredients = {
            {'metal-plate', 2},
            {'electronic-circuit', 2},
            {'iron-gear-wheel', 2}
        },
        category = 'crafting',
        energy_required = 1
    },
    ['radar'] = {
        ingredients = {
            {'metal-plate', 10},
            {'electronic-circuit', 5},
            {'iron-gear-wheel', 5}
        },
        enabled = false
    }
}

local recipe = data.raw.recipe
utils.apply_data_changes(recipe, changes)
