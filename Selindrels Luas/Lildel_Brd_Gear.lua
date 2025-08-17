function user_setup()
	
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc','PDT')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','PDT')
	state.Weapons:options('None','Aeneas','Blurred','Savage','Evisceration','Club')
	state.HybridMode:options('Normal','PDT')
	-- Adjust this if using the Daurdabla (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
	-- How many extra songs we can keep from Daurdabla/Daurdabla
    info.ExtraSongs = 2
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !q gs c weapons NukeWeapons;gs c update')
	send_command('bind ^q gs c weapons Swords;gs c update')
	send_command('bind @d send Lildel "\/\/ exec dummy.txt"')
	send_command('bind ^h send Lildel "\/\/ exec honor.txt"')
	send_command('bind ^\\\\ input /ma "Chocobo Mazurka" <me>')
	
	
	
	send_command('alias clean input //org organize all clean.lua')
	--[[
	send_command('bind ^numpad1 input /t Bohla inv;input /echo ***Ranged Party***')
	send_command('bind ^numpad2 input /t  Whitte inv;input /echo ***Ranged Party***')
	send_command('bind ^numpad3 input /t Poolcue inv;input /echo **~~~Tank Party~~~**')
	send_command('bind ^numpad4 input /pcmd leave')--]]

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.Aeneas = {main={ name="Aeneas", augments={'Path: A',}},sub="Gleti's Knife",}
	sets.weapons.Blurred = {main={ name="Aeneas", augments={'Path: A',}},sub="Blurred Knife +1",}
	sets.weapons.Savage = {main="Naegling", sub={ name="Demers. Degen +1", augments={'Path: A',}},}
	sets.weapons.Evisceration = {main="Tauret",sub="Gleti's Knife",}
	sets.weapons.Club = {main="Mafic Cudgel",sub="Blurred Knife +1",}
	
	-- Precast Sets
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {head="Volte Cap",hands="Volte Bracers", body="Volte Jupon"})
	-- Fast cast sets for spells
	sets.precast.FC = {main={ name="Grioavolr", augments={'"Fast Cast"+5','MND+5','"Mag.Atk.Bns."+12',}},
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah",
    hands={ name="Leyline Gloves", augments={'Accuracy+9','Mag. Acc.+5','"Mag.Atk.Bns."+6','"Fast Cast"+1',}},
    legs="Aya. Cosciales +2",
    feet="Chelona Boots",
    neck="Loricate Torque +1",
    waist="Witful Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
	back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main={ name="Grioavolr", augments={'"Fast Cast"+5','MND+5','"Mag.Atk.Bns."+12',}},
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah",
    hands={ name="Leyline Gloves", augments={'Accuracy+9','Mag. Acc.+5','"Mag.Atk.Bns."+6','"Fast Cast"+1',}},
    legs="Aya. Cosciales +2",
    feet="Chelona Boots",
    neck="Loricate Torque +1",
    waist="Witful Belt",
    left_ear="Mendi. Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.BardSong = { main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    head="Fili Calot +1",
    body="Inyanga Jubbah",
    hands={ name="Gendewitha Gages", augments={'Phys. dmg. taken -3%','Song spellcasting time -4%',}},
    legs="Aya. Cosciales +2",
    feet={ name="Bihu Slippers", augments={'Enhances "Nightingale" effect',}},
    neck="Aoidos' Matinee",
    waist="Witful Belt",
    left_ear="Enchntr. Earring +1",
    --right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
	back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn",})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn",})
	sets.precast.FC.Lullaby = {range="Daurdabla",}
	sets.precast.FC.Lullaby.Resistant = {range="Daurdabla",}
	sets.precast.FC['Horde Lullaby'] = {range="Daurdabla",}
	sets.precast.FC['Horde Lullaby'].Resistant = {range="Daurdabla",}
	sets.precast.FC['Horde Lullaby'].AoE = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby II'] = {range="Daurdabla",}
	sets.precast.FC['Horde Lullaby II'].Resistant = {range="Daurdabla",}
	sets.precast.FC['Horde Lullaby II'].AoE = {range="Daurdabla",}
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn",})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers"}
	sets.precast.JA.Troubadour = {body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}},}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +1"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {range={ name="Linos", augments={'Accuracy+15','Weapon skill damage +3%','STR+6 DEX+6',}},
    head={ name="Lustratio Cap +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}},
    hands={ name="Lustratio Mittens", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
    legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    feet="Aya. Gambieras +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Ilabrat Ring",
    right_ring="Begrudging Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},}
		
	sets.precast.WS['Rudra\'s Storm'] = {range={ name="Linos", augments={'Accuracy+15','Weapon skill damage +3%','STR+6 DEX+6',}},
    head={ name="Lustratio Cap +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}},
    hands={ name="Lustratio Mittens", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
    legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    feet="Aya. Gambieras +2",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Ilabrat Ring",
    right_ring="Karieyh Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Evisceration'] = {range={ name="Linos", augments={'Accuracy+15','Weapon skill damage +3%','STR+6 DEX+6',}},
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}},
    hands={ name="Lustratio Mittens", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
    legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    feet="Aya. Gambieras +2",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Grunfeld Rope",
    right_ear="Mache Earring +1",
    left_ring="Ilabrat Ring",
    right_ring="Begrudging Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Savage Blade'] = {range={ name="Linos", augments={'Accuracy+15','Weapon skill damage +3%','STR+6 DEX+6',}},
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Ilabrat Ring",
    right_ring="Karieyh Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Aeolian Edge'] = {range={ name="Linos", augments={'Accuracy+15','Weapon skill damage +3%','STR+6 DEX+6',}},
    head="Nyame Helm",
    body="Ischemia Chasu.",
    hands="Bunzi's Gloves",
    legs={ name="Lengo Pants", augments={'INT+9','Mag. Acc.+15','"Mag.Atk.Bns."+14',}},
    feet={ name="Chironic Slippers", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','INT+7','"Refresh"+1','Accuracy+19 Attack+19','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Hecate's Earring",
    left_ring="Shiva Ring +1",
    right_ring="Epaminondas's Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {main={ name="Grioavolr", augments={'"Fast Cast"+5','MND+5','"Mag.Atk.Bns."+12',}},
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah",
    hands={ name="Leyline Gloves", augments={'Accuracy+9','Mag. Acc.+5','"Mag.Atk.Bns."+6','"Fast Cast"+1',}},
    legs="Aya. Cosciales +2",
    feet="Chelona Boots",
    neck="Loricate Torque +1",
    waist="Witful Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",}

	-- Gear to enhance certain classes of songs
	sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
	sets.midcast.Lullaby = {range="Gjallarhorn", hands="Brioso Cuffs +2"}
	sets.midcast.Lullaby.Resistant = {range="Gjallarhorn", hands="Brioso Cuffs +2"}
	sets.midcast['Horde Lullaby'] = {range="Daurdabla", hands="Brioso Cuffs +2"}
	sets.midcast['Horde Lullaby'].Resistant = {range="Daurdabla", hands="Brioso Cuffs +2"}
	sets.midcast['Horde Lullaby'].AoE = {range="Daurdabla", hands="Brioso Cuffs +2"}
	sets.midcast['Horde Lullaby II'] = {range="Daurdabla", hands="Brioso Cuffs +2"}
	sets.midcast['Horde Lullaby II'].Resistant = {range="Daurdabla", hands="Brioso Cuffs +2"}
	sets.midcast['Horde Lullaby II'].AoE = {range="Daurdabla", hands="Brioso Cuffs +2"}
	sets.midcast.Madrigal = {head="Fili Calot +1"}
	sets.midcast.Paeon = {head="Brioso Roundlet +1"}
	sets.midcast.March = {hands="Fili Manchettes +1"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Minne = {}
	sets.midcast.Carol = {hands="Mousai Gages +1"}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"} --feet="Fili Cothurnes +1" Brioso Slippers still provides more Duration
	sets.midcast['Magic Finale'] = {range="Gjallarhorn"}
	sets.midcast.Mazurka = {range="Marsyas"}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    sub="Genmei Shield",
    --range="Gjallarhorn",
    head={ name="Bihu Roundlet +3", augments={'Enhances "Con Anima" effect',}},
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Mnbw. Whistle +1",
    waist="Witful Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Handler's Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}
		
	sets.midcast.SongEffect.DW = {main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    sub="Legato Dagger",
    --range="Gjallarhorn",
    head={ name="Bihu Roundlet +3", augments={'Enhances "Con Anima" effect',}},
    body="Fili Hongreline +1",
    hands="Mousai Gages +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +2",
    neck="Mnbw. Whistle +1",
    waist="Witful Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Handler's Earring +1",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {main="Tauret",
    sub="Ammurapi Shield",
    range="Gjallarhorn",
    head={ name="Bihu Roundlet +3", augments={'Enhances "Con Anima" effect',}},
    body="Brioso Justau. +2",
    hands="Brioso Cuffs +2",
    legs="Brioso Cann. +1",
    feet="Brioso Slippers +2",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {main="Tauret",
    sub="Ammurapi Shield",
    range="Gjallarhorn",
    head={ name="Bihu Roundlet +3", augments={'Enhances "Con Anima" effect',}},
    body="Brioso Justau. +2",
    hands="Brioso Cuffs +2",
    legs="Brioso Cann. +1",
    feet="Brioso Slippers +2",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah",
    hands={ name="Leyline Gloves", augments={'Accuracy+9','Mag. Acc.+5','"Mag.Atk.Bns."+6','"Fast Cast"+1',}},
    legs="Aya. Cosciales +2",
    feet="Chelona Boots",
    neck="Loricate Torque +1",
    waist="Witful Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
	back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}
		
	sets.midcast.SongDebuff.DW = {main="Tauret",
    sub="Naegling",
    range="Gjallarhorn",
    head={ name="Bihu Roundlet +3", augments={'Enhances "Con Anima" effect',}},
    body="Brioso Justau. +2",
    hands="Brioso Cuffs +2",
    legs="Brioso Cann. +1",
    feet="Brioso Slippers +2",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {main={ name="Serenity", augments={'MP+10','"Cure" spellcasting time -7%',}},
    sub="Enki Strap",
    range="Gjallarhorn",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Chironic Doublet",
    hands="Hieros Mittens",
    legs="Artsieq Hose",
    feet="Skaoi Boots",
    neck="Nodens Gorget",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
		
	sets.midcast['Enhancing Magic'] = {main="Serenity",sub="Fulcio Grip",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Voltsurge Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Intarabus's Cape",waist="Witful Belt",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
		
	sets.midcast['Elemental Magic'] = {main="Marin Staff +1",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Sekhmet Corset",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast['Elemental Magic'].Resistant = {main="Marin Staff +1",sub="Clerisy Strap +1",ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Yamabuki-no-Obi",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	-- Resting sets
	sets.resting = {main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Genmei Kabuto",
    body="Ischemia Chasu.",
    hands={ name="Bihu Cuffs", augments={'Enhances "Con Brio" effect',}},
    legs="Aya. Cosciales +2",
    feet={ name="Chironic Slippers", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','INT+7','"Refresh"+1','Accuracy+19 Attack+19','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Domin. Earring +1",
    right_ear="Dominance Earring",
    left_ring="Defending Ring",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}
	
	sets.idle = {main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Genmei Kabuto",
    body="Ischemia Chasu.",
    hands={ name="Bihu Cuffs", augments={'Enhances "Con Brio" effect',}},
    legs="Aya. Cosciales +2",
    feet="Fili Cothurnes +1",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Domin. Earring +1",
    right_ear="Reraise Earring",
    left_ring="Defending Ring",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}

	sets.idle.PDT = {main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    sub="Genmei Shield",
    ammo="Staunch Tathlum",
    head="Genmei Kabuto",
    body="Ischemia Chasu.",
    hands={ name="Bihu Cuffs", augments={'Enhances "Con Brio" effect',}},
    legs="Aya. Cosciales +2",
    feet="Fili Cothurnes +1",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Domin. Earring +1",
    right_ear="Dominance Earring",
    left_ring="Defending Ring",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}
	
	-- Defense sets

	sets.defense.PDT = {range={ name="Linos", augments={'Accuracy+18','"Dbl.Atk."+2','Quadruple Attack +2',}},
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +1",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}

	sets.defense.MDT = {range={ name="Linos", augments={'Accuracy+18','"Dbl.Atk."+2','Quadruple Attack +2',}},
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +1",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}

	sets.Kiting = {feet="Fili Cothurnes  +1"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {range={ name="Linos", augments={'Accuracy+14','"Store TP"+4','Quadruple Attack +3',}},
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Ashera Harness",
    hands="Bunzi's Gloves",
    legs={ name="Zoar Subligar +1", augments={'Path: A',}},
    feet={ name="Chironic Slippers", augments={'Accuracy+20 Attack+20','"Dbl.Atk."+4','DEX+7',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Moonbeam Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	
	sets.engaged.Acc = {range={ name="Linos", augments={'Accuracy+14','"Store TP"+4','Quadruple Attack +3',}},
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Ayanmo Corazza +2",
    hands="Bunzi's Gloves",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Chirich Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	
	sets.engaged.DW = {range={ name="Linos", augments={'Accuracy+14','"Store TP"+4','Quadruple Attack +3',}},
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Ashera Harness",
    hands="Bunzi's Gloves",
    legs={ name="Zoar Subligar +1", augments={'Path: A',}},
    feet={ name="Chironic Slippers", augments={'Accuracy+20 Attack+20','"Dbl.Atk."+4','DEX+7',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Moonbeam Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	
	sets.engaged.DW.Acc = {range={ name="Linos", augments={'Accuracy+14','"Store TP"+4','Quadruple Attack +3',}},
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Ayanmo Corazza +2",
    hands="Bunzi's Gloves",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Chirich Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	
	sets.engaged.PDT = {range={ name="Linos", augments={'Accuracy+14','"Store TP"+4','Quadruple Attack +3',}},
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Ayanmo Corazza +2",
    hands="Bunzi's Gloves",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Defending Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(10, 11)
end