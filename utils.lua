local util = require 'util'
local utils = {}
utils.deepcopy = util.table.deepcopy

local deepcopy = utils.deepcopy

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
local multiply_animation_value = utils.multiply_animation_value

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

function utils.shift_area(area, shift)
    local a, b = area[1], area[2]
    local x, y = shift[1], shift[2]
    a[1] = a[1] + x
    a[2] = a[2] + y
    b[1] = b[1] + x
    b[2] = b[2] + y

    return area
end

utils.unit_flags = {'player-creation', 'placeable-off-grid'}
utils.ground_unit_collision_mask = {'not-colliding-with-itself', 'player-layer', 'train-layer'}

local function is_sprite_def(array)
    return array.width and array.height and (array.filename or array.stripes or array.filenames)
end
utils.is_sprite_def = is_sprite_def

local function recursive_hack_make_hr(prototype)
    for k, v in pairs(prototype) do
        if type(v) == 'table' then
            if is_sprite_def(v) and v.hr_version then
                prototype[k] = v.hr_version
                --v.scale = v.scale * 0.5
                v.hr_version = nil
            end
            recursive_hack_make_hr(v)
        end
    end

    return prototype
end
utils.recursive_hack_make_hr = recursive_hack_make_hr

local function do_layers(animation)
    for _, layer in pairs(animation.layers) do
        layer.frame_count = 1
        layer.max_advance = nil
        layer.line_length = nil
        if layer.stripes then
            for _, strip in pairs(layer.stripes) do
                strip.width_in_frames = 1
            end
            if layer.apply_runtime_tint or layer.draw_as_shadow then
                local new_stripes = {}
                for k, stripe in pairs(layer.stripes) do
                    if k % 2 ~= 0 then
                        table.insert(new_stripes, stripe)
                    end
                end
                layer.stripes = new_stripes
            end
        end
    end
end

function utils.combine_base_and_turret(base, turret, turret_scale, turret_shift)
    turret_shift = turret_shift or {0, 0}

    recursive_hack_make_hr(base)
    recursive_hack_make_hr(turret)

    if turret_scale then
        multiply_animation_value(turret, 'scale', turret_scale)
    end

    do_layers(base)

    local base_layers = base.layers
    local turret_layers = turret.layers or turret
    if turret_layers then
        for _, l in pairs(turret_layers) do
            l.shift = l.shift or {0, 0}
            l.shift[1] = l.shift[1] + turret_shift[1]
            l.shift[2] = l.shift[2] + turret_shift[2]
            table.insert(base_layers, l)
        end
    end

    return base
end

local nil_value = {}
utils.nil_value = nil_value

function utils.apply_data_changes(dataset, changes)
    for name, change_data in pairs(changes) do
        local old = dataset[name]
        if old then
            if change_data == nil_value then
                dataset[name] = nil
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
end

return utils
