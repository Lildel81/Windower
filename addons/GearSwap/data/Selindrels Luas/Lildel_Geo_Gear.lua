function user_job_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Maxentius','DualWeapons')

	gear.nuke_jse_back = {name="Nantosuelta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}}
	gear.idle_jse_back = {name="Nantosuelta's Cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10'}}
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = gear.nuke_jse_back
	gear.obi_low_nuke_waist = "Sekhmet Corset"

	gear.obi_high_nuke_back = gear.nuke_jse_back
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	
	autoindi = "Haste"
	autogeo = "Frailty"
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` input /ja "Full Circle" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind ^backspace input /ja "Entrust" <me>')
	send_command('bind !backspace input /ja "Life Cycle" <me>')
	send_command('bind @backspace input /ma "Sleep II" <t>')
	send_command('bind ^delete input /ma "Aspir III" <t>')
	send_command('bind @delete input /ma "Sleep" <t>')
	
	indi_duration = 290
	
	select_default_macro_book()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
	sets.precast.JA['Life Cycle'] = {body="Geo. Tunic +1",back=gear.idle_jse_back}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +1"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1",hands="Bagua Mitaines +1"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells

	sets.precast.FC = {main="Sucellus",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Agwu's Robe",
    hands="Azimuth Gloves",
    legs="Artsieq Hose",
    feet="Regal Pumps",
    neck="Loricate Torque +1",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +8','Indi. eff. dur. +20','Damage taken-3%',}},}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {range="Dunna",ammo=empty})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear2="Malignance Earring",hands="Bagua Mitaines"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Serenity",sub="Clerisy Strap +1"})
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC.Impact = {ammo="Impatiens",
		head=empty,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Twilight Cloak",hands="Volte Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Lifestream Cape",waist="Witful Belt",legs="Geo. Pants +1",feet="Regal Pumps +1"}
		
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {main="Sucellus",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Agwu's Robe",
    hands="Azimuth Gloves",
    legs="Artsieq Hose",
    feet="Regal Pumps",
    neck="Loricate Torque +1",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +8','Indi. eff. dur. +20','Damage taken-3%',}},}

	sets.midcast.Geomancy = {main="Sucellus",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood",
    body={ name="Bagua Tunic", augments={'Enhances "Bolster" effect',}},
    hands="Geo. Mitaines +1",
    legs="Azimuth Tights",
    feet="Regal Pumps",
    neck="Bagua Charm +2",
    waist="Rumination Sash",
    left_ear="Mendi. Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +8','Indi. eff. dur. +20','Damage taken-3%',}},}


	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {back=gear.idle_jse_back,legs="Bagua Pants +1",feet="Azimuth Gaiters +1"})
		
    sets.midcast.Cure = {main="Daybreak",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands="Geo. Mitaines +1",
    legs="Assid. Pants +1",
    feet={ name="Medium's Sabots", augments={'MP+45','MND+9','"Conserve MP"+5','"Cure" potency +4%',}},
    neck="Loricate Torque +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Sirona's Ring",
    right_ring="Stikini Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +8','Indi. eff. dur. +20','Damage taken-3%',}},}
		
    sets.midcast.LightWeatherCure = {main="Daybreak",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands="Geo. Mitaines +1",
    legs="Assid. Pants +1",
    feet={ name="Medium's Sabots", augments={'MP+45','MND+9','"Conserve MP"+5','"Cure" potency +4%',}},
    neck="Loricate Torque +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Sirona's Ring",
    right_ring="Stikini Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +8','Indi. eff. dur. +20','Damage taken-3%',}},}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Daybreak",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands="Geo. Mitaines +1",
    legs="Assid. Pants +1",
    feet={ name="Medium's Sabots", augments={'MP+45','MND+9','"Conserve MP"+5','"Cure" potency +4%',}},
    neck="Loricate Torque +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Sirona's Ring",
    right_ring="Stikini Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +8','Indi. eff. dur. +20','Damage taken-3%',}},}

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {main="Daybreak",sub="Sors Shield"})

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})
	
    sets.midcast['Elemental Magic'] = {main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Ea Hat",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops",
    feet="Ea Pigaches",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Crepuscular Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}

    sets.midcast['Elemental Magic'].Resistant = {main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Ea Hat",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops",
    feet="Ea Pigaches",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Crepuscular Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}
		
    sets.midcast['Elemental Magic'].Proc = {main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Ea Hat",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops",
    feet="Ea Pigaches",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Crepuscular Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}
		
    sets.midcast['Elemental Magic'].Fodder = {main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Ea Hat",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops",
    feet="Ea Pigaches",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Crepuscular Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}
		
    sets.midcast['Elemental Magic'].HighTierNuke = {main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Ea Hat",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops",
    feet="Ea Pigaches",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Crepuscular Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}
		
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = {main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Ea Hat",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops",
    feet="Ea Pigaches",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Crepuscular Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}

	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = {main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Ea Hat",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops",
    feet="Ea Pigaches",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Crepuscular Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}
		
    sets.midcast['Dark Magic'] = {main="Bunzi's Rod",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Pixie Hairpin +1",
    body="Ea Houppelande",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops",
    feet="Agwu's Pigaches",
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Archon Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}
		
    sets.midcast.Drain = {main="Bunzi's Rod",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Pixie Hairpin +1",
    body="Ea Houppelande",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops",
    feet="Agwu's Pigaches",
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Archon Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Bunzi's Rod",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Pixie Hairpin +1",
    body="Ea Houppelande",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops",
    feet="Agwu's Pigaches",
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Archon Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}
		
	sets.midcast.Stun.Resistant = {main="Bunzi's Rod",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Pixie Hairpin +1",
    body="Ea Houppelande",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops",
    feet="Agwu's Pigaches",
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Archon Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}
		
	sets.midcast.Impact = {main="Bunzi's Rod",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Pixie Hairpin +1",
    body="Ea Houppelande",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops",
    feet="Agwu's Pigaches",
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Archon Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}
		
	sets.midcast.Dispel = {main="Bunzi's Rod",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body="Ischemia Chasu.",
    hands="Jhakri Cuffs +2",
    legs="Nyame Flanchard",
    feet="Agwu's Pigaches",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}

	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})
		
	sets.midcast['Enfeebling Magic'] = {main="Bunzi's Rod",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body="Ischemia Chasu.",
    hands="Jhakri Cuffs +2",
    legs="Nyame Flanchard",
    feet="Agwu's Pigaches",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Bunzi's Rod",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body="Ischemia Chasu.",
    hands="Jhakri Cuffs +2",
    legs="Nyame Flanchard",
    feet="Agwu's Pigaches",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Malignance Earring",waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear2="Malignance Earring",waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Malignance Earring",waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear2="Malignance Earring",waist="Acuity Belt +1"})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {range=empty,ring1="Stikini Ring +1"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {range=empty,ring1="Stikini Ring +1"})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring"})
		
	sets.midcast['Enhancing Magic'] = {main="Bolelabunga",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Umuthi Hat",
    body={ name="Telchine Chas.", augments={'Pet: "Regen"+3','Pet: Damage taken -3%',}},
    hands="Jhakri Cuffs +2",
    legs="Nyame Flanchard",
    feet="Regal Pumps",
    neck="Melic Torque",
    waist="Embla Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",
		head="Befouled Crown",neck="Chrys. Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}

	-- Idle sets

	sets.idle = {main="Bolelabunga",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body="Jhakri Robe +2",
    hands={ name="Bagua Mitaines", augments={'Enhances "Curative Recantation" effect',}},
    legs="Assid. Pants +1",
    feet="Herald's Gaiters",
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Genmei Earring",
    right_ear="Ethereal Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}
		
	sets.idle.PDT = {main="Bolelabunga",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet="Herald's Gaiters",
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Genmei Earring",
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +8','Indi. eff. dur. +20','Damage taken-3%',}},}

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Telchine Cap", augments={'Pet: "Regen"+3','Pet: Damage taken -4%',}},
    body={ name="Telchine Chas.", augments={'Pet: "Regen"+3','Pet: Damage taken -3%',}},
    hands="Geo. Mitaines +1",
    legs={ name="Telchine Braconi", augments={'Pet: "Regen"+3','Pet: Damage taken -4%',}},
    feet="Nyame Sollerets",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Handler's Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}

	sets.idle.PDT.Pet = {main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Telchine Cap", augments={'Pet: "Regen"+3','Pet: Damage taken -4%',}},
    body={ name="Telchine Chas.", augments={'Pet: "Regen"+3','Pet: Damage taken -3%',}},
    hands="Geo. Mitaines +1",
    legs={ name="Telchine Braconi", augments={'Pet: "Regen"+3','Pet: Damage taken -4%',}},
    feet="Nyame Sollerets",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Handler's Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Carrier's Sash",legs="Assid. Pants +1",feet="Azimuth Gaiters +1"}

	-- Defense sets
	
	sets.defense.PDT = {main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Telchine Braconi", augments={'Pet: "Regen"+3','Pet: Damage taken -4%',}},
    feet="Nyame Sollerets",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Handler's Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}

	sets.defense.MDT = {main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Telchine Braconi", augments={'Pet: "Regen"+3','Pet: Damage taken -4%',}},
    feet="Nyame Sollerets",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Handler's Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}
		
    sets.defense.MEVA = {main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {feet="Herald's Gaiters"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {ammo="Hasty Pinion +1",
		head="Befouled Crown",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Jhakri Robe +2",hands="Gazu Bracelet +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Moonlight Cape",waist="Witful Belt",legs="Assid. Pants +1",feet="Battlecast Gaiters"}
		
	sets.engaged.DW = {ammo="Hasty Pinion +1",
		head="Befouled Crown",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Jhakri Robe +2",hands="Regal Cuffs",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Moonlight Cape",waist="Witful Belt",legs="Assid. Pants +1",feet="Battlecast Gaiters"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Ea Hat",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops",
    feet="Ea Pigaches",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Crepuscular Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}
	
	sets.ResistantMagicBurst = {main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Ea Hat",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops",
    feet="Ea Pigaches",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Crepuscular Ring",
    back={ name="Nantosuelta's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+6','Pet: "Regen"+5',}},}
	
	sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Weapons sets
	sets.weapons.Maxentius = {main='Maxentius',sub='Genmei Shield'}
	sets.weapons.DualWeapons = {main='Maxentius',sub='Nehushtan'}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(4, 10)
end