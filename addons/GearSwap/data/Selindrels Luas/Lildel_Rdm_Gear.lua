function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT', 'MDT', 'TPEat','DTHippo')
    state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Endamage','Savage','Daybreak','Dagger', 'club', 'lvl1','Excalibur')
	
	

	gear.obi_low_nuke_back = "Toro Cape"
	gear.obi_low_nuke_waist = "Sekhmet Corset"

	gear.obi_high_nuke_back = "Toro Cape"
	gear.obi_high_nuke_waist = "Refoccilation Stone"

		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` input /ja "Accession" <me>')
	
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind != input /ja "Penury" <me>')
	send_command('bind @= input /ja "Parsimony" <me>')
	--send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise" <me>')
	send_command('bind @f10 gs c cycle RecoverMode')
	--send_command('alias clean input //org organize clean.lua')
	send_command(';wait 1.0;input /lockstyleset 10')
	send_command('alias si input /ma "Sneak" <me>;wait 2.0;input /ma "Invisible" <me>')
	--[[
	send_command('bind numpad. setkey escape down;wait .1;setkey escape up')	
	send_command('bind numpad7 setkey Lshift down;wait .05;setkey tab down;wait .05;setkey tab up;wait .05;setkey Lshift up')	
	send_command('bind numpad9 setkey tab down;wait .05;setkey tab up')
	send_command('bind %r input /automove')
	send_command('bind ^delete input /cure IV <stal>')--]]
	
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +1"}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {
    ammo="Staunch Tathlum",
    head="Atro. Chapeau +2",
    body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
    hands="Malignance Gloves",
    legs="Aya. Cosciales +2",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Genmei Earring",
    right_ear="Malignance Earring",
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
    ammo="Voluspa Tathlum",
    head={ name="Viti. Chapeau +2", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Ayanmo Corazza +2",
    hands="Atrophy Gloves +2",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+19','MND+10','Weapon skill damage +3%','Accuracy+7 Attack+7','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist="Kentarch Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Ilabrat Ring",
    right_ring="Karieyh Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {ammo="Focal Orb",
    head={ name="Viti. Chapeau +2", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Ayanmo Corazza +2",
    hands="Bunzi's Gloves",
    legs="Zoar Subligar +1",
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist="Kentarch Belt +1",
    left_ear="Brutal Earring",
    right_ear="Mache Earring +1",
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},})
	
	sets.precast.WS['Chant Du Cygne'] = set_combine(sets.precast.WS, {ammo="Yetshila",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body={ name="Taeon Tabard", augments={'Accuracy+14 Attack+14','Crit.hit rate+2','Crit. hit damage +3%',}},
    hands={ name="Taeon Gloves", augments={'Accuracy+20 Attack+20','Crit.hit rate+3','Crit. hit damage +2%',}},
    legs={ name="Taeon Tights", augments={'Accuracy+13 Attack+13','Crit.hit rate+3','Crit. hit damage +3%',}},
    feet="Thereoid Greaves",
    neck="Flame Gorget",
    waist="Light Belt",
    left_ear="Sherida Earring",
    right_ear="Mache Earring +1",
    left_ring="Ilabrat Ring",
    right_ring="Begrudging Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},})

	sets.precast.WS['Savage Blade'] = {ammo="Voluspa Tathlum",
    head={ name="Viti. Chapeau +2", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Jhakri Slops +2",
    feet="Nyame Sollerets",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Ilabrat Ring",
    right_ring="Karieyh Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}
		
	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Mizu. Kubikazari",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Archon Ring",
    right_ring="Karieyh Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},}
	
	sets.precast.WS['Seraph Blade'] = {head="Jhakri Coronal +2",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Jhakri Slops +2",
    feet={ name="Chironic Slippers", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','INT+7','"Refresh"+1','Accuracy+19 Attack+19','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    neck="Mizu. Kubikazari",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Karieyh Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}},}
	
	sets.precast.WS['Empyreal Arrow'] = {
    ammo="Chapuli Arrow",
    head="Malignance Chapeau",
    body="Atrophy Tabard +2",
    hands="Malignance Gloves",
    legs="Atrophy Tights +2",
    feet="Malignance Boots",
    neck="Sanctity Necklace",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Enervating Earring",
    left_ring="Paqichikaji Ring",
    right_ring="Longshot Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}

	
	-- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {head="Volte Cap",body="Volte Jupon",hands="Volte Bracers",})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Bunzi's Rod",
    sub="Ammurapi Shield",
    range="Ullr",
    head="Ea Hat",
    body="Ea Houppelande",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops",
    feet="Ea Pigaches",
    neck="Mizu. Kubikazari",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Mujin Band",
    right_ring="Shiva Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},}
	
	-- Gear for specific elemental nukes.
	sets.element.Wind = {main="Marin Staff +1"}
	sets.element.Ice = {}
	sets.element.Earth = {neck="Quanpur Necklace"}
	sets.element.Water = {body="Poroggo Fleece +1",}
	
	sets.midcast.RA = {range="Ullr",
    ammo="Chapuli Arrow",
    head="Malignance Chapeau",
    body="Atrophy Tabard +2",
    hands="Malignance Gloves",
    legs="Atrophy Tights +2",
    feet="Malignance Boots",
    neck="Marked Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Enervating Earring",
    left_ring="Paqichikaji Ring",
    right_ring="Longshot Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}

	sets.midcast.FastRecast = {
    ammo="Staunch Tathlum",
    head="Atro. Chapeau +2",
    body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
    hands="Malignance Gloves",
    legs="Aya. Cosciales +2",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Genmei Earring",
    right_ear="Malignance Earring",
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}

    sets.midcast.Cure = {main="Bunzi's Rod",
    sub="Daybreak",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +2", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body={ name="Chironic Doublet", augments={'Accuracy+20','"Dual Wield"+1','STR+13',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Atrophy Tights +2",
    feet="Vanya Clogs",
    neck="Mizu. Kubikazari",
    waist="Gishdubar Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Naji's Loop",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}},}
		
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",waist="Hachirin-no-Obi",}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Chatoyant Staff",waist="Hachirin-no-Obi",}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {main="Bunzi's Rod",
    sub="Daybreak",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +2", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body={ name="Chironic Doublet", augments={'Accuracy+20','"Dual Wield"+1','STR+13',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Atrophy Tights +2",
    feet="Vanya Clogs",
    neck="Mizu. Kubikazari",
    waist="Gishdubar Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Sirona's Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}},})--neck="Debilis Medallion",hands="Hieros Mittens",
		--ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Bunzi's Rod",
    sub="Daybreak",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +2", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body={ name="Chironic Doublet", augments={'Accuracy+20','"Dual Wield"+1','STR+13',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Atrophy Tights +2",
    feet="Vanya Clogs",
    neck="Mizu. Kubikazari",
    waist="Gishdubar Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Sirona's Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}},})--main="Oranyan",sub="Clemency Grip"
		
	sets.midcast.Curaga = sets.midcast.Cure
	sets.Self_Healing = {neck="Phalaina Locket",ear1="Etiolation Earring",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}--neck="Phalaina Locket",ear1="Etiolation Earring",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}--neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}--back="Grapevine Cape",waist="Gishdubar Sash"

	sets.midcast['Enhancing Magic'] = {amain="Arendsi Fleuret",
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head="Befouled Crown",
    body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Viti. Gloves +1", augments={'Enhancing Magic duration',}},
    legs="Atrophy Tights +2",
    feet="Leth. Houseaux +2",
    neck="Melic Torque",
    waist="Embla Sash",
    left_ear="Andoaa Earring",
    right_ear="Lethargy earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}},}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {sub="Ammurapi Shield",
	head="Leth. Chappel +1",
	    hands="Atrophy Gloves +2",
		body="Lethargy Sayon +1",
		legs="Leth. Fuseau +1",
		feet="Leth. Houseaux +2",
		waist="Embla Sash",}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.midcast.Refresh = {head="Amalric Coif +1",body="Atrophy Tabard +2",legs="Leth. Fuseau +1", feet="Inspirited boots"}
	sets.midcast.Aquaveil = {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	sets.midcast.BarElement = {}--legs="Shedir Seraweels"
	sets.midcast.Stoneskin = {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	sets.midcast.Phalanx = {main="Egeking",
    sub="Sakpata's Sword",
    range="Ullr",
    ammo="Chapuli Arrow",
    head={ name="Taeon Chapeau", augments={'Spell interruption rate down -8%','Phalanx +2',}},
    body={ name="Taeon Tabard", augments={'Spell interruption rate down -10%','Phalanx +3',}},
    hands={ name="Taeon Gloves", augments={'Phalanx +3',}},
    legs={ name="Taeon Tights", augments={'Phalanx +3',}},
    feet={ name="Taeon Boots", augments={'Spell interruption rate down -7%','Phalanx +3',}},
    neck="Melic Torque",
    waist="Embla Sash",
    left_ear="Andoaa Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
	
	sets.midcast.Temper = {
    main="Arendsi Fleuret",
    sub="Ammurapi Shield",
    range="Ullr",
    ammo="Chapuli Arrow",
    head="Befouled Crown",
    body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Viti. Gloves +1", augments={'Enhancing Magic duration',}},
    legs="Atrophy Tights +2",
    feet="Leth. Houseaux +2",
    neck="Melic Torque",
    waist="Embla Sash",
    left_ear="Andoaa Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}
	sets.midcast.Temper.DW = {
    main="Arendsi Fleuret",
    sub="Ammurapi Shield",
    range="Ullr",
    ammo="Chapuli Arrow",
    head="Befouled Crown",
    body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Viti. Gloves +1", augments={'Enhancing Magic duration',}},
    legs="Atrophy Tights +2",
    feet="Leth. Houseaux +2",
    neck="Melic Torque",
    waist="Embla Sash",
    left_ear="Andoaa Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}
	sets.midcast.Enspell = {
    main="Arendsi Fleuret",
    sub="Ammurapi Shield",
    range="Ullr",
    ammo="Chapuli Arrow",
    head="Befouled Crown",
    body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Viti. Gloves +1", augments={'Enhancing Magic duration',}},
    legs="Atrophy Tights +2",
    feet="Leth. Houseaux +2",
    neck="Melic Torque",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}
	sets.midcast.Enspell.DW = {
    main="Arendsi Fleuret",
    sub="Ammurapi Shield",
    range="Ullr",
    ammo="Chapuli Arrow",
    head="Befouled Crown",
    body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Viti. Gloves +1", augments={'Enhancing Magic duration',}},
    legs="Atrophy Tights +2",
    feet="Leth. Houseaux +2",
    neck="Melic Torque",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
	
	sets.midcast['Enfeebling Magic'] = {main="Crocea Mors",
    sub="Bunzi's Rod",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +2", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +2",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+19','MND+10','Weapon skill damage +3%','Accuracy+7 Attack+7','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    feet="Skaoi Boots",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}},}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Crocea Mors",
    sub="Bunzi's Rod",
    range="Ullr",
    head="Malignance Chapeau",
    body="Atrophy Tabard +2",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+19','MND+10','Weapon skill damage +3%','Accuracy+7 Attack+7','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    feet="Malignance Boots",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}},}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},})--head="Amalric Coif +1",waist="Acuity Belt +1"
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},})--head="Amalric Coif +1",waist="Acuity Belt +1"
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},})--head="Amalric Coif +1",waist="Acuity Belt +1"
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},})--head="Amalric Coif +1",hands="Jhakri Cuffs +2",waist="Acuity Belt +1"

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {main="Crocea Mors",
    sub="Bunzi's Rod",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +2", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +2",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+19','MND+10','Weapon skill damage +3%','Accuracy+7 Attack+7','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    feet="Skaoi Boots",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}},})
	
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {main="Crocea Mors",
    sub="Bunzi's Rod",
    range="Ullr",
    head="Malignance Chapeau",
    body="Atrophy Tabard +2",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+19','MND+10','Weapon skill damage +3%','Accuracy+7 Attack+7','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    feet="Malignance Boots",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}},})
	
	sets.midcast['Distract III'] = set_combine(sets.midcast.MndEnfeebles, {neck="Incanter's Torque",hands="Leth. Gantherots +1",ring1="Stikini Ring"})
	sets.midcast['Distract III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {})
	sets.midcast['Frazzle III'] = set_combine(sets.midcast.MndEnfeebles, {neck="Incanter's Torque",hands="Leth. Gantherots +1",ring1="Stikini Ring"})
	sets.midcast['Frazzle III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {})
	
	sets.midcast.Silence = set_combine(sets.midcast['Enfeebling Magic'], {body="Atrophy Tabard +2"})
	sets.midcast.Silence.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})	
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {})
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], {sets.TreasureHunter})

	sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +1"})
	sets.midcast['Slow II'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Viti. Chapeau +1"})
	
    sets.midcast['Elemental Magic'] = {main="Sakpata's Sword",
    sub="Bunzi's Rod",
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+30','Enmity-3','CHR+10',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+19','MND+10','Weapon skill damage +3%','Accuracy+7 Attack+7','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    feet="Ea Pigaches",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Regal Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},}
		
    sets.midcast['Elemental Magic'].Resistant = {main="Sakpata's Sword",
    sub="Bunzi's Rod",
    range="Ullr",
    head="Malignance Chapeau",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands="Bunzi's Gloves",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+19','MND+10','Weapon skill damage +3%','Accuracy+7 Attack+7','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    feet="Ea Pigaches",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Regal Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},}
		
    sets.midcast['Elemental Magic'].Fodder = {}

    sets.midcast['Elemental Magic'].Proc = {}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {})
		
	sets.midcast.Impact = {ammo="Regal Gem",
    head="Atro. Chapeau +2",
    body="Atrophy Tabard +2",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Magic burst dmg.+5%','"Store TP"+1','Weapon skill damage +1%','Accuracy+9 Attack+9','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    feet="Malignance Boots",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},}
	    --main="Oranyan",sub="Enki Strap",ammo="Regal Gem",
		--head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		--body="Twilight Cloak",hands="Leth. Gantherots +1",ring1="Stikini Ring",ring2="Stikini Ring",
		--back="Sucellos's Cape",waist="Luminary Sash",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet

	sets.midcast['Dark Magic'] = {"Sakpata's Sword",
    sub="Ammurapi Shield",
    range="Ullr",
    head="Pixie Hairpin +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Merlinic Shalwar", augments={'Accuracy+10','Pet: STR+10','Accuracy+6 Attack+6','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    feet={ name="Merlinic Crackows", augments={'CHR+2','"Fast Cast"+2','"Store TP"+7','Accuracy+15 Attack+15','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Digni. Earring",
    left_ring="Archon Ring",
    right_ring="Evanescence Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},}

    sets.midcast.Drain = {"Sakpata's Sword",
    sub="Ammurapi Shield",
    range="Ullr",
    head="Pixie Hairpin +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Merlinic Shalwar", augments={'Accuracy+10','Pet: STR+10','Accuracy+6 Attack+6','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    feet={ name="Merlinic Crackows", augments={'CHR+2','"Fast Cast"+2','"Store TP"+7','Accuracy+15 Attack+15','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Digni. Earring",
    left_ring="Archon Ring",
    right_ring="Evanescence Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {"Sakpata's Sword",
    sub="Ammurapi Shield",
    range="Ullr",
    head="Pixie Hairpin +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Merlinic Shalwar", augments={'Accuracy+10','Pet: STR+10','Accuracy+6 Attack+6','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    feet={ name="Merlinic Crackows", augments={'CHR+2','"Fast Cast"+2','"Store TP"+7','Accuracy+15 Attack+15','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Digni. Earring",
    left_ring="Archon Ring",
    right_ring="Evanescence Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},}
		
	sets.midcast.Stun.Resistant = {main="Crocea Mors",
    sub="Bunzi's Rod",
    range="Ullr",
    head="Malignance Chapeau",
    body="Atrophy Tabard +2",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+19','MND+10','Weapon skill damage +3%','Accuracy+7 Attack+7','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    feet="Malignance Boots",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}},}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Gantherots +1"}
	
	sets.HPDown = {}--head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		--body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		--back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}
	

	-- Idle sets
	sets.idle = {main={ name="Colada", augments={'CHR+10','Pet: "Mag.Atk.Bns."+14','"Refresh"+2','DMG:+10',}},
    sub="Daybreak",
   -- ammo="Staunch Tathlum",
    head={ name="Viti. Chapeau +2", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Jhakri Robe +2",
    hands={ name="Chironic Gloves", augments={'"Dbl.Atk."+2','STR+5','"Refresh"+1',}},
    legs="Aya. Cosciales +2",
    feet={ name="Chironic Slippers", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','INT+7','"Refresh"+1','Accuracy+19 Attack+19','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear="Genmei Earring",
    right_ear="Infused Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
	sets.idle.PDT = {main={ name="Colada", augments={'CHR+10','Pet: "Mag.Atk.Bns."+14','"Refresh"+2','DMG:+10',}},
    sub="Daybreak",
    --ammo="Staunch Tathlum",
    head={ name="Viti. Chapeau +2", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Jhakri Robe +2",
    hands="Malignance Gloves",
    legs="Bunzi's Pants",
    feet={ name="Chironic Slippers", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','INT+7','"Refresh"+1','Accuracy+19 Attack+19','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Genmei Earring",
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
	sets.idle.MDT = {main={ name="Colada", augments={'CHR+10','Pet: "Mag.Atk.Bns."+14','"Refresh"+2','DMG:+10',}},
    sub={ name="Beatific Shield +1", augments={'Phys. dmg. taken -3%','HP+25','Magic dmg. taken -3%',}},
    --ammo="Staunch Tathlum",
    head={ name="Viti. Chapeau +2", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Jhakri Robe +2",
    hands="Malignance Gloves",
    legs="Bunzi's Pants",
    feet={ name="Chironic Slippers", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','INT+7','"Refresh"+1','Accuracy+19 Attack+19','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    neck="Loricate Torque +1",
    waist="Carrier's Sash",
    left_ear="Genmei Earring",
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
	sets.idle.Weak = {main={ name="Colada", augments={'CHR+10','Pet: "Mag.Atk.Bns."+14','"Refresh"+2','DMG:+10',}},
    sub="Daybreak",
    --ammo="Staunch Tathlum",
    head={ name="Viti. Chapeau +2", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Jhakri Robe +2",
    hands="Malignance Gloves",
    legs="Bunzi's Pants",
    feet={ name="Chironic Slippers", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','INT+7','"Refresh"+1','Accuracy+19 Attack+19','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Genmei Earring",
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
	
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {back="Umbra Cape",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})
	
	-- Defense sets
	sets.defense.PDT = {main={ name="Colada", augments={'CHR+10','Pet: "Mag.Atk.Bns."+14','"Refresh"+2','DMG:+10',}},
    sub={ name="Beatific Shield +1", augments={'Phys. dmg. taken -3%','HP+25','Magic dmg. taken -3%',}},
    ammo="Staunch Tathlum",
    head="Malignance Chapeau",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Genmei Earring",
    right_ear="Handler's Earring +1",
    left_ring="Defending Ring",
    right_ring="Ilabrat Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {main={ name="Colada", augments={'CHR+10','Pet: "Mag.Atk.Bns."+14','"Refresh"+2','DMG:+10',}},
    sub={ name="Beatific Shield +1", augments={'Phys. dmg. taken -3%','HP+25','Magic dmg. taken -3%',}},
    ammo="Staunch Tathlum",
    head="Malignance Chapeau",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Genmei Earring",
    right_ear="Handler's Earring +1",
    left_ring="Defending Ring",
    right_ring="Ilabrat Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
    sets.defense.MEVA = {main={ name="Colada", augments={'CHR+10','Pet: "Mag.Atk.Bns."+14','"Refresh"+2','DMG:+10',}},
    sub={ name="Beatific Shield +1", augments={'Phys. dmg. taken -3%','HP+25','Magic dmg. taken -3%',}},
    ammo="Staunch Tathlum",
    head="Volte Cap",
    body="Volte Jupon",
    hands="Volte Bracers",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Eabani Earring",
    right_ear="Handler's Earring +1",
    left_ring="Defending Ring",
    right_ring="Ilabrat Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
	sets.idle.TPEat = set_combine(sets.idle, {right_ring="Karieyh Ring",})--neck="Chrys. Torque"

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	sets.weapons.Endamage = {main="Crocea Mors",sub={ name="Demers. Degen +1", augments={'Path: A',}},range="Ullr",ammo="Chapuli Arrow",}
	sets.weapons.Savage = { main="Naegling",sub={ name="Demers. Degen +1", augments={'Path: A',}},range="Ullr",ammo="Chapuli Arrow",}
	sets.weapons.Daybreak = {main="Crocea Mors",sub="Daybreak",range="Ullr",ammo="Chapuli Arrow",}
	sets.weapons.Dagger = {main="Tauret",sub="Gleti's Knife",range="Ullr",ammo="Chapuli Arrow",}
	sets.weapons.club = {main = "Kaja Rod",}
	sets.weapons.lvl1 = {main="Aern Dagger",sub="Qutrub Knife",range="Ullr",ammo="Chapuli Arrow",}
	sets.weapons.Excalibur = {main="Excalibur",sub={ name="Demers. Degen +1", augments={'Path: A',}},}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
--	sets.engaged = {,range="Ullr",ammo="Chapuli Arrow",,
--		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
--		back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged = {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Ayanmo Corazza +2",
    hands="Bunzi's Gloves",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist="Orpheus Sash",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}

	--[[sets.engaged.DW = {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Ayanmo Corazza +2",
    hands="Bunzi's Gloves",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist="Orpheus Sash",
    left_ear="Suppanomimi",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}]]
	sets.engaged.DW = {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Ayanmo Corazza +2",
    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist="Orpheus's Sash",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
	
		
	sets.engaged.PhysicalDef = {
    head="Malignance Chapeau",
    body="Nyame Mail",
    hands="Bunzi's Gloves",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Malignance Boots",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Ayanmo Ring",
    right_ring="Defending Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
	sets.engaged.MagicalDef = {head="Malignance Chapeau",
    body="Ayanmo Corazza +2",
    hands="Bunzi's Gloves",
    legs="Bunzi's Pants",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Reiki Yotai",
    left_ear="Suppanomimi",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}

end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'DNC' then
		set_macro_page(1, 12)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 12)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 12)
	else
		set_macro_page(1, 12)
	end
end