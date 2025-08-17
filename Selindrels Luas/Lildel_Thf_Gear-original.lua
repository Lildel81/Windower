-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','PDT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
	state.IdleMode:options('Normal', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Aeneas','MagicWeapons','LowBuff','Throwing','TH')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWEarrings','DWMax'}
	state.AmbushMode = M(false, 'Ambush Mode')

	gear.da_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	gear.wsd_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}

    -- Additional local binds
    send_command('bind ^` input /ja "Flee" <me>')
    send_command('bind !` input /ra <t>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @f10 gs c toggle AmbushMode')
	send_command('bind ^backspace gs c weapons Throwing;gs c update')
	send_command('bind !backspace input /ja "Hide" <me>')
	send_command('bind !r gs c weapons MagicWeapons;gs c update')
	send_command('bind ^\\\\ input /ja "Despoil" <t>')
	send_command('bind !\\\\ input /ja "Mug" <t>')
	

	
	send_command(';wait 1.0;lua l invspace')
	send_command(';wait 1.0;lua l skillchains')
	send_command('alias clean input //org organize all clean.lua')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {ammo = "Perfect Lucky egg",
	head="Volte Cap",
    body="Volte Jupon",
    hands={ name="Plun. Armlets +1", augments={'Enhances "Perfect Dodge" effect',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Skulk. Poulaines",
    waist="Chaac Belt",})
    sets.ExtraRegen = {}
    sets.Kiting = {feet="Skadi's Jambeaux +1"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	
    sets.buff['Sneak Attack'] = {ammo="Falcon Eye",
    head="Pill. Bonnet +2",
    body="Meg. Cuirie +2",
    hands="Pill. Armlets +2",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+22','Crit. hit damage +3%','INT+4','Mag. Acc.+8',}},
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}
	
    sets.buff['Trick Attack'] = {ammo="Falcon Eye",
    head="Pill. Bonnet +2",
    body="Meg. Cuirie +2",
    hands="Pill. Armlets +2",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+22','Crit. hit damage +3%','INT+4','Mag. Acc.+8',}},
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}
		
    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.Suppa = {ear1="Suppanomimi", ear2="Sherida Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}
	sets.Ambush = {body="Plunderer's Vest +1"} --body="Plunderer's Vest +1"
	
	-- Weapons sets
	sets.weapons.Aeneas = {main="Aeneas",sub="Gleti's Knife",}
	sets.weapons.LowBuff = {main="Tauret",sub="Blurred Knife +1",}
	sets.weapons.MagicWeapons = {main="Malevolence",sub="Malevolence"}
	sets.weapons.Throwing = {main="Aeneas",sub="Gleti's Knife",range="Antitail",ammo=empty}
	sets.weapons.TH = {main={ name="Sandung", augments={'Accuracy+50','Crit. hit rate+5%','"Triple Atk."+3',}},sub="Thief's Knife",}
	
    -- Actions we want to use to tag TH.
    sets.precast.Step = {ammo="Falcon Eye",
        head="Dampening Tam",neck="Combatant's Torque",ear1="Telos Earring",ear2="Digni. Earring",
        body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Olseni Belt",legs="Mummu Kecks +2",feet=gear.herculean_acc_feet}
		
    sets.precast.JA['Violent Flourish'] = {ammo="Falcon Eye",
        head="Dampening Tam",neck="Combatant's Torque",ear1="Telos Earring",ear2="Digni. Earring",
        body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Olseni Belt",legs="Mummu Kecks +2",feet=gear.herculean_acc_feet}
		
	sets.precast.JA['Animated Flourish'] = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {} --head="Skulker's Bonnet"
    sets.precast.JA['Accomplice'] = {} --head="Skulker's Bonnet"
    sets.precast.JA['Flee'] = {feet="Pillager's Poulaines +1"} --feet="Pillager's Poulaines +1"
    sets.precast.JA['Hide'] = {body="Pillager's Vest +2"} --body="Pillager's Vest +1"
    sets.precast.JA['Conspirator'] = {} --body="Skulker's Vest"
    sets.precast.JA['Steal'] = {hands="Pill. Armlets +1"}
	sets.precast.JA['Mug'] = {}
    sets.precast.JA['Despoil'] = {legs="Skulker's Culottes",feet="Skulk. Poulaines +1"}
    sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
    sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Mummu Bonnet +2",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}

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
    sets.precast.RA = {range="Antitail"}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Mantoptera Eye",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body={ name="Herculean Vest", augments={'Weapon skill damage +4%','DEX+10','Attack+10',}},
    hands="Pill. Armlets +2",
    legs={ name="Herculean Trousers", augments={'Accuracy+16','Weapon skill damage +4%',}},
    feet="Mummu Gamash. +1",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {neck="Combatant's Torque",ear1="Telos Earring",body="Meg. Cuirie +2",waist="Olseni Belt",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque",ear1="Telos Earring",body="Meg. Cuirie +2",waist="Olseni Belt",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {ammo="Falcon Eye",
    head="Pill. Bonnet +2",
    body={ name="Herculean Vest", augments={'Weapon skill damage +4%','DEX+10','Attack+10',}},
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Accuracy+16','Weapon skill damage +4%',}},
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
    sets.precast.WS["Rudra's Storm"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Falcon Eye",
    head="Pill. Bonnet +2",
    body={ name="Herculean Vest", augments={'Weapon skill damage +4%','DEX+10','Attack+10',}},
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Accuracy+16','Weapon skill damage +4%',}},
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Falcon Eye",
    head="Pill. Bonnet +2",
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Accuracy+16','Weapon skill damage +4%',}},
    feet="Meg. Jam. +2",
    neck="Sanctity Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
	sets.precast.WS["Rudra's Storm"].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Falcon Eye",
    head="Pill. Bonnet +2",
    body="Pillager's Vest +2",
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Accuracy+16','Weapon skill damage +4%',}},
    feet="Meg. Jam. +2",
    neck="Sanctity Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
    sets.precast.WS["Rudra's Storm"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"], {body=gear.herculean_wsd_body})
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila",
    head="Pill. Bonnet +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs="Darraigner's Brais",
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila",
    head="Pill. Bonnet +2",
    body="Meg. Cuirie +2",
    hands="Pill. Armlets +2",
    legs="Darraigner's Brais",
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila",
    head="Pill. Bonnet +2",
    body="Meg. Cuirie +2",
    hands="Pill. Armlets +2",
    legs="Darraigner's Brais",
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})

    sets.precast.WS["Mandalic Stab"] = set_combine(sets.precast.WS, {ammo="Falcon Eye",
    head={ name="Lustratio Cap +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    body={ name="Herculean Vest", augments={'Weapon skill damage +4%','DEX+10','Attack+10',}},
    hands="Meg. Gloves +2",
    legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5',}},})
	
    sets.precast.WS["Mandalic Stab"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Falcon Eye",
    head="Pill. Bonnet +2",
    body={ name="Herculean Vest", augments={'Weapon skill damage +4%','DEX+10','Attack+10',}},
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Accuracy+16','Weapon skill damage +4%',}},
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
    sets.precast.WS["Mandalic Stab"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Falcon Eye",
    head="Pill. Bonnet +2",
    body={ name="Herculean Vest", augments={'Weapon skill damage +4%','DEX+10','Attack+10',}},
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Accuracy+16','Weapon skill damage +4%',}},
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
	sets.precast.WS["Mandalic Stab"].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Falcon Eye",
    head="Pill. Bonnet +2",
    body="Pillager's Vest +2",
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Accuracy+16','Weapon skill damage +4%',}},
    feet="Meg. Jam. +2",
    neck="Lissome Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
    sets.precast.WS["Mandalic Stab"].Fodder = set_combine(sets.precast.WS["Mandalic Stab"], {body=gear.herculean_wsd_body})
    sets.precast.WS["Mandalic Stab"].SA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila",
    head="Pill. Bonnet +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs="Darraigner's Brais",
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
    sets.precast.WS["Mandalic Stab"].TA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila",
    head="Pill. Bonnet +2",
    body="Meg. Cuirie +2",
    hands="Pill. Armlets +2",
    legs="Darraigner's Brais",
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
    sets.precast.WS["Mandalic Stab"].SATA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila",
    head="Pill. Bonnet +2",
    body="Meg. Cuirie +2",
    hands="Pill. Armlets +2",
    legs="Darraigner's Brais",
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})

    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {ammo="Falcon Eye",
    head="Pill. Bonnet +2",
    body={ name="Herculean Vest", augments={'Weapon skill damage +4%','DEX+10','Attack+10',}},
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Accuracy+16','Weapon skill damage +4%',}},
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
    sets.precast.WS["Shark Bite"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Falcon Eye",
    head="Pill. Bonnet +2",
    body={ name="Herculean Vest", augments={'Weapon skill damage +4%','DEX+10','Attack+10',}},
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Accuracy+16','Weapon skill damage +4%',}},
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
    sets.precast.WS["Shark Bite"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Falcon Eye",
    head="Pill. Bonnet +2",
    body={ name="Herculean Vest", augments={'Weapon skill damage +4%','DEX+10','Attack+10',}},
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Accuracy+16','Weapon skill damage +4%',}},
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
	sets.precast.WS["Shark Bite"].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Falcon Eye",
    head="Pill. Bonnet +2",
    body="Pillager's Vest +2",
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Accuracy+16','Weapon skill damage +4%',}},
    feet="Meg. Jam. +2",
    neck="Lissome Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
    sets.precast.WS["Shark Bite"].Fodder = set_combine(sets.precast.WS["Shark Bite"], {body=gear.herculean_wsd_body})
	
    sets.precast.WS["Shark Bite"].SA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila",
    head="Pill. Bonnet +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs="Darraigner's Brais",
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
    sets.precast.WS["Shark Bite"].TA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila",
    head="Pill. Bonnet +2",
    body="Meg. Cuirie +2",
    hands="Pill. Armlets +2",
    legs="Darraigner's Brais",
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
    sets.precast.WS["Shark Bite"].SATA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila",
    head="Pill. Bonnet +2",
    body="Meg. Cuirie +2",
    hands="Pill. Armlets +2",
    legs="Darraigner's Brais",
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Yetshila",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body="Abnoba Kaftan",
    hands="Mummu Wrists +2",
    legs="Darraigner's Brais",
    feet="Mummu Gamash. +1",
    neck="Lissome Necklace",
    waist="Breeze Belt",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Begrudging Ring",
    right_ring="Mummu Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
    sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Yetshila",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body="Abnoba Kaftan",
    hands="Mummu Wrists +2",
    legs="Darraigner's Brais",
    feet="Mummu Gamash. +1",
    neck="Lissome Necklace",
    waist="Breeze Belt",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Begrudging Ring",
    right_ring="Mummu Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Yetshila",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body="Abnoba Kaftan",
    hands="Mummu Wrists +2",
    legs="Darraigner's Brais",
    feet="Mummu Gamash. +1",
    neck="Lissome Necklace",
    waist="Breeze Belt",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Begrudging Ring",
    right_ring="Mummu Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Yetshila",
    head="Pill. Bonnet +2",
    body="Pillager's Vest +2",
    hands="Mummu Wrists +2",
    legs="Darraigner's Brais",
    feet="Mummu Gamash. +1",
    neck="Lissome Necklace",
    waist="Breeze Belt",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Mummu Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'].Fodder, {ammo="Yetshila",
    head="Pill. Bonnet +2",
    body="Meg. Cuirie +2",
    hands="Pill. Armlets +2",
    legs="Darraigner's Brais",
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
    sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].Fodder, {ammo="Yetshila",
    head="Pill. Bonnet +2",
    body="Meg. Cuirie +2",
    hands="Pill. Armlets +2",
    legs="Darraigner's Brais",
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})
	
    sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].Fodder, {ammo="Yetshila",
    head="Pill. Bonnet +2",
    body="Meg. Cuirie +2",
    hands="Pill. Armlets +2",
    legs="Darraigner's Brais",
    feet="Meg. Jam. +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},})

    sets.precast.WS['Last Stand'] = {
        head="Mummu Bonnet +2",neck="Fotia Gorget",ear1="Clearview Earring",ear2="Neritic Earring",
        body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Apate Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

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
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Sherida Earring"}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
        back="Moonlight Cape",waist="Tempus Fugit",legs="Rawhide Trousers",feet=gear.herculean_dt_feet}

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

    sets.midcast.RA.Acc = {
        head="Pill. Bonnet +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Volley Earring",
    right_ear="Mache Earring",
    left_ring="Regal Ring",
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
		
    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

    sets.idle.Weak = set_combine(sets.idle, {})

	sets.DayIdle = {}
	sets.NightIdle = {}

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

    sets.defense.MDT = {aammo="Staunch Tathlum",
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
    sets.engaged = {ammo="Aurgelmir Orb +1",
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
    left_ring="Regal Ring",
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
    left_ring="Regal Ring",
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
    head="Meghanada Visor +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Meg. Jam. +2",
    neck="Loricate Torque +1",
    waist="Windbuffet Belt +1",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}

    sets.engaged.PDT = {ammo="Yamarang",
    head="Meghanada Visor +2",
    body="Emet Harness +1",
    hands="Malignance Gloves",
    legs="Mummu Kecks +1",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Windbuffet Belt +1",
    left_ear="Sherida Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back="Moonbeam Cape",}

    sets.engaged.SomeAcc.PDT = {ammo="Yamarang",
    head="Meghanada Visor +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Meg. Jam. +2",
    neck="Loricate Torque +1",
    waist="Windbuffet Belt +1",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}
		
    sets.engaged.Acc.PDT = {ammo="Yamarang",
    head="Meghanada Visor +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Meg. Jam. +2",
    neck="Loricate Torque +1",
    waist="Windbuffet Belt +1",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}

    sets.engaged.FullAcc.PDT = {ammo="Yamarang",
    head="Meghanada Visor +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Meg. Jam. +2",
    neck="Loricate Torque +1",
    waist="Windbuffet Belt +1",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Store TP"+10','Damage taken-5%',}},}
		
    sets.engaged.Fodder.PDT = {ammo="Staunch Tathlum",
        head="Dampening Tam",neck="Loricate Torque +1",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Meg. Chausses +2",feet=gear.herculean_dt_feet}
		
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 6)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 6)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 6)
    else
        set_macro_page(1, 6)
    end
end