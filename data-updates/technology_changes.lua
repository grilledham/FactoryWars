local utils = require 'utils'
local names = require 'names'

local technolgy_blacklist = {
    ['active-defense'] = true,
    ['advanced-electronics'] = true,
    ['advanced-electronics-2'] = true,
    ['advanced-material-processing'] = true,
    ['advanced-material-processing-2'] = true,
    ['advanced-oil-processing'] = true,
    ['analyse-ship'] = true,
    artillery = true,
    ['artillery-shell-range-1'] = true,
    ['artillery-shell-speed-1'] = true,
    ['atomic-bomb'] = true,
    ['auto-character-logistic-trash-slots'] = true,
    ['automated-rail-transportation'] = true,
    ['automation-2'] = true,
    ['automation-3'] = true,
    automobilism = true,
    ['basic-electronics'] = true,
    ['basic-logistics'] = true,
    ['basic-mapping'] = true,
    ['basic-military'] = true,
    ['basic-mining'] = true,
    ['basic-optics'] = true,
    battery = true,
    ['battery-equipment'] = true,
    ['battery-mk2-equipment'] = true,
    ['belt-immunity-equipment'] = true,
    ['braking-force-1'] = true,
    ['braking-force-2'] = true,
    ['braking-force-3'] = true,
    ['braking-force-4'] = true,
    ['braking-force-5'] = true,
    ['braking-force-6'] = true,
    ['braking-force-7'] = true,
    ['character-logistic-slots-1'] = true,
    ['character-logistic-slots-2'] = true,
    ['character-logistic-slots-3'] = true,
    ['character-logistic-slots-4'] = true,
    ['character-logistic-slots-5'] = true,
    ['character-logistic-slots-6'] = true,
    ['character-logistic-trash-slots-1'] = true,
    ['character-logistic-trash-slots-2'] = true,
    ['character-logistic-trash-slots-3'] = true,
    ['character-logistic-trash-slots-4'] = true,
    ['character-logistic-trash-slots-5'] = true,
    ['chemical-science-pack'] = true,
    ['circuit-network'] = true,
    ['cliff-explosives'] = true,
    ['coal-liquefaction'] = true,
    ['combat-robotics'] = true,
    ['combat-robotics-2'] = true,
    ['combat-robotics-3'] = true,
    concrete = true,
    ['construction-robotics'] = true,
    ['demo-logistics'] = true,
    ['demo-productivity-1'] = true,
    ['demo-science-pack'] = true,
    ['demo-shooting-speed-1'] = true,
    ['discharge-defense-equipment'] = true,
    ['effect-transmission'] = true,
    ['effectivity-module'] = true,
    ['effectivity-module-2'] = true,
    ['effectivity-module-3'] = true,
    ['electric-energy-accumulators'] = true,
    ['electric-energy-distribution-1'] = true,
    ['electric-energy-distribution-2'] = true,
    ['electric-engine'] = true,
    ['electric-inserter'] = true,
    ['electric-mining'] = true,
    ['energy-shield-equipment'] = true,
    ['energy-shield-mk2-equipment'] = true,
    ['energy-weapons-damage-1'] = true,
    ['energy-weapons-damage-2'] = true,
    ['energy-weapons-damage-3'] = true,
    ['energy-weapons-damage-4'] = true,
    ['energy-weapons-damage-5'] = true,
    ['energy-weapons-damage-6'] = true,
    ['energy-weapons-damage-7'] = true,
    ['exoskeleton-equipment'] = true,
    ['explosive-rocketry'] = true,
    explosives = true,
    ['fast-inserter'] = true,
    flamethrower = true,
    ['fluid-handling'] = true,
    ['fluid-wagon'] = true,
    ['follower-robot-count-1'] = true,
    ['follower-robot-count-2'] = true,
    ['follower-robot-count-3'] = true,
    ['follower-robot-count-4'] = true,
    ['follower-robot-count-5'] = true,
    ['follower-robot-count-6'] = true,
    ['follower-robot-count-7'] = true,
    ['fusion-reactor-equipment'] = true,
    gates = true,
    ['heavy-armor'] = true,
    ['improved-equipment'] = true,
    ['inserter-capacity-bonus-1'] = true,
    ['inserter-capacity-bonus-2'] = true,
    ['inserter-capacity-bonus-3'] = true,
    ['inserter-capacity-bonus-4'] = true,
    ['inserter-capacity-bonus-5'] = true,
    ['inserter-capacity-bonus-6'] = true,
    ['inserter-capacity-bonus-7'] = true,
    ['kovarex-enrichment-process'] = true,
    ['land-mine'] = true,
    landfill = true,
    laser = true,
    ['laser-turret-speed-1'] = true,
    ['laser-turret-speed-2'] = true,
    ['laser-turret-speed-3'] = true,
    ['laser-turret-speed-4'] = true,
    ['laser-turret-speed-5'] = true,
    ['laser-turret-speed-6'] = true,
    ['laser-turret-speed-7'] = true,
    ['laser-turrets'] = true,
    ['logistic-robotics'] = true,
    ['logistic-science-pack'] = true,
    ['logistic-system'] = true,
    ['logistics-2'] = true,
    ['logistics-3'] = true,
    ['low-density-structure'] = true,
    lubricant = true,
    military = true,
    ['military-2'] = true,
    ['military-3'] = true,
    ['military-4'] = true,
    ['military-science-pack'] = true,
    ['mining-productivity-1'] = true,
    ['mining-productivity-2'] = true,
    ['mining-productivity-3'] = true,
    ['mining-productivity-4'] = true,
    ['modular-armor'] = true,
    modules = true,
    ['night-vision-equipment'] = true,
    ['nuclear-fuel-reprocessing'] = true,
    ['nuclear-power'] = true,
    ['oil-processing'] = true,
    optics = true,
    ['passive-defense'] = true,
    ['personal-laser-defense-equipment'] = true,
    ['personal-roboport-equipment'] = true,
    ['personal-roboport-mk2-equipment'] = true,
    ['physical-projectile-damage-1'] = true,
    ['physical-projectile-damage-2'] = true,
    ['physical-projectile-damage-3'] = true,
    ['physical-projectile-damage-4'] = true,
    ['physical-projectile-damage-5'] = true,
    ['physical-projectile-damage-6'] = true,
    ['physical-projectile-damage-7'] = true,
    plastics = true,
    ['power-armor'] = true,
    ['power-armor-mk2'] = true,
    ['production-science-pack'] = true,
    ['productivity-module'] = true,
    ['productivity-module-2'] = true,
    ['productivity-module-3'] = true,
    radar = true,
    ['rail-signals'] = true,
    railway = true,
    ['refined-flammables-1'] = true,
    ['refined-flammables-2'] = true,
    ['refined-flammables-3'] = true,
    ['refined-flammables-4'] = true,
    ['refined-flammables-5'] = true,
    ['refined-flammables-6'] = true,
    ['refined-flammables-7'] = true,
    ['repair-tech'] = true,
    ['research-speed-1'] = true,
    ['research-speed-2'] = true,
    ['research-speed-3'] = true,
    ['research-speed-4'] = true,
    ['research-speed-5'] = true,
    ['research-speed-6'] = true,
    robotics = true,
    ['rocket-fuel'] = true,
    ['rocket-silo'] = true,
    rocketry = true,
    ['solar-energy'] = true,
    ['solar-panel-equipment'] = true,
    ['space-science-pack'] = true,
    ['speed-module'] = true,
    ['speed-module-2'] = true,
    ['speed-module-3'] = true,
    ['stack-inserter'] = true,
    ['steel-axe'] = true,
    ['steel-processing'] = true,
    ['stone-walls'] = true,
    ['stronger-explosives-1'] = true,
    ['stronger-explosives-2'] = true,
    ['stronger-explosives-3'] = true,
    ['stronger-explosives-4'] = true,
    ['stronger-explosives-5'] = true,
    ['stronger-explosives-6'] = true,
    ['stronger-explosives-7'] = true,
    ['sulfur-processing'] = true,
    tanks = true,
    toolbelt = true,
    turrets = true,
    ['uranium-ammo'] = true,
    ['uranium-processing'] = true,
    ['utility-science-pack'] = true,
    ['weapon-shooting-speed-1'] = true,
    ['weapon-shooting-speed-2'] = true,
    ['weapon-shooting-speed-3'] = true,
    ['weapon-shooting-speed-4'] = true,
    ['weapon-shooting-speed-5'] = true,
    ['weapon-shooting-speed-6'] = true,
    ['worker-robots-speed-1'] = true,
    ['worker-robots-speed-2'] = true,
    ['worker-robots-speed-3'] = true,
    ['worker-robots-speed-4'] = true,
    ['worker-robots-speed-5'] = true,
    ['worker-robots-speed-6'] = true,
    ['worker-robots-storage-1'] = true,
    ['worker-robots-storage-2'] = true,
    ['worker-robots-storage-3'] = true
}

local raw = data.raw
local technology = raw.technology
local item_names = names.items
local tech_names = names.technologies

for k, v in pairs(technolgy_blacklist) do
    technology[k].enabled = false
end

utils.apply_data_changes(
    technology,
    {
        ['automation'] = {
            unit = {
                count = 10,
                ingredients = {
                    {item_names.basic_science_pack, 1}
                },
                time = 10
            },
            effects = {
                {
                    type = 'unlock-recipe',
                    recipe = 'assembling-machine-1'
                }
            },
            order = 'a-c',
            prerequisites = {tech_names.basic_science_pack}
        },
        ['logistics'] = {
            unit = {
                count = 20,
                ingredients = {
                    {item_names.basic_science_pack, 1}
                },
                time = 10
            },
            effects = {
                {
                    type = 'unlock-recipe',
                    recipe = 'transport-belt'
                },
                {
                    type = 'unlock-recipe',
                    recipe = 'underground-belt'
                },
                {
                    type = 'unlock-recipe',
                    recipe = 'splitter'
                },
                {
                    type = 'unlock-recipe',
                    recipe = 'inserter'
                }
            },
            order = 'a-c',
            prerequisites = {tech_names.basic_science_pack}
        },
        ['electronics'] = {
            unit = {
                count = 20,
                ingredients = {
                    {item_names.basic_science_pack, 1}
                },
                time = 10
            },
            effects = {
                {
                    type = 'unlock-recipe',
                    recipe = 'electronic-circuit'
                }
            },
            order = 'a-c',
            prerequisites = {'automation'}
        },
        ['engine'] = {
            unit = {
                count = 20,
                ingredients = {
                    {item_names.basic_science_pack, 1}
                },
                time = 10
            },
            effects = {
                {
                    type = 'unlock-recipe',
                    recipe = 'engine-unit'
                }
            },
            order = 'a-c',
            prerequisites = {'logistics'}
        },
        ['flammables'] = {
            effects = {
                {
                    type = 'unlock-recipe',
                    recipe = names.items.basic_flame_car
                },
                {
                    type = 'unlock-recipe',
                    recipe = 'flamethrower-ammo'
                }
            },
            unit = {
                count = 50,
                ingredients = {
                    {names.items.basic_science_pack, 1}
                },
                time = 30
            },
            prerequisites = {names.technologies.basic_units}
        },
        ['rocket-control-unit'] = {
            unit = {
                count = 50,
                ingredients = {
                    {names.items.basic_science_pack, 1}
                },
                time = 30
            },
            effects = {
                {
                    type = 'unlock-recipe',
                    recipe = names.items.basic_rocket_car
                },
                {
                    type = 'unlock-recipe',
                    recipe = 'rocket-control-unit'
                }
            },
            prerequisites = {names.technologies.basic_units}
        }
    }
)
