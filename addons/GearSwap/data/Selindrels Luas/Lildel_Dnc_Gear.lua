-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DTLite','PDT','MDT')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder','Proc')
	state.IdleMode:options('Normal', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Aeneas','TerpGleti','H2H')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWEarrings','DWMax'}

	
	gear.stp_jse_back = {name="Senuna's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.wsd_jse_back = {name="Senuna's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	
    -- Additional local binds
    send_command('bind numpad1 gs c step')
	send_command('bind ` input /ja "Presto" <me>')
	send_command('bind gs c toggle usealtstep')
	send_command('bind numpad* gs c cycle mainstep')
	send_command('bind !@` gs c cycle altstep')
    send_command('bind ^` input /ja "Saber Dance" <me>')
    send_command('bind !` input /ja "Fan Dance" <me>')
	send_command('bind ^\\\\ input /ja "Chocobo Jig II" <me>')
	send_command('bind !\\\\ input /ja "Spectral Jig" <me>')
	send_command('bind !backspace input /ja "Reverse Flourish" <me>')
	send_command('bind ^backspace input /ja "No Foot Rise" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	
	send_command('bind ^delete input /ja "Curing Waltz IV" <me>')
	send_command('bind ^insert input /ja "Curing Waltz IV" <stal>')
	send_command('bind %numpad1 input /ja "Presto" <me>')
	send_command('bind %numpad2 input /ja "Box Step" <t>')
	send_command('bind %numpad3 input /ja "Feather Step" <t>')
	
	
	
	
	
	
	
	
	

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {head="Volte Cap",
	hands="Volte Bracers",
    body="Volte Jupon",})
	
	
	
    -- Extra Melee sets.  Apply these on top of melee sets.
	sets.Suppa = {ear1="Suppanomimi", ear2="Sherida Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},left_ear="Suppanomimi",right_ear="Mache Earring +1",}
	
	-- Weapons sets
	sets.weapons.Aeneas = {main={ name="Aeneas", augments={'Path: A',}},
    sub="Gleti's Knife",}
	sets.weapons.TerpGleti = {main={ name="Terpsichore", augments={'Path: A',}},sub="Gleti's Knife",}
	sets.weapons.H2H = {main = "Karambit",}
	
    -- Precast Sets
    
    -- Precast sets to enhance JAs

    sets.precast.JA['No Foot Rise'] = {body="Horos Casaque"} 

    sets.precast.JA['Trance'] = {head="Horos Tiara +3"} --head="Horos Tiara +1"
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
    head="Mummu Bonnet +1",
    body="Maxixi Casaque +2",
    hands="Malignance Gloves",
    legs="Dashing Subligar",
    feet="Maxixi Shoes +1",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Aristo Belt",
    left_ear="Handler's Earring +1",
    right_ear="Enchntr. Earring +1",
    left_ring="Carb. Ring",
    right_ring="Mummu Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Samba = {"Maxixi Tiara +2"} --head="Maxixi Tiara"

    sets.precast.Jig = {legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},feet="Maxixi Shoes +1",}

    sets.precast.Step = {ammo="Yamarang",
    head="Maxixi Tiara +2",
    body="Maxixi Casaque +2",
    hands="Maxixi Bangles +3",
    legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},
    feet={ name="Horos T. Shoes +3", augments={'Enhances "Closed Position" effect',}},
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Kentarch Belt +1",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Regal Ring",
    right_ring="Chirich Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},}
		
    sets.Enmity = {--ammo="Paeapua",
       -- head="Genmei Kabuto",neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Trux Earring",
       -- body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Petrov Ring",ring2="Vengeful Ring",
       -- back="Solemnity Cape",waist="Goading Belt",legs=gear.herculean_dt_legs,feet=gear.herculean_dt_feet
		
	ammo="Charitoni Sling",
    head="Meghanada Visor +2",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Zoar Subligar +1",
    feet="Ahosi Leggings",
    neck="Unmoving Collar",
    waist="Warwolf Belt",
    left_ear="Eris' Earring",
    right_ear="Friomisi Earring",
    left_ring="Provocare Ring",
    right_ring="Supershear Ring",
    back="Moonbeam Cape",	}
		
    sets.precast.JA.Provoke = sets.Enmity

    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {--ammo="Falcon Eye",
        --head="Dampening Tam",neck="Combatant's Torque",ear1="Telos Earring",ear2="Digni. Earring",
        --body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        --back=gear.stp_jse_back,waist="Olseni Belt",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet
		
	ammo="Pemphredo Tathlum",
    head="Mummu Bonnet +1",
    body="Mummu Jacket +2",
    hands="Mummu Wrists +2",
    legs="Mummu Kecks +1",
    feet="Mummu Gamash. +1",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Digni. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back="Solemnity Cape",}
		
    sets.precast.Flourish1['Animated Flourish'] = sets.Enmity
		
    sets.precast.Flourish1['Desperate Flourish'] = {--ammo="Falcon Eye",
        --head="Dampening Tam",neck="Combatant's Torque",ear1="Telos Earring",ear2="Digni. Earring",
        --body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        --back=gear.stp_jse_back,waist="Olseni Belt",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet
		
		ammo="Yamarang",
    head="Meghanada Visor +2",
    body="Mummu Jacket +2",
    hands="Mummu Wrists +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Etoile Gorget +1",
    waist="Kentarch Belt +1",
    left_ear="Digni. Earring",
    right_ear="Mache Earring",
    left_ring="Ilabrat Ring",
    right_ring="Mummu Ring",
    back="Xucau Mantle",}

    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = {back="Toetapper Mantle"} --hands="Macu. Bangles +1"

    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {} --body="Charis Casaque +2"
    sets.precast.Flourish3['Climactic Flourish'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {--ammo="Impatiens",
		--head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		--body="Dread Jupon",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		--legs="Rawhide Trousers"
		
		ammo="Staunch Tathlum",
    head={ name="Herculean Helm", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Store TP"+1','STR+7','Mag. Acc.+13','"Mag.Atk.Bns."+12',}},
    body="Dread Jupon",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}},
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Defending Ring",
    right_ring="Prolix Ring",
    back="Moonbeam Cape",}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {--ammo="Falcon Eye",
       -- head="Dampening Tam",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Sherida Earring",
       -- body="Adhemar Jacket +1",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Regal Ring",
        --back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Samnuha Tights",feet=gear.herculean_wsd_feet
		
	ammo="Voluspa Tathlum",
    head={ name="Lustratio Cap +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    body="Gleti's Cuirass",
    hands="Maxixi Bangles +3",
    legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},
    feet="Mummu Gamash. +1",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},}
		
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},})
	
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Yamarang",
    head={ name="Lustratio Cap +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands="Maxixi Bangles +3",
    legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},
    feet="Meg. Jam. +2",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
	
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",})
	
	sets.precast.WS.Proc = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Rudra\'s Storm'] = set_combine(sets.precast.WS, {ammo="C. Palug Stone",
    head={ name="Lustratio Cap +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    body="Lustratio Harness",
    hands="Maxixi Bangles +3",
    legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},
    feet="Gleti's Boots",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Beithir Ring",
    right_ring="Karieyh Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
	
    sets.precast.WS['Rudra\'s Storm'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="C. Palug Stone",
    head={ name="Lustratio Cap +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    body="Lustratio Harness",
    hands="Maxixi Bangles +3",
    legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},
    feet="Gleti's Boots",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Beithir Ring",
    right_ring="Karieyh Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
})
	
    sets.precast.WS['Rudra\'s Storm'].Acc = set_combine(sets.precast.WS.Acc, {ammo="C. Palug Stone",
    head={ name="Lustratio Cap +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    body="Lustratio Harness",
    hands="Maxixi Bangles +3",
    legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},
    feet="Gleti's Boots",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Beithir Ring",
    right_ring="Karieyh Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
})
	
	sets.precast.WS['Rudra\'s Storm'].FullAcc = {ammo="C. Palug Stone",
	head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
	neck={ name="Warder's Charm +1", augments={'Path: A',}},
	waist="Grunfeld Rope",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Mujin Band",
    right_ring="Karieyh Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
	}
	
    sets.precast.WS['Rudra\'s Storm'].Fodder = set_combine(sets.precast.WS['Rudra\'s Storm'], {})
	
	
    sets.precast.WS['Shark Bite'] = set_combine(sets.precast.WS['Rudra\'s Storm'])
	
    sets.precast.WS['Shark Bite'].SomeAcc = set_combine(sets.precast.WS['Rudra\'s Storm'].SomeAcc)
	
    sets.precast.WS['Shark Bite'].Acc = set_combine(sets.precast.WS['Rudra\'s Storm'].Acc)
	
	sets.precast.WS['Shark Bite'].FullAcc = set_combine(sets.precast.WS['Rudra\'s Storm'].FullAcc)
	
    sets.precast.WS['Shark Bite'].Fodder = set_combine(sets.precast.WS['Shark Bite'], {})
	
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Charis Feather",
    head="Blistering Sallet +1",
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck="Etoile Gorget +1",
    waist="Light Belt",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Ilabrat Ring",
    right_ring="Begrudging Ring",
    back={ name="Toetapper Mantle", augments={'"Store TP"+3','"Dual Wield"+4','"Rev. Flourish"+25',}},})
	
    sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Charis Feather",
    head="Blistering Sallet +1",
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck="Etoile Gorget +1",
    waist="Light Belt",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Ilabrat Ring",
    right_ring="Begrudging Ring",
    back={ name="Toetapper Mantle", augments={'"Store TP"+3','"Dual Wield"+4','"Rev. Flourish"+25',}},})
	
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Falcon Eye",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Mummu Jacket +2",
    hands="Mummu Wrists +2",
    legs="Mummu Kecks +1",
    feet="Mummu Gamash. +1",
    neck="Etoile Gorget +1",
    waist="Light Belt",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Ilabrat Ring",
    right_ring="Begrudging Ring",
    back={ name="Toetapper Mantle", augments={'"Store TP"+3','"Dual Wield"+4','"Rev. Flourish"+25',}},})
	
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Falcon Eye",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Mummu Jacket +2",
    hands="Mummu Wrists +2",
    legs="Mummu Kecks +1",
    feet="Mummu Gamash. +1",
    neck="Etoile Gorget +1",
    waist="Light Belt",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Ilabrat Ring",
    right_ring="Begrudging Ring",
    back={ name="Toetapper Mantle", augments={'"Store TP"+3','"Dual Wield"+4','"Rev. Flourish"+25',}},})
	
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {ammo="Charis Feather",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Etoile Gorget +1",
    waist="Light Belt",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Ilabrat Ring",
    right_ring="Begrudging Ring",
    back={ name="Toetapper Mantle", augments={'"Store TP"+3','"Dual Wield"+4','"Rev. Flourish"+25',}},})
	
    sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.precast.WS, {ammo="Coiste Bodhar",
    head="Gleti's Mask",
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Mache Earring +1",
    left_ring="Regal Ring",
    right_ring="Petrov Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Mag. Evasion+15',}},})
	
    sets.precast.WS['Pyrrhic Kleos'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Coiste Bodhar",
    head="Gleti's Mask",
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Mache Earring +1",
    left_ring="Regal Ring",
    right_ring="Petrov Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Mag. Evasion+15',}},})
	
    sets.precast.WS['Pyrrhic Kleos'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Yamarang",
    head={ name="Lustratio Cap +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wristbands", augments={'Accuracy+15','Attack+15','"Subtle Blow"+7',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Meg. Jam. +2",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Mache Earring +1",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Mag. Evasion+15',}},})
	
	sets.precast.WS['Pyrrhic Kleos'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Yamarang",
    head={ name="Lustratio Cap +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wristbands", augments={'Accuracy+15','Attack+15','"Subtle Blow"+7',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Meg. Jam. +2",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Mache Earring +1",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Mag. Evasion+15',}},})
	
	sets.precast.WS['Pyrrhic Kleos'].Fodder = set_combine(sets.precast.WS['Pyrrhic Kleos'], {ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Mache Earring +1",
    left_ring="Regal Ring",
    right_ring="Petrov Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Mag. Evasion+15',}},})

    sets.precast.WS['Aeolian Edge'] = {ammo="Pemphredo Tathlum",
    head={ name="Herculean Helm", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Store TP"+1','STR+7','Mag. Acc.+13','"Mag.Atk.Bns."+12',}},
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands={ name="Herculean Gloves", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Mag. Acc.+15','"Mag.Atk.Bns."+10',}},
    legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +3%','INT+15','Mag. Acc.+2',}},
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Karieyh Ring",
    right_ring="Shiva Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Sherida Earring"}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Sherida Earring"}
	
    sets.Skillchain = {hands={ name="Nyame Gauntlets", augments={'Path: B',}},legs="Maxixi Tights +2",} --hands="Charis Bangles +2"
    
    
    -- Midcast Sets
    
    sets.midcast.FastRecast = {
        head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Rawhide Trousers",feet=gear.herculean_dt_feet}
        
    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    sets.ExtraRegen = {}
    

    -- Idle sets

    sets.idle = {ammo="Yamarang",
    head="Gleti's Mask",
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck="Loricate Torque +1",
    waist="Reiki Yotai",
    left_ear="Infused Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Chirich Ring",
    right_ring="Karieyh Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})
    
    -- Defense sets

    sets.defense.PDT = {ammo="Yamarang",
    head="Gleti's Mask",
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck="Loricate Torque +1",
    waist="Reiki Yotai",
    left_ear="Infused Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Chirich Ring",
    right_ring="Karieyh Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},}

    sets.defense.MDT = {ammo="Staunch Tathlum",
    head="Malignance Chapeau",
    body="Gleti's Cuirass",
    hands="Malignance Gloves",
    legs="Gleti's Breeches",
    feet="Malignance Boots",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Hearty Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
    head="Malignance Chapeau",
    body="Gleti's Cuirass",
    hands="Malignance Gloves",
    legs="Gleti's Breeches",
    feet="Malignance Boots",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Hearty Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},}

    sets.Kiting = {}--feet="Skadi's Jambeaux +1"

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		
	ammo="Coiste Bodhar",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Horos T. Shoes +3", augments={'Enhances "Closed Position" effect',}},
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
    sets.engaged.DTLite = {ammo="Yamarang",
    head="Malignance Chapeau",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands="Turms Mittens +1",
    legs="Gleti's Breeches",
    feet="Turms Leggings +1",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Hermodr Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Defending Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
    sets.engaged.SomeAcc = {ammo="Aurgelmir Orb +1",
    head="Malignance Chapeau",
    body="Ashera Harness",
    hands="Malignance Gloves",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Horos T. Shoes +3", augments={'Enhances "Closed Position" effect',}},
    neck="Anu Torque",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring",
    right_ring="Ilabrat Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},}
    
	sets.engaged.Acc = {ammo="C. Palug Stone",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Gleti's Breeches",
    feet={ name="Horos T. Shoes +3", augments={'Enhances "Closed Position" effect',}},
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Mache Earring +1",
    left_ring="Ilabrat Ring",
    right_ring="Mummu Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},}
		
    sets.engaged.FullAcc = {ammo="C. Palug Stone",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Gleti's Breeches",
    feet={ name="Horos T. Shoes +3", augments={'Enhances "Closed Position" effect',}},
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Kentarch Belt +1",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Ilabrat Ring",
    right_ring="Regal Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},}

    sets.engaged.Fodder = {}

    sets.engaged.PDT = {ammo="Coiste Bodhar",
    head="Malignance Chapeau",
    body="Gleti's Cuirass",
    hands="Malignance Gloves",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Moonbeam Ring",
    right_ring="Defending Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},}

    sets.engaged.SomeAcc.PDT = {ammo="Coiste Bodhar",
    head="Malignance Chapeau",
    body="Gleti's Cuirass",
    hands="Malignance Gloves",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Moonbeam Ring",
    right_ring="Defending Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
    sets.engaged.Acc.PDT = {ammo="Coiste Bodhar",
    head="Malignance Chapeau",
    body="Gleti's Cuirass",
    hands="Malignance Gloves",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Moonbeam Ring",
    right_ring="Defending Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},}

    sets.engaged.FullAcc.PDT = {ammo="Coiste Bodhar",
    head="Malignance Chapeau",
    body="Gleti's Cuirass",
    hands="Malignance Gloves",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Moonbeam Ring",
    right_ring="Defending Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
    sets.engaged.Fodder.PDT = {}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Saber Dance'] = {ammo="Aurgelmir Orb +1",
    head="Malignance Chapeau",
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands="Malignance Gloves",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},} --legs="Horos Tights"
	
    sets.buff['Climactic Flourish'] = {ammo="C. Palug Stone",
    head="Maculele Tiara +1",
    body="Gleti's Cuirass",
    hands="Maxixi Bangles +3",
    legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},
    feet="Nyame Sollerets",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Kentarch Belt +1",
    left_ear="Odr Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Karieyh Ring",
    right_ring="Beithir Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},}
	
	sets.buff['AM'] = {ammo="Aurgelmir Orb +1",
    head="Malignance Chapeau",
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands="Malignance Gloves",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck={ name="Etoile Gorget +1", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},}
	
	sets.buff['Striking Flourish'] = {ammo="Coiste Bodhar",
    head={ name="Horos Tiara +3", augments={'Enhances "Trance" effect',}},
    body="Macu. Casaque +1",
    hands="Mummu Wrists +2",
    legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck="Lissome Necklace",
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Sherida Earring",
    left_ring="Regal Ring",
    right_ring="Mummu Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Mag. Evasion+15',}},}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}--head="Frenzy Sallet"
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 20)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 20)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 20)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 20)
    else
        set_macro_page(1, 20)
    end
end