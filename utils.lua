local utils = require 'util'
utils.deepcopy = util.table.deepcopy

utils.directions4Way = {'north', 'east', 'south', 'west'}
local directions4Way = utils.directions4Way

local function set_animation_value_inner(a, key, value)
    a[key] = value
    local hr = a.hr_version
    if hr then
        hr[key] = value
    end
end

function utils.set_animation_value(animations, key, value)
    local layers = animations.layers
    if layers then
        for i = 1, #layers do
            local a = layers[i]
            set_animation_value_inner(a, key, value)
        end
    elseif animations.north then
        for i = 1, #directions4Way do
            local d = directions4Way[i]
            local a = animations[d]
            set_animation_value_inner(a, key, value)
        end
    else
        set_animation_value_inner(animations, key, value)
    end

    return animations
end

local function multiply_animation_value_inner(a, key, value)
    local old = a[key] or 1
    a[key] = old * value
    local hr = a.hr_version
    if hr then
        old = hr[key] or 1
        hr[key] = old * value
    end
end

function utils.multiply_animation_value(animations, key, value)
    local layers = animations.layers
    if layers then
        for i = 1, #layers do
            local a = layers[i]
            multiply_animation_value_inner(a, key, value)
        end
    elseif animations.north then
        for i = 1, #directions4Way do
            local d = directions4Way[i]
            local a = animations[d]
            multiply_animation_value_inner(a, key, value)
        end
    else
        multiply_animation_value_inner(animations, key, value)
    end

    return animations
end

function utils.scale_area(area, scale)
    local a, b = area[1], area[2]
    a[1] = a[1] * scale
    a[2] = a[2] * scale
    b[1] = b[1] * scale
    b[2] = b[2] * scale

    return area
end

function utils.scale_position(position, scale)
    position[1], position[2] = position[1] * scale, position[2] * scale
    return position
end

return util
