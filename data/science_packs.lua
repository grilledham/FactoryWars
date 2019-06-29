local names = require 'names'
local items_names = names.items

local pack1 = {
    type = 'tool',
    name = items_names.basic_science_pack,
    localised_name = {items_names.basic_science_pack},
    icon = '__base__/graphics/icons/automation-science-pack.png',
    icon_size = 32,
    subgroup = 'science-pack',
    order = 'a-a',
    stack_size = 200,
    durability = 1,
    durability_description_key = 'description.science-pack-remaining-amount-key',
    durability_description_value = 'description.science-pack-remaining-amount-value'
}

local recipe1 = {
    type = 'recipe',
    name = items_names.basic_science_pack,
    localised_name = {items_names.basic_science_pack},
    energy_required = 2,
    ingredients = {
        {'copper-cable', 2},
        {'iron-gear-wheel', 1}
    },
    result = items_names.basic_science_pack
}

local tech1 = {
    type = 'technology',
    name = items_names.basic_science_pack,
    localised_name = {items_names.basic_science_pack},
    icon_size = 128,
    icon = '__base__/graphics/technology/automation-science-pack.png',
    effects = {
        {
            type = 'unlock-recipe',
            recipe = items_names.basic_science_pack
        },
        {
            type = 'unlock-recipe',
            recipe = 'lab'
        }
    },
    unit = {
        count = 10,
        ingredients = {{items_names.basic_science_pack, 1}},
        time = 1
    },
    order = 'a-a'
}

local pack2 = {
    type = 'tool',
    name = items_names.advanced_science_pack,
    localised_name = {items_names.advanced_science_pack},
    icon = '__base__/graphics/icons/logistic-science-pack.png',
    icon_size = 32,
    subgroup = 'science-pack',
    order = 'a-b',
    stack_size = 200,
    durability = 1,
    durability_description_key = 'description.science-pack-remaining-amount-key',
    durability_description_value = 'description.science-pack-remaining-amount-value'
}

local recipe2 = {
    type = 'recipe',
    name = items_names.advanced_science_pack,
    localised_name = {items_names.advanced_science_pack},
    energy_required = 4,
    ingredients = {
        {'copper-cable', 2},
        {'iron-gear-wheel', 1}
    },
    result = items_names.advanced_science_pack,
    enabled = false
}

local tech2 = {
    type = 'technology',
    name = items_names.advanced_science_pack,
    localised_name = {items_names.advanced_science_pack},
    icon_size = 128,
    icon = '__base__/graphics/technology/logistic-science-pack.png',
    effects = {
        {
            type = 'unlock-recipe',
            recipe = items_names.advanced_science_pack
        }
    },
    unit = {
        count = 50,
        ingredients = {{items_names.basic_science_pack, 1}},
        time = 1
    },
    order = 'a-b',
    prerequisites = {items_names.basic_science_pack}
}

local pack3 = {
    type = 'tool',
    name = items_names.superior_science_pack,
    localised_name = {items_names.superior_science_pack},
    icon = '__base__/graphics/icons/chemical-science-pack.png',
    icon_size = 32,
    subgroup = 'science-pack',
    order = 'a-c',
    stack_size = 200,
    durability = 1,
    durability_description_key = 'description.science-pack-remaining-amount-key',
    durability_description_value = 'description.science-pack-remaining-amount-value'
}

local recipe3 = {
    type = 'recipe',
    name = items_names.superior_science_pack,
    localised_name = {items_names.superior_science_pack},
    energy_required = 8,
    ingredients = {
        {'copper-cable', 2},
        {'iron-gear-wheel', 1}
    },
    result = items_names.superior_science_pack,
    enabled = false
}

local tech3 = {
    type = 'technology',
    name = items_names.superior_science_pack,
    localised_name = {items_names.superior_science_pack},
    icon_size = 128,
    icon = '__base__/graphics/technology/chemical-science-pack.png',
    effects = {
        {
            type = 'unlock-recipe',
            recipe = items_names.superior_science_pack
        }
    },
    unit = {
        count = 250,
        ingredients = {{items_names.basic_science_pack, 1}, {items_names.advanced_science_pack, 1}},
        time = 1
    },
    order = 'a-c',
    prerequisites = {items_names.advanced_science_pack}
}

local pack4 = {
    type = 'tool',
    name = items_names.experimental_science_pack,
    localised_name = {items_names.experimental_science_pack},
    icon = '__base__/graphics/icons/utility-science-pack.png',
    icon_size = 32,
    subgroup = 'science-pack',
    order = 'a-d',
    stack_size = 200,
    durability = 1,
    durability_description_key = 'description.science-pack-remaining-amount-key',
    durability_description_value = 'description.science-pack-remaining-amount-value'
}

local recipe4 = {
    type = 'recipe',
    name = items_names.experimental_science_pack,
    localised_name = {items_names.experimental_science_pack},
    energy_required = 16,
    ingredients = {
        {'copper-cable', 2},
        {'iron-gear-wheel', 1}
    },
    result = items_names.experimental_science_pack,
    enabled = false
}

local tech4 = {
    type = 'technology',
    name = items_names.experimental_science_pack,
    localised_name = {items_names.experimental_science_pack},
    icon_size = 128,
    icon = '__base__/graphics/technology/utility-science-pack.png',
    effects = {
        {
            type = 'unlock-recipe',
            recipe = items_names.experimental_science_pack
        }
    },
    unit = {
        count = 1250,
        ingredients = {
            {items_names.basic_science_pack, 1},
            {items_names.advanced_science_pack, 1},
            {items_names.superior_science_pack, 1}
        },
        time = 1
    },
    order = 'a-c',
    prerequisites = {items_names.superior_science_pack}
}

data:extend {
    pack1,
    pack2,
    pack3,
    pack4,
    recipe1,
    recipe2,
    recipe3,
    recipe4,
    tech1,
    tech2,
    tech3,
    tech4
}
