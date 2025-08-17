-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc','FullAcc','Fodder')
    state.HybridMode:options('Pet','DT','Normal')
    state.WeaponskillMode:options('Match','Normal','Acc','FullAcc','Fodder')
    state.PhysicalDefenseMode:options('PDT')
	state.IdleMode:options('Normal','PDT','Refresh')
	state.Weapons:options('None','Godhands','PetWeapons')
	state.PetMode = M{['description']='Pet Mode', 'None','Melee','Ranged','HybridRanged','Bruiser','Tank','LightTank','Magic','Heal','Nuke'}
	state.AutoRepairMode = M(false, 'Auto Repair Mode')
	state.AutoDeployMode = M(true, 'Auto Deploy Mode')
	state.AutoPetMode 	 = M(false, 'Auto Pet Mode')
	state.PetWSGear		 = M(false, 'Pet WS Gear')
	state.PetEnmityGear	 = M(false, 'Pet Enmity Gear')
	
    -- Default/Automatic maneuvers for each pet mode.  Define at least 3.
	defaultManeuvers = {
		Melee = {
			{Name='Fire Maneuver', 	  Amount=1},
			{Name='Thunder Maneuver', Amount=0},
			{Name='Wind Maneuver', 	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
		},
		Bruiser = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Water Maneuver',   Amount=0},
			{Name='Fire Maneuver', 	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
		},
		Ranged = {
			{Name='Wind Maneuver', 	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Thunder Maneuver', Amount=0},
		},
		HybridRanged = {
			{Name='Wind Maneuver', 	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Thunder Maneuver', Amount=0},
		},
		Tank = {
			{Name='Earth Maneuver',	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=0},
		},
		LightTank = {
			{Name='Earth Maneuver',	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=0},
		},
		Magic = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Ice Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=1},
			{Name='Earth Maneuver',	  Amount=0},
		},
		Heal = {
			{Name='Light Maneuver',	  Amount=2},
			{Name='Dark Maneuver',	  Amount=1},
			{Name='Water Maneuver',	  Amount=0},
			{Name='Earth Maneuver',	  Amount=0},
		},
		Nuke = {
			{Name='Ice Maneuver',	  Amount=2},
			{Name='Dark Maneuver',	  Amount=1},
			{Name='Water Maneuver',	  Amount=0},
			{Name='Earth Maneuver',	  Amount=0},
		},
	}

	deactivatehpp = 85
	
    select_default_macro_book()
	
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @f8 gs c toggle AutoPuppetMode')
	send_command('bind @f7 gs c toggle AutoRepairMode')
end

-- Define sets used by this job file.
function init_gear_sets()
    
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC ={ name="Herculean Helm", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Store TP"+1','STR+7','Mag. Acc.+13','"Mag.Atk.Bns."+12',},
    feet="Regal Pumps",
    neck="Loricate Torque +1",
    left_ear="Loquac. Earring",
    left_ring="Prolix Ring",}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

    
    -- Precast sets to enhance JAs
    sets.precast.JA['Tactical Switch'] = {feet="Karagoz Scarpe"}
    sets.precast.JA['Repair'] = {ammo="Automat. Oil +3"} --feet="Foire Babouches"
	sets.precast.JA['Maintenance'] = {ammo="Automat. Oil +3"}

    sets.precast.JA.Maneuver = {main="Midnights",
	    neck = "Buffoon's Collar +1",
        body = "Karagoz Farsetto +1",
        hands = "Foire Dastanas +1",
        back = "Visucius's Mantle",} --neck="Buffoon's Collar",hands="Foire Dastanas",body="Cirque Farsetto +2",

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Hiza. Somen　+2",
    body="Hiza. Haramaki +1",
    hands="Hizamaru Kote +1",
    legs="Hiza. Hizayoroi +2",
    feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    neck="Unmoving Collar",
    waist="Chaac Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Genmei Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back="Solemnity Cape",}
        
    sets.precast.Waltz['Healing Waltz'] = {}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Tali'ah Turban +2",
    body="Tali'ah Manteel +2",
    hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck="Flame Gorget",
    waist="Moonbow Belt",
    left_ear="Brutal Earring",
    right_ear="Mache Earring +1",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Dispersal Mantle", augments={'STR+2','DEX+2','Pet: TP Bonus+460','"Martial Arts"+13',}},}
	
	sets.precast.WS.Acc = {head="Tali'ah Turban +2",
    body="Tali'ah Manteel +2",
    hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck="Flame Gorget",
    waist="Moonbow Belt",
    left_ear="Brutal Earring",
    right_ear="Mache Earring +1",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Dispersal Mantle", augments={'STR+2','DEX+2','Pet: TP Bonus+460','"Martial Arts"+13',}},}
	
	sets.precast.WS.FullAcc = {head="Tali'ah Turban +2",
    body="Tali'ah Manteel +2",
    hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck="Flame Gorget",
    waist="Moonbow Belt",
    left_ear="Brutal Earring",
    right_ear="Mache Earring +1",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Dispersal Mantle", augments={'STR+2','DEX+2','Pet: TP Bonus+460','"Martial Arts"+13',}},}
		
	sets.precast.WS.Fodder = {head="Tali'ah Turban +2",
    body="Tali'ah Manteel +2",
    hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck="Flame Gorget",
    waist="Moonbow Belt",
    left_ear="Brutal Earring",
    right_ear="Mache Earring +1",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Dispersal Mantle", augments={'STR+2','DEX+2','Pet: TP Bonus+460','"Martial Arts"+13',}},}
	
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Victory Smite'] = set_combine(sets.precast.WS, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Begrudging Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
    sets.precast.WS['Victory Smite'].Acc = set_combine(sets.precast.WS.Acc, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Begrudging Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	sets.precast.WS['Victory Smite'].FullAcc = set_combine(sets.precast.WS.FullAcc, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Begrudging Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	sets.precast.WS['Victory Smite'].Fodder = set_combine(sets.precast.WS.Fodder, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Begrudging Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
    sets.precast.WS['Stringing Pummel'] = set_combine(sets.precast.WS, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Begrudging Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
    sets.precast.WS['Stringing Pummel'].Acc = set_combine(sets.precast.WS.FullAcc, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Begrudging Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	sets.precast.WS['Stringing Pummel'].FullAcc = set_combine(sets.precast.WS.FullAcc, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Begrudging Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	sets.precast.WS['Stringing Pummel'].Fodder = set_combine(sets.precast.WS.Fodder, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Begrudging Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
    sets.precast.WS['Shijin Spiral'].Acc = set_combine(sets.precast.WS.Acc, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	sets.precast.WS['Shijin Spiral'].FullAcc = set_combine(sets.precast.WS.FullAcc, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	sets.precast.WS['Shijin Spiral'].Fodder = set_combine(sets.precast.WS.Fodder, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	
    sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
    sets.precast.WS['Asuran Fists'].Acc = set_combine(sets.precast.WS.Acc, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	sets.precast.WS['Asuran Fists'].FullAcc = set_combine(sets.precast.WS.FullAcc, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	sets.precast.WS['Asuran Fists'].Fodder = set_combine(sets.precast.WS.Fodder, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	
    sets.precast.WS['Dragon Kick'] = set_combine(sets.precast.WS, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
    sets.precast.WS['Dragon Kick'].Acc = set_combine(sets.precast.WS.Acc, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	sets.precast.WS['Dragon Kick'].FullAcc = set_combine(sets.precast.WS.FullAcc, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	sets.precast.WS['Dragon Kick'].Fodder = set_combine(sets.precast.WS.Fodder, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	

    sets.precast.WS['Tornado Kick'] = set_combine(sets.precast.WS, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
    sets.precast.WS['Tornado Kick'].Acc = set_combine(sets.precast.WS.Acc, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	sets.precast.WS['Tornado Kick'].FullAcc = set_combine(sets.precast.WS.FullAcc, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	sets.precast.WS['Tornado Kick'].Fodder = set_combine(sets.precast.WS.Fodder, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Mpaca's Doublet",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck="Flame Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	
    --[[sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Asuran Fists'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Asuran Fists'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Asuran Fists'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	]]
    sets.precast.WS['Raging Fists'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Raging Fists'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Raging Fists'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Raging Fists'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    --[[sets.precast.WS['Howling Fist'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Howling Fist'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Howling Fist'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Howling Fist'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	]]
    sets.precast.WS['Backhand Blow'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Backhand Blow'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Backhand Blow'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Backhand Blow'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Spinning Attack'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Spinning Attack'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Spinning Attack'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Shoulder Tackle'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Shoulder Tackle'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Shoulder Tackle'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Shoulder Tackle'].Fodder = set_combine(sets.precast.WS.Fodder, {})
    -- Midcast Sets

    sets.midcast.FastRecast = {
		head={ name="Herculean Helm", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Store TP"+1','STR+7','Mag. Acc.+13','"Mag.Atk.Bns."+12',}},
    feet="Regal Pumps",
    neck="Loricate Torque +1",
    left_ear="Loquac. Earring",
    left_ring="Prolix Ring",}
	
	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	
    -- Midcast sets for pet actions
    sets.midcast.Pet.Cure = {}
	sets.midcast.Pet['Enfeebling Magic'] = {ammo="Automat. Oil +3",
    head="Tali'ah Turban +2",
    body="Tali'ah Manteel +2",
    hands="Tali'ah Gages +2",
    legs="Tali'ah Sera. +1",
    feet="Tali'ah Crackows +2",
    neck={ name="Pup. Collar +1", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Enmerkar Earring",
    left_ring="Overbearing Ring",
    right_ring="Tali'ah Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}
	
    sets.midcast.Pet['Elemental Magic'] = {head="Mpaca's Cap",
    body={ name="Herculean Vest", augments={'Pet: "Mag.Atk.Bns."+22','"Store TP"+1',}},
    hands="Mpaca's Gloves",
    legs="Mpaca's Hose",
    feet={ name="Pitre Babouches +1", augments={'Enhances "Role Reversal" effect',}},
    neck="Adad Amulet",
    waist="Incarnation Sash",
    left_ear="Enmerkar Earring",
    right_ear="Kyrene's Earring",
    left_ring="Tali'ah Ring",
    right_ring="C. Palug Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}
	
	
	-- The following sets are predictive and are equipped before we even know the ability will happen, as a workaround due to
	-- the fact that start of ability packets are too late in the case of Pup abilities, WS, and certain spells.
	sets.midcast.Pet.PetEnmityGear = {head="Heyoka Cap",
    body="Heyoka Harness",
    hands="Heyoka Mittens",
    legs="Heyoka Subligar",
    feet="Heyoka Leggings",}
	
	sets.midcast.Pet.PetWSGear = { main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},
    ammo="Automat. Oil +3",
    head="Karagoz Capello +1",
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -3%',}},
    legs={ name="Herculean Trousers", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: STR+7','Pet: Attack+5 Pet: Rng.Atk.+5',}},
    feet="Tali'ah Crackows +2",
    neck="Shulmanu Collar",
    waist="Klouskap Sash +1",
    left_ear="Handler's Earring +1",
    right_ear="Enmerkar Earring",
    left_ring="Varar Ring +1",
    right_ring="Overbearing Ring",
    back={ name="Dispersal Mantle", augments={'STR+2','DEX+2','Pet: TP Bonus+460','"Martial Arts"+13',}},}
	
    sets.midcast.Pet.PetWSGear.Ranged = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Melee = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Tank = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Bruiser = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.LightTank = set_combine(sets.midcast.Pet.PetWSGear, {})
    sets.midcast.Pet.PetWSGear.Magic = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Heal = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Nuke = set_combine(sets.midcast.Pet.PetWSGear, {})
    
	-- Currently broken, preserved in case of future functionality.
	--sets.midcast.Pet.WeaponSkill = {}

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {ammo="Automat. Oil +3",
	head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    neck="Bathy Choker",
    waist="Isa Belt",
    left_ear="Enmerkar Earring",
    right_ear="Handler's Earring +1",
    left_ring="Tali'ah Ring",
    right_ring="Overbearing Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}
    

    -- Idle sets

    sets.idle = {
        ammo="Automat. Oil +3",
    head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs="Mpaca's Hose",
    feet="Hermes' Sandals",
    neck="Loricate Torque +1",
    waist="Moonbow Belt",
    left_ear="Enmerkar Earring",
    right_ear="Handler's Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}
		
	sets.idle.Refresh = {ammo="Automat. Oil +3",
    head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs="Mpaca's Hose",
    feet="Hermes' Sandals",
    neck="Loricate Torque +1",
    waist="Moonbow Belt",
    left_ear="Enmerkar Earring",
    right_ear="Handler's Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}
		
    -- Set for idle while pet is out (eg: pet regen gear)
    sets.idle.Pet = {ammo="Automat. Oil +3",
	head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    neck="Bathy Choker",
    waist="Isa Belt",
    left_ear="Enmerkar Earring",
    right_ear="Handler's Earring +1",
    left_ring="Tali'ah Ring",
    right_ring="Overbearing Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}

    -- Idle sets to wear while pet is engaged
    sets.idle.Pet.Engaged = {head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    neck="Bathy Choker",
    waist="Isa Belt",
    left_ear="Enmerkar Earring",
    right_ear="Handler's Earring +1",
    left_ring="Tali'ah Ring",
    right_ring="Overbearing Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}

    sets.idle.Pet.Engaged.Ranged = set_combine(sets.idle.Pet.Engaged, {main={ name="Xiucoatl", augments={'Path: C',}},    
    ammo="Automat. Oil +3",
    head="Tali'ah Turban +2",
    body={ name="Pitre Tobe +1", augments={'Enhances "Overdrive" effect',}},
    hands="Tali'ah Gages +2",
    legs="Tali'ah Sera. +1",
    feet="Tali'ah Crackows +2",
    neck="Shulmanu Collar",
    waist="Klouskap Sash +1",
    left_ear="Handler's Earring +1",
    right_ear="Enmerkar Earring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	sets.idle.Pet.Engaged.Melee = set_combine(sets.idle.Pet.Engaged, {main={ name="Xiucoatl", augments={'Path: C',}},
    range="Animator P +1",
    ammo="Automat. Oil +3",
    head="Karagoz Capello +1",
    body="Heyoka Harness",
    hands="Mpaca's Gloves",
    legs="Heyoka Subligar",
    feet="Mpaca's Boots",
    neck="Shulmanu Collar",
    waist="Klouskap Sash +1",
    left_ear="Handler's Earring",
    right_ear="Enmerkar Earring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	sets.idle.Pet.Engaged.Tank = set_combine(sets.idle.Pet.Engaged, {main="Gnafron's Adargas",
    
    ammo="Automat. Oil +3",
    head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    neck="Shulmanu Collar",
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Enmerkar Earring",
    left_ring="Overbearing Ring",
    right_ring="Varar Ring +1",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	sets.idle.Pet.Engaged.Bruiser = set_combine(sets.idle.Pet.Engaged, {main="Gnafron's Adargas",
    
    ammo="Automat. Oil +3",
    head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    neck="Shulmanu Collar",
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Enmerkar Earring",
    left_ring="Overbearing Ring",
    right_ring="Varar Ring +1",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
	
	sets.idle.Pet.Engaged.LightTank = set_combine(sets.idle.Pet.Engaged, {main="Gnafron's Adargas",
    
    ammo="Automat. Oil +3",
    head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    neck="Shulmanu Collar",
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Enmerkar Earring",
    left_ring="Overbearing Ring",
    right_ring="Varar Ring +1",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},})
    sets.idle.Pet.Engaged.Magic = set_combine(sets.idle.Pet.Engaged, {})
	sets.idle.Pet.Engaged.Heal = sets.idle.Pet.Engaged.Magic
	sets.idle.Pet.Engaged.Nuke = sets.idle.Pet.Engaged.Magic


    -- Defense sets

    sets.defense.PDT = {
        head="Malignance Chapeau",
    body="Hiza. Haramaki +1",
    hands="Malignance Gloves",
    legs="Tali'ah Sera. +1",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Moonbow Belt",
    left_ear="Genmei Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back="Moonbeam Cape",}

    sets.defense.MDT = {
        head="Malignance Chapeau",
    body="Hiza. Haramaki +1",
    hands="Malignance Gloves",
    legs="Tali'ah Sera. +1",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Moonbow Belt",
    left_ear="Genmei Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back="Moonbeam Cape",}
		
    sets.defense.MEVA = {
        head="Malignance Chapeau",
    body="Hiza. Haramaki +1",
    hands="Malignance Gloves",
    legs="Tali'ah Sera. +1",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Moonbow Belt",
    left_ear="Genmei Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back="Moonbeam Cape",}

    sets.Kiting = {feet="Hermes' Sandals"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Tali'ah Manteel +2",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck="Shulmanu Collar",
    waist="Moonbow Belt +1",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}
    sets.engaged.Acc = {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Tali'ah Manteel +2",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck="Shulmanu Collar",
    waist="Moonbow Belt +1",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}
    sets.engaged.FullAcc = {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Tali'ah Manteel +2",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck="Shulmanu Collar",
    waist="Moonbow Belt +1",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}
	sets.engaged.Fodder = {head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Moonbow Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Telos Earring",
    left_ring="Hizamaru Ring",
    right_ring="Defending Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}
    sets.engaged.DT = {head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Moonbow Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Telos Earring",
    left_ring="Hizamaru Ring",
    right_ring="Defending Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}
    sets.engaged.Acc.DT = {head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Moonbow Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Telos Earring",
    left_ring="Hizamaru Ring",
    right_ring="Defending Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}
    sets.engaged.FullAcc.DT = {head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Moonbow Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Telos Earring",
    left_ring="Hizamaru Ring",
    right_ring="Defending Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}
    sets.engaged.Fodder.DT = {head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Moonbow Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Telos Earring",
    left_ring="Hizamaru Ring",
    right_ring="Defending Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}
    sets.engaged.Pet = {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Tali'ah Manteel +2",
    hands="Mpaca's Gloves",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Mpaca's Boots",
    neck="Shulmanu Collar",
    waist="Moonbow Belt +1",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}
    sets.engaged.Acc.Pet = {ammo="Automat. Oil +3",
    head="Heyoka Cap",
    body="Tali'ah Manteel +2",
    hands="Tali'ah Gages +2",
    legs="Heyoka Subligar",
    feet="Tali'ah Crackows +2",
    neck="Bathy Choker",
    waist="Moonbow Belt",
    left_ear="Telos Earring",
    right_ear="Enmerkar Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Varar Ring +1",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}
    sets.engaged.FullAcc.Pet = {
        head="Malignance Chapeau",
    body="Tali'ah Manteel +2",
    hands="Malignance Gloves",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck="Shulmanu Collar",
    waist="Moonbow Belt +1",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Hizamaru Ring",
    right_ring="Petrov Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}
    sets.engaged.Fodder.Pet = {
        head="Mpaca's Cap",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
        body="Sayadio's Kaftan",hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        back="Visucius's Mantle",waist="Klouskap Sash",legs="Ryuo Hakama",feet=gear.herculean_ta_feet}
		
	-- Weapons sets
	sets.weapons.PetWeapons = {main={ name="Xiucoatl", augments={'Path: C',}},}
	sets.weapons.Godhands = {main="Godhands",range="Animator P +1",}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 20)
    elseif player.sub_job == 'NIN' then
        set_macro_page(2, 20)
    elseif player.sub_job == 'THF' then
        set_macro_page(2, 20)
    else
        set_macro_page(2, 20)
    end
end