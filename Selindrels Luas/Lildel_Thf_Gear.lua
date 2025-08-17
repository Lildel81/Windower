-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder','Proc')
	state.IdleMode:options('Normal', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Aeneas','AccAeneas','Savage','AccSavage','ProcWeapons','MagicWeapons','Evisceration','Throwing','SwordThrowing','Bow')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWMax','Parry'}
	state.AmbushMode = M(false, 'Ambush Mode')

	gear.da_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	gear.wsd_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}

    -- Additional local binds
    send_command('bind ^` input /ja "Flee" <me>')
    send_command('bind !` input /ra <t>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @f10 gs c toggle AmbushMode')
	send_command('bind ^backspace input /item "Thief\'s Tools" <t>')
	send_command('bind ^q gs c weapons ProcWeapons;gs c set WeaponSkillMode proc;')
	send_command('bind !q gs c weapons SwordThrowing')
	send_command('bind !backspace input /ja "Hide" <me>')
	send_command('bind ^r gs c weapons Default;gs c set WeaponSkillMode match') --Requips weapons and gear.
	send_command('bind !r gs c weapons MagicWeapons')
	send_command('bind ^\\\\ input /ja "Despoil" <t>')
	send_command('bind !\\\\ input /ja "Mug" <t>')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

	sets.TreasureHunter = {ammo = "Perfect Lucky egg",
	head="Volte Cap",
    body="Volte Jupon",
    hands={ name="Plun. Armlets +1", augments={'Enhances "Perfect Dodge" effect',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Skulk. Poulaines",
    waist="Chaac Belt",}
    sets.ExtraRegen = {}
    sets.Kiting = {feet="Jute Boots"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	
    sets.buff['Sneak Attack'] = {}
    sets.buff['Trick Attack'] = {}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.Suppa = {ear1="Suppanomimi", ear2="Sherida Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}
	sets.Parry = {hands="Turms Mittens +1",ring1="Defending Ring", feet = "Turms Leggings +1"}
	sets.Ambush = {} --body="Plunderer's Vest +1"
	
	-- Weapons sets
	sets.weapons.Aeneas = {main="Aeneas",sub="Gleti's Knife"}
	sets.weapons.AccAeneas = {main="Aeneas",sub="Tauret"}
	sets.weapons.Savage = {main="Naegling",sub="Gleti's Knife"}
	sets.weapons.AccSavage = {main="Naegling",sub="Tauret"}
	sets.weapons.ProcWeapons = {main="Blurred Knife +1",sub="Atoyac"}
	sets.weapons.MagicWeapons = {main="Malevolence",sub="Malevolence"}
	sets.weapons.Evisceration = {main="Tauret",sub="Gleti's Knife"}
	sets.weapons.Throwing = {main="Aeneas",sub="Blurred Knife +1",range="Raider's Bmrng.",ammo=empty}
	sets.weapons.SwordThrowing = {main="Naegling",sub="Blurred Knife +1",range="Raider's Bmrng.",ammo=empty}
	sets.weapons.Bow = {main="Aeneas",sub="Kustawi +1",range="Ullr",ammo="Chapuli Arrow"}
	
    -- Actions we want to use to tag TH.
    sets.precast.Step = {ammo="C. Palug Stone",
    head="Malignance Chapeau",
    body="Pillager's Vest +2",
    hands="Malignance Gloves",
    legs="Nyame Flanchard",
    feet="Malignance Boots",
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist="Kentarch Belt +1",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Regal Ring",
    right_ring="Mummu Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}
		
    sets.precast.JA['Violent Flourish'] = {ammo="C. Palug Stone",
    head="Malignance Chapeau",
    body="Pillager's Vest +2",
    hands="Malignance Gloves",
    legs="Nyame Flanchard",
    feet="Malignance Boots",
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist="Kentarch Belt +1",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Regal Ring",
    right_ring="Mummu Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}
		
	sets.precast.JA['Animated Flourish'] = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {"Skulker's Bonnet"}
    sets.precast.JA['Accomplice'] = {"Skulker's Bonnet"}
    sets.precast.JA['Flee'] = {feet="Pillager's Poulaines +1"} --feet="Pillager's Poulaines +1"
    sets.precast.JA['Hide'] = {body="Pillager's Vest +1"}
    sets.precast.JA['Conspirator'] = {body="Skulker's Vest"} 
    sets.precast.JA['Steal'] = {hands="Pill. Armlets +1"}
	sets.precast.JA['Mug'] = {}
    sets.precast.JA['Despoil'] = {legs="Skulker's Culottes",feet="Skulk. Poulaines +1"}
    sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
    sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {head = "Mummu's Bonnet +2",
    ammo="Yamarang",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    legs="Dashing Subligar",}

	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}
		
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    sets.precast.FC = {body="Dread Jupon",
    hands={ name="Leyline Gloves", augments={'Accuracy+9','Mag. Acc.+5','"Mag.Atk.Bns."+6','"Fast Cast"+1',}},
    left_ear="Loquac. Earring",
    left_ring="Prolix Ring",}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})


    -- Ranged snapshot gear
    sets.precast.RA = {}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="C. Palug Stone",
    head="Pill. Bonnet +2",
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Herculean Trousers", augments={'Rng.Acc.+14','DEX+8','Weapon skill damage +9%',}},
    feet={ name="Herculean Boots", augments={'AGI+6','Pet: Haste+1','Weapon skill damage +6%','Accuracy+16 Attack+16',}},
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Odr Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},}
	
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Odr Earring",body="Meg. Cuirie +2",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Malignance Boots"})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Odr Earring",body="Meg. Cuirie +2",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Malignance Boots"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {ammo="C. Palug Stone",
    head="Pill. Bonnet +2",
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Herculean Trousers", augments={'Rng.Acc.+14','DEX+8','Weapon skill damage +9%',}},
    feet={ name="Herculean Boots", augments={'AGI+6','Pet: Haste+1','Weapon skill damage +6%','Accuracy+16 Attack+16',}},
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Odr Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},})
	
    sets.precast.WS["Rudra's Storm"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="C. Palug Stone",
    head="Pill. Bonnet +2",
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Herculean Trousers", augments={'Rng.Acc.+14','DEX+8','Weapon skill damage +9%',}},
    feet={ name="Herculean Boots", augments={'AGI+6','Pet: Haste+1','Weapon skill damage +6%','Accuracy+16 Attack+16',}},
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Odr Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},})
	
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {ammo="C. Palug Stone",
    head="Pill. Bonnet +2",
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Herculean Trousers", augments={'Rng.Acc.+14','DEX+8','Weapon skill damage +9%',}},
    feet={ name="Herculean Boots", augments={'AGI+6','Pet: Haste+1','Weapon skill damage +6%','Accuracy+16 Attack+16',}},
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Odr Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},})
	
	sets.precast.WS["Rudra's Storm"].FullAcc = set_combine(sets.precast.WS.FullAcc, {back=gear.wsd_jse_back})
    sets.precast.WS["Rudra's Storm"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"], {body=gear.herculean_wsd_body})
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})

    sets.precast.WS["Mandalic Stab"] = set_combine(sets.precast.WS, {ammo="C. Palug Stone",
    head="Pill. Bonnet +2",
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Herculean Trousers", augments={'Rng.Acc.+14','DEX+8','Weapon skill damage +9%',}},
    feet={ name="Herculean Boots", augments={'AGI+6','Pet: Haste+1','Weapon skill damage +6%','Accuracy+16 Attack+16',}},
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Odr Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},})
	
    sets.precast.WS["Mandalic Stab"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="C. Palug Stone",
    head="Pill. Bonnet +2",
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Herculean Trousers", augments={'Rng.Acc.+14','DEX+8','Weapon skill damage +9%',}},
    feet={ name="Herculean Boots", augments={'AGI+6','Pet: Haste+1','Weapon skill damage +6%','Accuracy+16 Attack+16',}},
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Odr Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},})
	
    sets.precast.WS["Mandalic Stab"].Acc = set_combine(sets.precast.WS.Acc, {ammo="C. Palug Stone",
    head="Pill. Bonnet +2",
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Herculean Trousers", augments={'Rng.Acc.+14','DEX+8','Weapon skill damage +9%',}},
    feet={ name="Herculean Boots", augments={'AGI+6','Pet: Haste+1','Weapon skill damage +6%','Accuracy+16 Attack+16',}},
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Odr Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},})
	
	sets.precast.WS["Mandalic Stab"].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="C. Palug Stone",
    head="Pill. Bonnet +2",
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Herculean Trousers", augments={'Rng.Acc.+14','DEX+8','Weapon skill damage +9%',}},
    feet={ name="Herculean Boots", augments={'AGI+6','Pet: Haste+1','Weapon skill damage +6%','Accuracy+16 Attack+16',}},
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Odr Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},})
    sets.precast.WS["Mandalic Stab"].Fodder = set_combine(sets.precast.WS["Mandalic Stab"], {ammo="C. Palug Stone",body=gear.herculean_wsd_body})
    sets.precast.WS["Mandalic Stab"].SA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila +1",head="Adhemar Bonnet +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
    sets.precast.WS["Mandalic Stab"].TA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila +1",head="Adhemar Bonnet +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
    sets.precast.WS["Mandalic Stab"].SATA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila +1",head="Adhemar Bonnet +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})

    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Shark Bite"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Shark Bite"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Shark Bite"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Shark Bite"].Fodder = set_combine(sets.precast.WS["Shark Bite"], {ammo="C. Palug Stone",body=gear.herculean_wsd_body})
    sets.precast.WS["Shark Bite"].SA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
    sets.precast.WS["Shark Bite"].TA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
    sets.precast.WS["Shark Bite"].SATA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Yetshila",
    head="Gleti's Mask",
    body="Pillager's Vest +2",
    hands="Gleti's Gauntlets",
    legs="Pillager's Culottes",
    feet="Gleti's Boots",
    neck="Loricate Torque +1",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Odr Earring",
    left_ring="Mummu Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},})
	
    sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Yetshila",
    head="Gleti's Mask",
    body="Pillager's Vest +2",
    hands="Gleti's Gauntlets",
    legs="Pillager's Culottes",
    feet="Gleti's Boots",
    neck="Loricate Torque +1",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Odr Earring",
    left_ring="Mummu Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},})
	
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Yetshila",
    head="Gleti's Mask",
    body="Pillager's Vest +2",
    hands="Gleti's Gauntlets",
    legs="Pillager's Culottes",
    feet="Gleti's Boots",
    neck="Loricate Torque +1",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Odr Earring",
    left_ring="Mummu Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},})
	
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Yetshila",
    head="Gleti's Mask",
    body="Pillager's Vest +2",
    hands="Gleti's Gauntlets",
    legs="Pillager's Culottes",
    feet="Gleti's Boots",
    neck="Loricate Torque +1",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Odr Earring",
    left_ring="Mummu Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},})
	
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {})
	
    sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS, {neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Adhemar Jacket +1",back=gear.wsd_jse_back,waist="Sailfi Belt +1"})
    sets.precast.WS["Savage Blade"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {neck="Caro Necklace",ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
    sets.precast.WS["Savage Blade"].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
	sets.precast.WS["Savage Blade"].FullAcc = set_combine(sets.precast.WS.FullAcc, {back=gear.wsd_jse_back})
    sets.precast.WS["Savage Blade"].Fodder = set_combine(sets.precast.WS["Savage Blade"], {ammo="C. Palug Stone",body=gear.herculean_wsd_body,waist="Sailfi Belt +1"})
    sets.precast.WS["Savage Blade"].SA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
    sets.precast.WS["Savage Blade"].TA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})
    sets.precast.WS["Savage Blade"].SATA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +3"})

    sets.precast.WS.Proc = {ammo="Yamarang",
        head="Malignance Chapeau",neck="Voltsurge Torque",ear1="Digni. Earring",ear2="Heartseeker Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Varar Ring +1",ring2="Varar Ring +1",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.precast.WS['Last Stand'] = {
        head="Pill. Bonnet +3",neck="Fotia Gorget",ear1="Enervating Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Apate Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.precast.WS['Empyreal Arrow'] = {
        head="Pill. Bonnet +3",neck="Fotia Gorget",ear1="Enervating Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Apate Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.precast.WS['Aeolian Edge'] = {ammo="Pemphredo Tathlum",
    head="Nyame Helm",
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Herculean Trousers", augments={'CHR+8','"Mag.Atk.Bns."+23','Chance of successful block +5','Accuracy+6 Attack+6','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +3%','INT+15','Mag. Acc.+2',}},
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Hermetic Earring",
    left_ring="Shiva Ring +1",
    right_ring="Epaminondas's Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Sherida Earring"}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Sherida Earring"}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
        back="Moonlight Cape",waist="Tempus Fugit",legs="Rawhide Trousers",feet="Malignance Boots"}

    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})

	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)

    -- Ranged gear

    sets.midcast.RA = {head="Malignance Chapeau",
    body="Meg. Cuirie +2",
    hands="Malignance Gloves",
    legs="Meg. Chausses +2",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Enervating Earring",
    left_ring="Crepuscular Ring",
    right_ring="Paqichikaji Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}

    sets.midcast.RA.Acc = {head="Malignance Chapeau",
    body="Meg. Cuirie +2",
    hands="Malignance Gloves",
    legs="Meg. Chausses +2",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Enervating Earring",
    left_ring="Crepuscular Ring",
    right_ring="Paqichikaji Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {ammo="Staunch Tathlum",
    head="Gleti's Mask",
    body="Mekosu. Harness",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Jute Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Genmei Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}
		
    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

    sets.idle.Weak = set_combine(sets.idle, {})

	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.ExtraRegen = {hands="Turms Mittens +1"}

    -- Defense sets

    sets.defense.PDT = {ammo="Staunch Tathlum",
    head="Gleti's Mask",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Jute Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Genmei Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}

    sets.defense.MDT = {body="Mekosu. Harness"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Eabani Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}


    --------------------------------------
    -- Melee sets  
    --------------------------------------

    -- Normal melee group
    sets.engaged = {aammo="Aurgelmir Orb +1",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body="Pillager's Vest +2",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Rajas Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}
		
    sets.engaged.SomeAcc = {ammo="Aurgelmir Orb +1",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body="Pillager's Vest +2",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Rajas Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}
    
	sets.engaged.Acc = {ammo="Aurgelmir Orb +1",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body="Pillager's Vest +2",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Rajas Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}
		
    sets.engaged.FullAcc = {ammo="Yamarang",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body="Pillager's Vest +2",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Nyame Flanchard",
    feet="Malignance Boots",
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist="Kentarch Belt +1",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}

    sets.engaged.Fodder = {ammo="Yamarang",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body="Pillager's Vest +2",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Nyame Flanchard",
    feet="Malignance Boots",
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist="Kentarch Belt +1",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}

    sets.engaged.DT = {ammo="Crepuscular Pebble",
    head="Gleti's Mask",
    body="Ashera Harness",
    hands="Gleti's Gauntlets",
    legs="Meg. Chausses +2",
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}

    sets.engaged.SomeAcc.DT = {ammo="Crepuscular Pebble",
    head="Gleti's Mask",
    body="Ashera Harness",
    hands="Gleti's Gauntlets",
    legs="Meg. Chausses +2",
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}
		
    sets.engaged.Acc.DT = {ammo="Crepuscular Pebble",
    head="Gleti's Mask",
    body="Ashera Harness",
    hands="Gleti's Gauntlets",
    legs="Meg. Chausses +2",
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}

    sets.engaged.FullAcc.DT = {ammo="Crepuscular Pebble",
    head="Gleti's Mask",
    body="Ashera Harness",
    hands="Gleti's Gauntlets",
    legs="Meg. Chausses +2",
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}
		
    sets.engaged.Fodder.DT = {ammo="Crepuscular Pebble",
    head="Gleti's Mask",
    body="Ashera Harness",
    hands="Gleti's Gauntlets",
    legs="Meg. Chausses +2",
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck={ name="Asn. Gorget +2", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(8, 5)
    elseif player.sub_job == 'WAR' then
        set_macro_page(7, 5)
    elseif player.sub_job == 'NIN' then
        set_macro_page(10, 5)
    else
        set_macro_page(6, 5)
    end
end

--Job Specific Trust Override
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[993] < spell_latency and not have_trust("ArkEV") then
					windower.chat.input('/ma "AAEV" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[955] < spell_latency and not have_trust("Apururu") then
					windower.chat.input('/ma "Apururu (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.chat.input('/ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end