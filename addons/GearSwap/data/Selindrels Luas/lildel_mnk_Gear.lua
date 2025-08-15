function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc', 'Fodder')
    state.WeaponskillMode:options('Match','Normal', 'SomeAcc', 'Acc', 'FullAcc', 'Fodder')
    state.HybridMode:options('Normal', 'PDT','PDTOnly')
    state.PhysicalDefenseMode:options('PDT', 'HP')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('Godhands','Spharai','Staff','ProcStaff','ProcClub','Barehanded','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'Stun'}

    update_melee_groups()
	
	-- Additional local binds
	send_command('bind ^` input /ja "Boost" <me>')
	send_command('bind !` input /ja "Perfect Counter" <me>')
	send_command('bind ^backspace input /ja "Mantra" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	
	
	send_command('alias clean input //org organize all clean.lua')
	
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose +1"}
	sets.precast.JA['Boost'] = {hands="Anchorite's Gloves +3"} --hands="Anchorite's Gloves +1"
	sets.precast.JA['Dodge'] = {feet="Anchorite's Gaiters +2"}
	sets.precast.JA['Focus'] = {head="Anchorite's Crown +3"}
	sets.precast.JA['Counterstance'] = {} --feet="Hesychast's Gaiters +1"
	sets.precast.JA['Footwork'] = {feet="Shukuyu Sune-Ate"}
	sets.precast.JA['Formless Strikes'] = {body="Hesychast's Cyclas"}
	sets.precast.JA['Mantra'] = {feet="Mel. Gaiters +2"} --feet="Hesychast's Gaiters +1"

	sets.precast.JA['Chi Blast'] = { head={ name="Hes. Crown +3", augments={'Enhances "Penance" effect',}},}
	
	sets.precast.JA['Chakra'] = {
		head="Genmei Kabuto",
    body="Anch. Cyclas +2",
    hands={ name="Hes. Gloves", augments={'Enhances "Invigorate" effect',}},
    legs="Hiza. Hizayoroi +2",
    feet="Ken. Sune-Ate",
    waist="Warwolf Belt",
    left_ear="Handler's Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back="Earthcry Mantle",}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Falcon Eye",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Zennaroi Earring",ear2="Telos Earring",
		body="Bhikku Cyclas +1",hands="Hesychast's Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Segomo's Mantle",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet=gear.herculean_acc_feet}
		
	sets.precast.Flourish1 = {ammo="Falcon Eye",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Zennaroi Earring",ear2="Telos Earring",
		body="Mekosu. Harness",hands="Hesychast's Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Segomo's Mantle",waist="Olseni Belt",legs="Mummu Kecks +2",feet=gear.herculean_acc_feet}


	-- Fast cast sets for spells
	
	sets.precast.FC = {body="Dread Jupon",
    hands={ name="Leyline Gloves", augments={'Accuracy+9','Mag. Acc.+5','"Mag.Atk.Bns."+6','"Fast Cast"+1',}},
    left_ear="Loquac. Earring",
    left_ring="Prolix Ring",}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Knobkierrie",
    head={ name="Hes. Crown +3", augments={'Enhances "Penance" effect',}},
    body={ name="Herculean Vest", augments={'Accuracy+28','Weapon skill damage +3%','Attack+8',}},
    hands="Anchor. Gloves +3",
    legs="Hiza. Hizayoroi +2",
    feet="Ken. Sune-Ate",
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
	
	sets.precast.WSSomeAcc = {ammo="Mantoptera Eye",
    head={ name="Ryuo Somen", augments={'HP+50','Accuracy+15','Attack+15',}},
    body="Anch. Cyclas +2",
    hands="Anchor. Gloves +3",
    legs="Anch. Hose +2",
    feet="Anch. Gaiters +2",
    neck="Mnk. Nodowa +1",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    }
	sets.precast.WSAcc = {ammo="Mantoptera Eye",
    head={ name="Ryuo Somen", augments={'HP+50','Accuracy+15','Attack+15',}},
    body="Anch. Cyclas +2",
    hands="Anchor. Gloves +3",
    legs="Anch. Hose +2",
    feet="Anch. Gaiters +2",
    neck="Mnk. Nodowa +1",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
	
	
	sets.precast.WSFullAcc = {ammo="Mantoptera Eye",
    head={ name="Ryuo Somen", augments={'HP+50','Accuracy+15','Attack+15',}},
    body="Anch. Cyclas +2",
    hands="Anchor. Gloves +3",
    legs="Anch. Hose +2",
    feet="Anch. Gaiters +2",
    neck="Mnk. Nodowa +1",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
	sets.precast.WSFodder = {}
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, sets.precast.WSSomeAcc)	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, sets.precast.WSAcc)
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, sets.precast.WSFullAcc)
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, sets.precast.WSFodder)

	-- Specific weaponskill sets.

	sets.precast.WS['Raging Fists']    = set_combine(sets.precast.WS, {ammo="Knobkierrie",
    head={ name="Hes. Crown +3", augments={'Enhances "Penance" effect',}},
    body="Ken. Samue",
    hands="Anchor. Gloves +3",
    legs="Ken. Hakama",
    feet="Ken. Sune-Ate",
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},})
	
	
	sets.precast.WS['Howling Fist']    = set_combine(sets.precast.WS, {ammo="Knobkierrie",
    head="Mpaca's Cap",
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Mpaca's Hose",
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Schere Earring",
    right_ear="Mache Earring +1",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},})
	
	
	sets.precast.WS['Asuran Fists']    = set_combine(sets.precast.WS, {ammo="Knobkierrie",
    head={ name="Hes. Crown +3", augments={'Enhances "Penance" effect',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Mpaca's Hose",
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},})
	
	
	sets.precast.WS['Ascetic\'s Fury']  = set_combine(sets.precast.WS, {ammo="Aurgelmir Orb +1",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Ken. Samue",
    hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
    legs="Mpaca's Hose",
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Odr Earring",
    right_ear="Sherida Earring",
    left_ring="Begrudging Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},})
    
	sets.precast.WS['Victory Smite']   = set_combine(sets.precast.WS, {ammo="Aurgelmir Orb +1",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Ken. Samue",
    hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
    legs="Mpaca's Hose",
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Odr Earring",
    right_ear="Sherida Earring",
    left_ring="Begrudging Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},})
	
	sets.precast.WS['Shijin Spiral']   = set_combine(sets.precast.WS, {aammo="Aurgelmir Orb +1",
    head={ name="Hes. Crown +3", augments={'Enhances "Penance" effect',}},
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands="Malignance Gloves",
    legs="Mpaca's Hose",
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Mache Earring +1",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},})
	
	sets.precast.WS['Dragon Kick']     = set_combine(sets.precast.WS, {ammo="Knobkierrie",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Ken. Samue",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Hiza. Hizayoroi +2",
    feet="Anch. Gaiters +2",
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},})
	
	sets.precast.WS['Tornado Kick']    = set_combine(sets.precast.WS, {ammo="Coiste Bodhar",
    head="Mpaca's Cap",
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Mpaca's Hose",
    feet="Anch. Gaiters +2",
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Schere Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},})
	
	sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {})

	sets.precast.WS["Raging Fists"].SomeAcc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSSomeAcc)
	sets.precast.WS["Howling Fist"].SomeAcc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSSomeAcc)
	sets.precast.WS["Asuran Fists"].SomeAcc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSSomeAcc)
	sets.precast.WS["Ascetic's Fury"].SomeAcc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSSomeAcc, {})
	sets.precast.WS["Victory Smite"].SomeAcc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSSomeAcc, {})
	sets.precast.WS["Shijin Spiral"].SomeAcc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSSomeAcc, {})
	sets.precast.WS["Dragon Kick"].SomeAcc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSSomeAcc)
	sets.precast.WS["Tornado Kick"].SomeAcc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSSomeAcc)
	
	sets.precast.WS["Raging Fists"].Acc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSAcc)
	sets.precast.WS["Howling Fist"].Acc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSAcc)
	sets.precast.WS["Asuran Fists"].Acc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSAcc)
	sets.precast.WS["Ascetic's Fury"].Acc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSAcc, {})
	sets.precast.WS["Victory Smite"].Acc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSAcc, {})
	sets.precast.WS["Shijin Spiral"].Acc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSAcc)
	sets.precast.WS["Dragon Kick"].Acc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSAcc)
	sets.precast.WS["Tornado Kick"].Acc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSAcc)

	sets.precast.WS["Raging Fists"].FullAcc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSFullAcc)
	sets.precast.WS["Howling Fist"].FullAcc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSFullAcc)
	sets.precast.WS["Asuran Fists"].FullAcc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSFullAcc)
	sets.precast.WS["Ascetic's Fury"].FullAcc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSFullAcc, {})
	sets.precast.WS["Victory Smite"].FullAcc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSFullAcc, {})
	sets.precast.WS["Shijin Spiral"].FullAcc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSFullAcc)
	sets.precast.WS["Dragon Kick"].FullAcc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSFullAcc)
	sets.precast.WS["Tornado Kick"].FullAcc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSFullAcc)
	
	sets.precast.WS["Raging Fists"].Fodder = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSFodder)
	sets.precast.WS["Howling Fist"].Fodder = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSFodder)
	sets.precast.WS["Asuran Fists"].Fodder = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSFodder)
	sets.precast.WS["Ascetic's Fury"].Fodder = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSFodder, {})
	sets.precast.WS["Victory Smite"].Fodder = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSFodder, {})
	sets.precast.WS["Shijin Spiral"].Fodder = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSFodder)
	sets.precast.WS["Dragon Kick"].Fodder = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSFodder)
	sets.precast.WS["Tornado Kick"].Fodder = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSFodder)


	sets.precast.WS['Cataclysm'] = {ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Nyame Mail",
    hands={ name="Herculean Gloves", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Mag. Acc.+15','"Mag.Atk.Bns."+10',}},
    legs={ name="Herculean Trousers", augments={'CHR+8','"Mag.Atk.Bns."+23','Chance of successful block +5','Accuracy+6 Attack+6','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +3%','INT+15','Mag. Acc.+2',}},
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Archon Ring",
    right_ring="Crepuscular Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.precast.WS['Shell Crusher'] = {ammo="Pemphredo Tathlum",
    head="Malignance Chapeau",
    body="Nyame Mail",
    hands="Malignance Gloves",
    legs="Mpaca's Hose",
    feet="Malignance Boots",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Digni. Earring",
    right_ear="Hermetic Earring",
    left_ring="Stikini Ring",
    right_ring="Crepuscular Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum",
		head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Dread Jupon",hands="Leyline Gloves",ring2="Defending Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Black Belt",legs=gear.herculean_dt_legs,feet="Hippo. Socks +1"}
		
	-- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, { neck="Magoraga Beads",})
		
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {body="Hesychast's Cyclas",ring2="Sheltered Ring"}
	

	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum",
    head={ name="Hes. Crown +3", augments={'Enhances "Penance" effect',}},
    body="Ken. Samue +1",
    hands="Anchor. Gloves +3",
    legs="Ken. Hakama",
    feet="Herald's Gaiters",
    neck="Mnk. Nodowa +1",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    right_ring="Shneddick Ring",
    left_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.idle.Weak = {ammo="Staunch Tathlum",
    head="Genmei Kabuto",
    body="Emet Harness +1",
    hands="Anchor. Gloves +3",
    legs="Mummu Kecks +1",
    feet={ name="Herculean Boots", augments={'Attack+15','Phys. dmg. taken -3%',}},
    neck="Loricate Torque +1",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.idle.PDT = {ammo="Staunch Tathlum",
    head="Genmei Kabuto",
    body="Emet Harness +1",
    hands="Anchor. Gloves +3",
    legs="Mummu Kecks +1",
    feet={ name="Herculean Boots", augments={'Attack+15','Phys. dmg. taken -3%',}},
    neck="Loricate Torque +1",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},}		

	-- Defense sets
	sets.defense.PDT = {ammo="Voluspa Tathlum",
    head="Malignance Chapeau",
    body="Ken. Samue +1",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Anch. Hose +2",
    feet="Nyame Sollerets",
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
    back="Moonbeam Cape",}
		
	-- Defense sets
	sets.defense.HP = {ammo="Voluspa Tathlum",
    head="Malignance Chapeau",
    body="Ken. Samue +1",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Anch. Hose +2",
    feet="Nyame Sollerets",
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
    back="Moonbeam Cape",}

	sets.defense.MDT = {ammo="Staunch Tathlum",
    head="Genmei Kabuto",
    body="Emet Harness +1",
    hands="Anchor. Gloves +3",
    legs="Mummu Kecks +1",
    feet={ name="Herculean Boots", augments={'Attack+15','Phys. dmg. taken -3%',}},
    neck="Loricate Torque +1",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
    head={ name="Hes. Crown +3", augments={'Enhances "Penance" effect',}},
    body="Ken. Samue",
    hands="Ken. Tekko",
    legs="Ken. Hakama",
    feet="Ken. Sune-Ate",
    neck="Moonbeam Necklace",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Defending Ring",
    right_ring="Fortified Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.Kiting = {feet="Herald's Gaiters"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee sets
	sets.engaged = {ammo="Aurgelmir orb +1",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Hes. Hose +3", augments={'Enhances "Hundred Fists" effect',}},
    feet="Anch. Gaiters +2",
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.engaged.SomeAcc = {ammo="Aurgelmir orb +1",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Hes. Hose +3", augments={'Enhances "Hundred Fists" effect',}},
    feet="Anch. Gaiters +2",
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.engaged.Acc = {ammo="Voluspa Tathlum",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Hes. Hose +3", augments={'Enhances "Hundred Fists" effect',}},
    feet="Anch. Gaiters +2",
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.engaged.FullAcc = {ammo="Falcon Eye",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Hes. Hose +3", augments={'Enhances "Hundred Fists" effect',}},
    feet="Anch. Gaiters +2",
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},}
		
		
	sets.engaged.Fodder = {ammo="Voluspa Tathlum",
    head="Malignance Chapeau",
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands="Malignance Gloves",
    legs="Mummu Kecks +1",
    feet="Ken. Sune-Ate",
    neck="Loricate Torque +1",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Patricius Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},}

	-- Defensive melee hybrid sets
	sets.engaged.PDT = {ammo="Coiste Bodhar",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Mpaca's Doublet",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Mpaca's Hose",
    feet="Shukuyu Sune-Ate",
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.engaged.SomeAcc.PDT = {ammo="Aurgelmir orb +1",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Mpaca's Doublet",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Anch. Hose +2",
    feet="Nyame Sollerets",
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.engaged.Acc.PDT = {ammo="Aurgelmir orb +1",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Mpaca's Doublet",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Anch. Hose +2",
    feet="Nyame Sollerets",
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.engaged.FullAcc.PDT = {ammo="Voluspa Tathlum",
    head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Anch. Hose +2",
    feet="Nyame Sollerets",
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.engaged.Fodder.PDT = {ammo="Staunch Tathlum",
		head="Genmei Kabuto",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Black Belt",legs=gear.herculean_dt_legs,feet="Hippo. Socks +1"}
	sets.engaged.PDTOnly = {ammo="Ginsen",
		head="Genmei Kabuto",neck="Moonbeam Nodowa",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Emet Harness +1",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Patricius Ring",
		back="Solemnity Cape",waist="Black Belt",legs="Hesychast's Hose +1",feet="Soku. Sune-Ate"}
	sets.engaged.SomeAcc.PDTOnly = {ammo="Ginsen",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Cessance Earring",ear2="Sherida Earring",
		body="Emet Harness +1",hands="Hes. Gloves +1",ring1="Niqmaddu Ring",ring2="Patricius Ring",
		back="Solemnity Cape",waist="Black Belt",legs="Hesychast's Hose +1",feet="Soku. Sune-Ate"}
	sets.engaged.Acc.PDTOnly = {ammo="Falcon Eye",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Cessance Earring",ear2="Sherida Earring",
		body="Emet Harness +1",hands="Hesychast's Gloves +1",ring1="Niqmaddu Ring",ring2="Patricius Ring",
		back="Solemnity Cape",waist="Black Belt",legs="Samnuha Tights",feet=gear.herculean_acc_feet}
	sets.engaged.FullAcc.PDTOnly = {ammo="Falcon Eye",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Zennaroi Earring",ear2="Telos Earring",
		body="Emet Harness +1",hands="Hesychast's Gloves +1",ring1="Ramuh Ring +1",ring2="Patricius Ring",
		back="Solemnity Cape",waist="Black Belt",legs="Samnuha Tights",feet=gear.herculean_acc_feet}

	-- Hundred Fists/Impetus melee set mods
	
	sets.engaged.HF = set_combine(sets.engaged, {body="Bhikku Cyclas +1",})
	sets.engaged.SomeAcc.HF = set_combine(sets.engaged.SomeAcc, {body="Bhikku Cyclas +1",})
	sets.engaged.Acc.HF = set_combine(sets.engaged.Acc, {body="Bhikku Cyclas +1",})
	sets.engaged.FullAcc.HF = set_combine(sets.engaged.FullAcc, {body="Bhikku Cyclas +1",})
	sets.engaged.Fodder.HF = set_combine(sets.engaged.Fodder, {body="Bhikku Cyclas +1",})




	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Impetus = {ammo="Aurgelmir orb +1",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Bhikku Cyclas +1",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Hes. Hose +3", augments={'Enhances "Hundred Fists" effect',}},
    feet="Anch. Gaiters +2",
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},} --body="Bhikku Cyclas +1"
	sets.buff.Footwork = {legs={ name="Hes. Hose +3", augments={'Enhances "Hundred Fists" effect',}},
    feet="Anch. Gaiters +2",}
    
	
	sets.FootworkWS = {ammo="Aurgelmir orb +1",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Hes. Hose +3", augments={'Enhances "Hundred Fists" effect',}},
    feet="Shukuyu Sune-Ate",
    neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},}
	sets.DayIdle = {}
	sets.NightIdle = {}
    sets.Knockback = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {head="Volte Cap",body="Volte Jupon",hands="Volte Bracers",})
	sets.Skillchain = {head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",}
	
	-- Weapons sets
	sets.weapons.Godhands = {main="Godhands"}
	sets.weapons.Spharai = {main="Spharai"}
	sets.weapons.Staff = {main="Reikikon"}
	sets.weapons.Barehanded = {main="Sagitta"}
	sets.weapons.ProcStaff = {main="Reikikon"}
	sets.weapons.ProcClub = {main="Mafic Cudgel"}
	sets.weapons.ProcSword = {main="Ark Sword",sub=empty}
	sets.weapons.ProcGreatSword = {main="Lament",sub=empty}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub=empty}
	sets.weapons.ProcPolearm = {main="Pitchfork +1",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Hardwood Katana",sub=empty}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(1, 2)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 2)
	elseif player.sub_job == 'THF' then
		set_macro_page(1, 2)
	elseif player.sub_job == 'RUN' then
		set_macro_page(1, 2)
	else
		set_macro_page(1, 2)
	end
end