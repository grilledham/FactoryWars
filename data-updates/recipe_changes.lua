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
    ['automation-science-pack'] = {
        ingredients = {
            {'iron-gear-wheel', 1},
            {'copper-cable', 2}
        }
    },
    ['transport-belt'] = {
        ingredients = {
            {'metal-plate', 1},
            {'iron-gear-wheel', 1}
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
    }
}

local recipe = data.raw.recipe
utils.apply_data_changes(recipe, changes)
