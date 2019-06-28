local nil_value = {}

local changes = {
    ['copper-plate'] = {enabled = false},
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
    }
}

local recipe = data.raw.recipe

for name, change_data in pairs(changes) do
    local old = recipe[name]
    if old then
        if change_data == nil_value then
            recipe[name] = nil
        else
            for key, data in pairs(change_data) do
                if data == nil_value then
                    old[key] = nil
                else
                    old[key] = data
                end
            end
        end
    else
        data:extend({change_data})
    end
end
