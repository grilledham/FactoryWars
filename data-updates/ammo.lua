local utils = require 'utils'
local names = require 'names'

local raw = data.raw

local ammo = raw['recipe']['firearm-magazine']
ammo.ingredients = {}
ammo.energy_required = 1

--[[ local recipes = raw['recipe']

recipes['piercing-rounds-magazine'] = nil
recipes['uranium-rounds-magazine'] = nil
recipes['combat-shotgun'] = nil
recipes['piercing-shotgun-shell'] = nil
recipes['shotgun'] = nil
recipes['shotgun-shell'] = nil
recipes['pistol'] = nil

raw['ammo']['piercing-rounds-magazine'] = nil
raw['ammo']['uranium-rounds-magazine'] = nil ]]
