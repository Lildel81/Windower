-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','PDT')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','Num5IsAlive'}
	state.Weapons:options('Trishula','ShiningOne','Mercurial','Staff','Sword')
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}

    select_default_macro_book()
	
	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')
	send_command('bind @f7 gs c toggle AutoJumpMode')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind delete input /ma "Dia" <t>')
	send_command('bind end input /ja "Restoring Breath" <me>')
	send_command('bind numpad0 /ja "High Jump" <t>')
	
	
	
	send_command('alias clean input //org organize all clean.lua')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA.Angon = {ammo="Angon", hands="Ptero. Fin. G. +3"}
	sets.precast.JA.Jump = {ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Ptero. Mail +3", augments={'Enhances "Spirit Surge" effect',}},
    hands="Vis. Fng. Gaunt. +2",
    legs={ name="Valorous Hose", augments={'"Mag.Atk.Bns."+1','"Store TP"+8','STR+6','Attack+3',}},
    feet="Sulev. Leggings +2",
    neck="Anu Torque",
    waist="Kentarch Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	
	sets.precast.JA['Ancient Circle'] = {} --legs="Vishap Brais"
	sets.precast.JA['High Jump'] = {ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Ptero. Mail +3", augments={'Enhances "Spirit Surge" effect',}},
    hands="Vis. Fng. Gaunt. +2",
    legs="Vishap Brais +3",
    feet="Sulev. Leggings +2",
    neck="Anu Torque",
    waist="Kentarch Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	
	sets.precast.JA['Soul Jump'] = {ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body="Vishap Mail +2",
    hands={ name="Acro Gauntlets", augments={'Accuracy+14 Attack+14','"Store TP"+4','STR+7 DEX+7',}},
    legs={ name="Valorous Hose", augments={'"Mag.Atk.Bns."+1','"Store TP"+8','STR+6','Attack+3',}},
    feet="Sulev. Leggings +2",
    neck="Anu Torque",
    waist="Kentarch Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	
	sets.precast.JA['Spirit Jump'] = {ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Ptero. Mail +3", augments={'Enhances "Spirit Surge" effect',}},
    hands="Vis. Fng. Gaunt. +2",
    legs={ name="Valorous Hose", augments={'"Mag.Atk.Bns."+1','"Store TP"+8','STR+6','Attack+3',}},
    feet="Sulev. Leggings +2",
    neck="Anu Torque",
    waist="Kentarch Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	
	sets.precast.JA['Super Jump'] = {}
	sets.precast.JA['Spirit Link'] = {head="Vishap Armet +2",hands="Pel. Vambraces +1",} --head="Vishap Armet",hands="Lnc. Vmbrc. +2"
	sets.precast.JA['Call Wyvern'] = {body="Pteroslaver Mail +3"}
	sets.precast.JA['Deep Breathing'] = {head={ name="Ptero. Armet +2", augments={'Enhances "Deep Breathing" effect',}},} --hands="Ptero. Armet +1"
	sets.precast.JA['Spirit Surge'] = {body="Pteroslaver Mail +3"} --body="Ptero. Mail +1"
	sets.precast.JA['Steady Wing'] = {}
	
	-- Breath sets
	sets.precast.JA['Restoring Breath'] = {back="Brigantia's Mantle", head="Vishap Armet +2"}
	sets.precast.JA['Smiting Breath'] = {back="Brigantia's Mantle", head="Pteroslaver Armet +2"}
	sets.HealingBreath = {back="Brigantia's Mantle", head="Vishap Armet +2"}
	sets.SmitingBreath = {back="Brigantia's Mantle", head="Pteroslaver Armet +2"}

	-- Fast cast sets for spells
	
	sets.precast.FC = {--ammo="Impatiens",
		--head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		--body="Taeon Tabard",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		--back="Moonlight Cape",waist="Flume Belt",legs="Founder's Greaves",feet="Carmine Greaves +1"
		ammo="Staunch Tathlum",
    head="Vishap Armet +2",
    body={ name="Taeon Tabard", augments={'Accuracy+14 Attack+14','Crit.hit rate+2','Crit. hit damage +3%',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+9','Mag. Acc.+5','"Mag.Atk.Bns."+6','"Fast Cast"+1',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Valorous Greaves", augments={'Damage taken-4%','VIT+8','Attack+13',}},
    neck="Dragoon's Collar +1",
    waist="Flume Belt",
    left_ear="Sherida Earring",
    right_ear="Loquac. Earring",
    left_ring="Defending Ring",
    right_ring="Prolix Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.midcast.Cure = {head="Pteroslaver Armet +2"}
	
	sets.Self_Healing = {}--neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"
	sets.Cure_Received = {}--neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"
	sets.Self_Refresh = {}--waist="Gishdubar Sash"
	
	-- Midcast Sets
	sets.midcast.FastRecast = {
	--ammo="Staunch Tathlum",
	--	head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
	--	body="Taeon Tabard",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
	--	back="Moonlight Cape",waist="Tempus Fugit",legs="Founder's Greaves",feet="Carmine Greaves +1"
	ammo="Staunch Tathlum",
    head="Pteroslaver Armet +2",
    body={ name="Taeon Tabard", augments={'Accuracy+14 Attack+14','Crit.hit rate+2','Crit. hit damage +3%',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+9','Mag. Acc.+5','"Mag.Atk.Bns."+6','"Fast Cast"+1',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Valorous Greaves", augments={'Damage taken-4%','VIT+8','Attack+13',}},
    neck="Dragoon's Collar +1",
    waist="Flume Belt",
    left_ear="Sherida Earring",
    right_ear="Loquac. Earring",
    left_ring="Defending Ring",
    right_ring="Prolix Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Damage taken-5%',}},}
		
	-- Put HP+ gear and the AF head to make healing breath trigger more easily with this set.
	sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {head="Vishap Armet +2"})
	
	sets.midcast.Phalanx = {head={ name="Taeon Chapeau", augments={'Spell interruption rate down -8%','Phalanx +2',}},
    body={ name="Valorous Mail", augments={'Enmity+6','"Repair" potency +2%','Phalanx +4','Accuracy+17 Attack+17','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    hands={ name="Taeon Gloves", augments={'Phalanx +3',}},
    legs={ name="Taeon Tights", augments={'Phalanx +3',}},
    feet={ name="Taeon Boots", augments={'Spell interruption rate down -7%','Phalanx +3',}},}
	
	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Weapon skill damage +3%','STR+9','Accuracy+14','Attack+6',}},
    body={ name="Valorous Mail", augments={'Pet: Accuracy+20 Pet: Rng. Acc.+20','Weapon skill damage +4%','Accuracy+14 Attack+14',}},
    hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
    legs="Vishap Brais +3",
    feet={ name="Valorous Greaves", augments={'Pet: "Dbl.Atk."+1 Pet: Crit.hit rate +1','Mag. Acc.+3','Weapon skill damage +4%',}},
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Thrud Earring",
    right_ear="Ishvara Earring",
    left_ring="Beithir Ring",
    right_ring="Karieyh Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}
		
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Weapon skill damage +3%','STR+9','Accuracy+14','Attack+6',}},
    body={ name="Valorous Mail", augments={'Pet: Accuracy+20 Pet: Rng. Acc.+20','Weapon skill damage +4%','Accuracy+14 Attack+14',}},
    hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
    legs="Vishap Brais +3",
    feet="Sulev. Leggings +2",
    neck="Breeze Gorget",
    waist="Thunder Belt",
    left_ear="Thrud Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},})
	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Weapon skill damage +3%','STR+9','Accuracy+14','Attack+6',}},
    body="Vishap Mail +2",
    hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
    legs="Vishap Brais +3",
    feet="Sulev. Leggings +2",
    neck="Breeze Gorget",
    waist="Thunder Belt",
    left_ear="Thrud Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},})
	
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {ammo="Voluspa Tathlum",
    head="Vishap Armet +2",
    body="Vishap Mail +2",
    hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
    legs="Vishap Brais +3",
    feet="Sulev. Leggings +2",
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},})
	
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
	right_ring="Mujin Band",})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Attack+16','"Dbl.Atk."+5','STR+2',}},
    hands="Sulev. Gauntlets +2",
    legs={ name="Valorous Hose", augments={'Attack+13','"Dbl.Atk."+4','DEX+2','Accuracy+10',}},
    feet="Flam. Gambieras +2",
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist="Soil Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},})
	-- 1233 Acc
	sets.precast.WS['Stardiver'].SomeAcc = set_combine(sets.precast.WS.Acc, {ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Vishap Mail +2",
    hands="Sulev. Gauntlets +2",
    legs={ name="Valorous Hose", augments={'Attack+13','"Dbl.Atk."+4','DEX+2','Accuracy+10',}},
    feet="Flam. Gambieras +2",
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist="Soil Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},})
	
	sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Vishap Mail +2",
    hands="Sulev. Gauntlets +2",
    legs="Vishap Brais +3",
    feet="Flam. Gambieras +2",
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist="Soil Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},})
	
	sets.precast.WS['Stardiver'].Fodder = set_combine(sets.precast.WS['Stardiver'], {head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
	right_ring="Mujin Band",})
	

	sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body="Sulevia's Plate. +1",
    hands="Flam. Manopolas +1",
    legs={ name="Valorous Hose", augments={'Attack+13','"Dbl.Atk."+4','DEX+2','Accuracy+10',}},
    feet={ name="Valorous Greaves", augments={'Accuracy+26','Crit. hit damage +4%',}},
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Begrudging Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},})
	
	sets.precast.WS['Drakesbane'].SomeAcc = set_combine(sets.precast.WS.Acc, {ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body="Sulevia's Plate. +1",
    hands="Flam. Manopolas +1",
    legs="Vishap Brais +3",
    feet={ name="Valorous Greaves", augments={'Accuracy+26','Crit. hit damage +4%',}},
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Begrudging Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},})
	
	sets.precast.WS['Drakesbane'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body="Sulevia's Plate. +1",
    hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
    legs="Vishap Brais +3",
    feet={ name="Valorous Greaves", augments={'Accuracy+26','Crit. hit damage +4%',}},
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Begrudging Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},})
	
	sets.precast.WS['Drakesbane'].Fodder = set_combine(sets.precast.WS['Drakesbane'], {head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
	right_ring="Mujin Band",})
	
	sets.precast.WS['Camlann\'s Torment'] = {ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Weapon skill damage +3%','STR+9','Accuracy+14','Attack+6',}},
    body={ name="Valorous Mail", augments={'Pet: Accuracy+20 Pet: Rng. Acc.+20','Weapon skill damage +4%','Accuracy+14 Attack+14',}},
    hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
    legs="Vishap Brais +3",
    feet={ name="Valorous Greaves", augments={'Pet: "Dbl.Atk."+1 Pet: Crit.hit rate +1','Mag. Acc.+3','Weapon skill damage +4%',}},
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Thrud Earring",
    right_ear="Ishvara Earring",
    left_ring="Beithir Ring",
    right_ring="Karieyh Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Camlann\'s Torment'].SomeAcc ={ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Weapon skill damage +3%','STR+9','Accuracy+14','Attack+6',}},
    body={ name="Valorous Mail", augments={'Pet: Accuracy+20 Pet: Rng. Acc.+20','Weapon skill damage +4%','Accuracy+14 Attack+14',}},
    hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
    legs="Vishap Brais +3",
    feet={ name="Valorous Greaves", augments={'Pet: "Dbl.Atk."+1 Pet: Crit.hit rate +1','Mag. Acc.+3','Weapon skill damage +4%',}},
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Thrud Earring",
    right_ear="Ishvara Earring",
    left_ring="Beithir Ring",
    right_ring="Karieyh Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Camlann\'s Torment'].Acc ={ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Weapon skill damage +3%','STR+9','Accuracy+14','Attack+6',}},
    body="Vishap Mail +2",
    hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
    legs="Vishap Brais +3",
    feet="Sulev. Leggings +2",
    neck="Breeze Gorget",
    waist="Thunder Belt",
    left_ear="Thrud Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},} 
	
	sets.precast.WS['Camlann\'s Torment'].Fodder = set_combine(sets.precast.WS['Camlann\'s Torment'], {head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
	right_ring="Mujin Band",})
	
	sets.precast.WS['Impulse Drive'] = {ammo="Knobkierrie",
    head="Gleti's Mask",
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Impulse Drive'].SomeAcc ={ammo="Knobkierrie",
    head="Gleti's Mask",
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Impulse Drive'].Acc={ammo="Knobkierrie",
    head="Vishap Armet +2",
    body="Vishap Mail +2",
    hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
    legs="Vishap Brais +3",
    feet="Sulev. Leggings +2",
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Impulse Drive'].Fodder=set_combine(sets.precast.WS['Impulse Drive'], {head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
	right_ring="Mujin Band",})

    sets.precast.WS['Leg Sweep']={ammo="Pemphredo Tathlum",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +1",
    hands="Flam. Manopolas +1",
    legs="Flamma Dirs +2",
    feet="Flam. Gambieras +2",
    neck="Sanctity Necklace",
    waist="Light Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Digni. Earring",
    left_ring="Flamma Ring",
    right_ring="Stikini Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}

	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum",
    head="Gleti's Mask",
    body="Makora Meikogai",
    hands="Gleti's Gauntlets",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Gleti's Boots",
    neck="Berserker's Torque",
    waist="Flume Belt",
    left_ear="Genmei Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		
	sets.idle.Refresh = {ammo="Staunch Tathlum",
    head={ name="Valorous Mask", augments={'Accuracy+30','"Dbl.Atk."+1',}},
    body="Makora Meikogai",
    hands="Arke Manopolas",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Sulev. Leggings +2",
    neck="Berserker's Torque",
    waist="Flume Belt",
    left_ear="Infused Earring",
    right_ear="Handler's Earring +1",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}

	sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
	
	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum",
    head="Arke Zuchetto",
    body="Arke Corazza",
    hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
    legs="Vishap Brais +3",
    feet="Sulev. Leggings +2",
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Enmerkar Earring",
    right_ear="Handler's Earring +1",
    left_ring="Defending Ring",
    right_ring="Sulevia's Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {ammo="Staunch Tathlum",
    head="Arke Zuchetto",
    body="Arke Corazza",
    hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
    legs="Vishap Brais +3",
    feet="Sulev. Leggings +2",
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Enmerkar Earring",
    right_ear="Handler's Earring +1",
    left_ring="Defending Ring",
    right_ring="Sulevia's Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {
	--ammo="Staunch Tathlum",
	--	head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
	--	body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
	--	back="Moonlight Cape",waist="Flume Belt",legs="Arke Cosciales",feet="Amm Greaves"
	ammo="Staunch Tathlum",
    head="Arke Zuchetto",
    body="Arke Corazza",
    hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
    legs="Vishap Brais +3",
    feet="Sulev. Leggings +2",
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Enmerkar Earring",
    right_ear="Handler's Earring +1",
    left_ring="Defending Ring",
    right_ring="Sulevia's Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet", neck="Berserker's Torque"}
	
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.passive.MP = {ear2="Ethereal Earring",waist="Flume Belt"}
    sets.passive.Twilight = {head="Twilight Helm", body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {head="Volte Cap",
    hands="Volte Bracers",
    legs={ name="Valorous Hose", augments={'VIT+8','MND+3','"Treasure Hunter"+1','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    waist="Chaac Belt",})
	
	-- Weapons sets
	sets.weapons.Trishula = {main="Trishula",sub="Utu Grip"}
	sets.weapons.ShiningOne = {main="Shining One", sub="Utu Grip",}
	sets.weapons.Mercurial = {main="Mercurial Spear",sub="Utu Grip",}
	sets.weapons.Staff = {main="Reikikon",sub="Utu Grip",}
	sets.weapons.Sword = {main="Naegling",sub={ name="Demers. Degen +1", augments={'Path: A',}},}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccDayWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Moonshade Earring",ear2="Sherida Earring",}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group

	sets.engaged = {ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands="Sulev. Gauntlets +2",
    legs={ name="Valorous Hose", augments={'Attack+13','"Dbl.Atk."+4','DEX+2','Accuracy+10',}},
    feet="Flam. Gambieras +2",
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Sherida Earring",
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	-- 1179 Base Acc. 43 Base STP
	
    sets.engaged.SomeAcc = {ammo="Voluspa Tathlum",
    head="Hjarrandi Helm",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands="Sulev. Gauntlets +2",
    legs={ name="Valorous Hose", augments={'Attack+13','"Dbl.Atk."+4','DEX+2','Accuracy+10',}},
    feet="Flam. Gambieras +2",
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	--1228 Base Acc. || 60 Base STP
	
	sets.engaged.Acc = {ammo="Voluspa Tathlum",
    head="Hjarrandi Helm",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands="Sulev. Gauntlets +2",
    legs="Flamma Dirs +2",
    feet="Flam. Gambieras +2",
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	--1296 Base Acc || 33 STP
	
    sets.engaged.FullAcc = {ammo="Voluspa Tathlum",
    head="Vishap Armet +2",
    body="Vishap Mail +2",
    hands="Vis. Fng. Gaunt. +2",
    legs="Vishap Brais +3",
    feet="Flam. Gambieras +2",
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist="ioskeha belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},} 
	-- 1361 Base Acc. || 60 Baset STP 
	
    sets.engaged.Fodder = {ammo="Ginsen",
    head="Arke Zuchetto",
    body="Onca Suit",
    neck="Dragoon's Collar +1",
    waist="Kentarch Belt +1",
    left_ear="Domin. Earring +1",
    right_ear="Mache Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.engaged.AM = {}
    sets.engaged.AM.SomeAcc = {}
	sets.engaged.AM.Acc = {}
    sets.engaged.AM.FullAcc = {}
    sets.engaged.AM.Fodder = {}
	
    sets.engaged.PDT = {ammo="Ginsen",
    head="Hjarrandi Helm",
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +2",
    legs="Sulevi. Cuisses +1",
    feet="Flam. Gambieras +2",
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist="ioskeha belt +1",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	--1202 Base Acc. || 27 STP || 50 PDT
	
    sets.engaged.SomeAcc.PDT = {ammo="Ginsen",
    head="Hjarrandi Helm",
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +2",
    legs="Sulevi. Cuisses +1",
    feet="Flam. Gambieras +2",
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist="ioskeha belt +1",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	--1241 Base Acc. || 18 STP || 50 PDT
	
	sets.engaged.Acc.PDT = {ammo="Ginsen",
    head="Hjarrandi Helm",
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +2",
    legs="Sulevi. Cuisses +1",
    feet="Flam. Gambieras +2",
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist="ioskeha belt +1",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	--1260 Base ACC. || 21 STP || 50 PDT
	
    sets.engaged.FullAcc.PDT = {ammo="Voluspa Tathlum",
    head="Hjarrandi Helm",
    body="Arke Corazza",
    hands="Arke Manopolas",
    legs="Sulevi. Cuisses +1",
    feet="Sulev. Leggings +2",
    neck={ name="Dgn. Collar +1", augments={'Path: A',}},
    waist="Kentarch Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	--1296 Base Acc. || 10 STP || 40 PDT
	
    sets.engaged.Fodder.PDT = {ammo="Ginsen",
    head="Arke Zuchetto",
    body="Onca Suit",
    neck="Dragoon's Collar +1",
    waist="Kentarch Belt +1",
    left_ear="Domin. Earring +1",
    right_ear="Mache Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.engaged.Num5IsAlive = {}
	
    sets.engaged.AM.PDT = {}
    sets.engaged.AM.SomeAcc.PDT = {}
	sets.engaged.AM.Acc.PDT = {}
    sets.engaged.AM.FullAcc.PDT = {}
    sets.engaged.AM.Fodder.PDT = {}
		
	--[[ Melee sets for in Adoulin, which has an extra 2% Haste from Ionis.
	
    sets.engaged.Adoulin = {}
    sets.engaged.Adoulin.SomeAcc = {}
	sets.engaged.Adoulin.Acc = {}
    sets.engaged.Adoulin.FullAcc = {}
    sets.engaged.Adoulin.Fodder = {}

    sets.engaged.Adoulin.AM = {}
    sets.engaged.Adoulin.AM.SomeAcc = {}
	sets.engaged.Adoulin.AM.Acc = {}
    sets.engaged.Adoulin.AM.FullAcc = {}
    sets.engaged.Adoulin.AM.Fodder = {}
	
    sets.engaged.Adoulin.PDT = {}
    sets.engaged.Adoulin.SomeAcc.PDT = {}
	sets.engaged.Adoulin.Acc.PDT = {}
    sets.engaged.Adoulin.FullAcc.PDT = {}
    sets.engaged.Adoulin.Fodder.PDT = {}
	
    sets.engaged.Adoulin.AM.PDT = {}
    sets.engaged.Adoulin.AM.SomeAcc.PDT = {}
	sets.engaged.Adoulin.AM.Acc.PDT = {}
    sets.engaged.Adoulin.AM.FullAcc.PDT = {}
    sets.engaged.Adoulin.AM.Fodder.PDT = {}
	]]

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'BLU' then
        set_macro_page(1, 1)
    else
        set_macro_page(1, 1)
    end
end