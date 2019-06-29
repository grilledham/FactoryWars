require 'data-updates.recipe_changes'
require 'data-updates.entity_changes'
require 'data-updates.technology_changes'
--require 'data-updates.ammo'

local recipe_blacklist = {
    accumulator = true,
    ['advanced-circuit'] = true,
    ['advanced-oil-processing'] = true,
    ['arithmetic-combinator'] = true,
    ['artillery-shell'] = true,
    ['artillery-targeting-remote'] = true,
    ['artillery-turret'] = true,
    ['artillery-wagon'] = true,
    ['assembling-machine-1'] = true,
    ['assembling-machine-2'] = true,
    ['assembling-machine-3'] = true,
    ['atomic-bomb'] = true,
    ['automation-science-pack'] = true,
    battery = true,
    ['battery-equipment'] = true,
    ['battery-mk2-equipment'] = true,
    beacon = true,
    ['belt-immunity-equipment'] = true,
    ['big-electric-pole'] = true,
    boiler = true,
    ['burner-inserter'] = true,
    ['burner-mining-drill'] = true,
    ['cannon-shell'] = true,
    car = true,
    ['cargo-wagon'] = true,
    centrifuge = true,
    ['chemical-plant'] = true,
    ['chemical-science-pack'] = true,
    ['cliff-explosives'] = true,
    ['cluster-grenade'] = true,
    ['coal-liquefaction'] = true,
    ['combat-shotgun'] = true,
    concrete = true,
    ['constant-combinator'] = true,
    ['construction-robot'] = true,
    ['copper-cable'] = true,
    ['copper-plate'] = true,
    ['decider-combinator'] = true,
    ['defender-capsule'] = true,
    ['destroyer-capsule'] = true,
    ['discharge-defense-equipment'] = true,
    ['discharge-defense-remote'] = true,
    ['distractor-capsule'] = true,
    ['effectivity-module'] = true,
    ['effectivity-module-2'] = true,
    ['effectivity-module-3'] = true,
    ['electric-energy-interface'] = true,
    ['electric-engine-unit'] = true,
    ['electric-furnace'] = true,
    ['electric-mining-drill'] = true,
    ['electronic-circuit'] = true,
    ['empty-barrel'] = true,
    ['empty-crude-oil-barrel'] = true,
    ['empty-heavy-oil-barrel'] = true,
    ['empty-light-oil-barrel'] = true,
    ['empty-lubricant-barrel'] = true,
    ['empty-petroleum-gas-barrel'] = true,
    ['empty-sulfuric-acid-barrel'] = true,
    ['empty-water-barrel'] = true,
    ['energy-shield-equipment'] = true,
    ['energy-shield-mk2-equipment'] = true,
    ['engine-unit'] = true,
    ['exoskeleton-equipment'] = true,
    ['explosive-cannon-shell'] = true,
    ['explosive-rocket'] = true,
    ['explosive-uranium-cannon-shell'] = true,
    explosives = true,
    ['express-loader'] = true,
    ['express-splitter'] = true,
    ['express-transport-belt'] = true,
    ['express-underground-belt'] = true,
    ['fast-inserter'] = true,
    ['fast-loader'] = true,
    ['fast-splitter'] = true,
    ['fast-transport-belt'] = true,
    ['fast-underground-belt'] = true,
    ['fill-crude-oil-barrel'] = true,
    ['fill-heavy-oil-barrel'] = true,
    ['fill-light-oil-barrel'] = true,
    ['fill-lubricant-barrel'] = true,
    ['fill-petroleum-gas-barrel'] = true,
    ['fill-sulfuric-acid-barrel'] = true,
    ['fill-water-barrel'] = true,
    ['filter-inserter'] = true,
    ['firearm-magazine'] = true,
    flamethrower = true,
    ['flamethrower-ammo'] = true,
    ['flamethrower-turret'] = true,
    ['fluid-wagon'] = true,
    ['flying-robot-frame'] = true,
    ['fusion-reactor-equipment'] = true,
    gate = true,
    ['green-wire'] = true,
    grenade = true,
    ['gun-turret'] = true,
    ['hazard-concrete'] = true,
    ['heat-exchanger'] = true,
    ['heat-pipe'] = true,
    ['heavy-armor'] = true,
    ['heavy-oil-cracking'] = true,
    inserter = true,
    ['iron-chest'] = true,
    ['iron-gear-wheel'] = true,
    ['iron-plate'] = true,
    ['iron-stick'] = true,
    ['kovarex-enrichment-process'] = true,
    lab = true,
    ['land-mine'] = true,
    landfill = true,
    ['laser-turret'] = true,
    ['light-armor'] = true,
    ['light-oil-cracking'] = true,
    loader = true,
    locomotive = true,
    ['logistic-chest-active-provider'] = true,
    ['logistic-chest-buffer'] = true,
    ['logistic-chest-passive-provider'] = true,
    ['logistic-chest-requester'] = true,
    ['logistic-chest-storage'] = true,
    ['logistic-robot'] = true,
    ['logistic-science-pack'] = true,
    ['long-handed-inserter'] = true,
    ['low-density-structure'] = true,
    lubricant = true,
    ['medium-electric-pole'] = true,
    ['military-science-pack'] = true,
    ['modular-armor'] = true,
    ['night-vision-equipment'] = true,
    ['nuclear-fuel'] = true,
    ['nuclear-fuel-reprocessing'] = true,
    ['nuclear-reactor'] = true,
    ['offshore-pump'] = true,
    ['oil-refinery'] = true,
    ['personal-laser-defense-equipment'] = true,
    ['personal-roboport-equipment'] = true,
    ['personal-roboport-mk2-equipment'] = true,
    ['piercing-rounds-magazine'] = true,
    ['piercing-shotgun-shell'] = true,
    pipe = true,
    ['pipe-to-ground'] = true,
    pistol = true,
    ['plastic-bar'] = true,
    ['player-port'] = true,
    ['poison-capsule'] = true,
    ['power-armor'] = true,
    ['power-armor-mk2'] = true,
    ['power-switch'] = true,
    ['processing-unit'] = true,
    ['production-science-pack'] = true,
    ['productivity-module'] = true,
    ['productivity-module-2'] = true,
    ['productivity-module-3'] = true,
    ['programmable-speaker'] = true,
    pump = true,
    pumpjack = true,
    radar = true,
    rail = true,
    ['rail-chain-signal'] = true,
    ['rail-signal'] = true,
    railgun = true,
    ['railgun-dart'] = true,
    ['red-wire'] = true,
    ['refined-concrete'] = true,
    ['refined-hazard-concrete'] = true,
    ['repair-pack'] = true,
    roboport = true,
    rocket = true,
    ['rocket-control-unit'] = true,
    ['rocket-fuel'] = true,
    ['rocket-launcher'] = true,
    ['rocket-part'] = true,
    ['rocket-silo'] = true,
    satellite = true,
    shotgun = true,
    ['shotgun-shell'] = true,
    ['slowdown-capsule'] = true,
    ['small-electric-pole'] = true,
    ['small-lamp'] = true,
    ['small-plane'] = true,
    ['solar-panel'] = true,
    ['solar-panel-equipment'] = true,
    ['solid-fuel-from-heavy-oil'] = true,
    ['solid-fuel-from-light-oil'] = true,
    ['solid-fuel-from-petroleum-gas'] = true,
    ['speed-module'] = true,
    ['speed-module-2'] = true,
    ['speed-module-3'] = true,
    splitter = true,
    ['stack-filter-inserter'] = true,
    ['stack-inserter'] = true,
    ['steam-engine'] = true,
    ['steam-turbine'] = true,
    ['steel-chest'] = true,
    ['steel-furnace'] = true,
    ['steel-plate'] = true,
    ['stone-brick'] = true,
    ['stone-furnace'] = true,
    ['stone-wall'] = true,
    ['storage-tank'] = true,
    ['submachine-gun'] = true,
    substation = true,
    sulfur = true,
    ['sulfuric-acid'] = true,
    tank = true,
    ['train-stop'] = true,
    ['transport-belt'] = true,
    ['underground-belt'] = true,
    ['uranium-cannon-shell'] = true,
    ['uranium-fuel-cell'] = true,
    ['uranium-processing'] = true,
    ['uranium-rounds-magazine'] = true,
    ['utility-science-pack'] = true,
    ['wooden-chest'] = true
}

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
    automation = true,
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
    electronics = true,
    ['energy-shield-equipment'] = true,
    ['energy-shield-mk2-equipment'] = true,
    ['energy-weapons-damage-1'] = true,
    ['energy-weapons-damage-2'] = true,
    ['energy-weapons-damage-3'] = true,
    ['energy-weapons-damage-4'] = true,
    ['energy-weapons-damage-5'] = true,
    ['energy-weapons-damage-6'] = true,
    ['energy-weapons-damage-7'] = true,
    engine = true,
    ['exoskeleton-equipment'] = true,
    ['explosive-rocketry'] = true,
    explosives = true,
    ['fast-inserter'] = true,
    flamethrower = true,
    flammables = true,
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
    logistics = true,
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
    ['rocket-control-unit'] = true,
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

--[[ local recipe = data.raw.recipe
for k in pairs(recipe_blacklist) do
    recipe[k].enabled = false
end ]]

--[[ local output = {}

for k, v in pairs(data.raw.technology) do
    output[k] = true
end

log(serpent.block(output)) ]]
