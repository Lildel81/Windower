function user_setup()

    -- Options: Override default values	
	state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Tank','DDTank','BreathTank','Dawn','NoShellTank','Normal')
    state.WeaponskillMode:options('Match','Normal', 'Acc')
    state.CastingMode:options('Normal','SIRD')
	state.Passive:options('None','AbsorbMP')
    state.PhysicalDefenseMode:options('PDT','PDT_HP','Tank')
    state.MagicalDefenseMode:options('BDT','MDT_HP','AegisMDT','AegisNoShellMDT','OchainMDT','OchainNoShellMDT','MDT_Reraise')
	state.ResistDefenseMode:options('MEVA','MEVA_HP','Death','Charm')
	state.IdleMode:options('Normal','Tank','KiteTank','PDT','MDT','Refresh','Reraise')
	state.Weapons:options('None','Excalubur','Tank','MTank','DDTank','Dual','Club','ExcalDual')
	
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP','Twilight'}
	
	gear.fastcast_jse_back = {name="Rudianos's Mantle",augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10',}}
	gear.enmity_jse_back = {name="Rudianos's Mantle",augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10',}}

	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind ^backspace input /ja "Shield Bash" <t>')
	send_command('bind @backspace input /ja "Cover" <stpt>')
	send_command('bind !backspace input /ja "Sentinel" <me>')
	send_command('bind @= input /ja "Chivalry" <me>')
	send_command('bind != input /ja "Palisade" <me>')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^pause gs c toggle AutoRuneMode')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind !d gs c set Weapons ExcalDual')
	send_command('lua l equipviewer')
	--send_command(';wait 2.0;equipviewer position 1200 700')
	send_command(';wait 1.0;lua l invspace')
	send_command(';wait 1.0;lua l skillchains')
	send_command('alias clean input //org organize all clean.lua')
	send_command('alias cast input gs c cycle CastingMode')
	include('PicoGeoBinds.lua')
	--[[To dos
	bind cures - Ironbars, Lildel
	bind refresh - Lildel, Jiral
	bind haste - Lildel, Ironbars
	bind full circle on pico
	
	]]
	
	

	
    select_default_macro_book()
    update_defense_mode()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
    sets.Enmity = {ammo="Staunch Tathlum",
    head={ name="Loess Barbuta +1", augments={'Path: A',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Moonbeam Necklace",
    waist="Audumbla Sash",
    left_ear="Cryptic Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Provocare Ring",
    right_ring="Supershear Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},} --10
	 --2848
		
    sets.Enmity.SIRD = {ammo="Staunch Tathlum", --10
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}}, --20
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},--30
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},--20
    neck="Moonlight Necklace", --15
    waist="Audumbla Sash",--10
    left_ear="Odnowa Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",}
	--95% SIRD and 2795
    sets.Enmity.DT = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    neck="Moonbeam Necklace",
    waist="Audumbla Sash",
    left_ear="Knightly Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Defending Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}
		
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches +3"})
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings +3"})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{}) --head="Valor Coronet" (Also Vit?)
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body="Cab. Surcoat +3"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{feet="Chev. Sabatons +1"})
    sets.precast.JA['Cover'] = set_combine(sets.Enmity, {body="Cab. Surcoat +3"}) --head="Rev. Coronet +1 +1",
	
    sets.precast.JA['Invincible'].DT = set_combine(sets.Enmity.DT,{legs="Cab. Breeches +3"})
    sets.precast.JA['Holy Circle'].DT = set_combine(sets.Enmity.DT,{feet="Rev. Leggings +1"})
    sets.precast.JA['Sentinel'].DT = set_combine(sets.Enmity.DT,{feet="Cab. Leggings +3"})
    sets.precast.JA['Rampart'].DT = set_combine(sets.Enmity.DT,{}) --head="Valor Coronet" (Also Vit?)
    sets.precast.JA['Fealty'].DT = set_combine(sets.Enmity.DT,{body="Cab. Surcoat +3"})
    sets.precast.JA['Divine Emblem'].DT = set_combine(sets.Enmity.DT,{feet="Chev. Sabatons +1"})
    sets.precast.JA['Cover'].DT = set_combine(sets.Enmity.DT, {body="Cab. Surcoat +3"}) --head="Rev. Coronet +1 +1",
	
    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {
		head="Sulevia's Mask +2",neck="Phalaina Locket",ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		body="Rev. Surcoat +3",hands="Cab. Gauntlets +1",ring1="Stikini Ring",ring2="Rufescent Ring",
		back=gear.enmity_jse_back,waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {hands="Cab. Gauntlets +3"})		
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	
	sets.precast.JA['Shield Bash'].DT = set_combine(sets.Enmity.DT, {hands="Cab. Gauntlets +3"})		
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Palisade'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Intervene'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		ammo="Charitoni Sling",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Found. Breastplate", augments={'Accuracy+15','Mag. Acc.+15','Attack+15','"Mag.Atk.Bns."+15',}},
    hands="Flam. Manopolas +1",
    legs="Flamma Dirs +2",
    feet="Sulev. Leggings +2",
    neck="Loricate Torque +1",
    waist="Warwolf Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Handler's Earring +1",
    left_ring="Regal Ring",
    right_ring="Supershear Ring",
    back="Tantalic Cape",}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Step = {ammo="Amar Cluster",
    head="Flam. Zucchetto +2",
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +2",
    legs="Flamma Dirs +2",
    feet="Sulev. Leggings +2",
    neck="Sanctity Necklace",
    waist="Kentarch Belt +1",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Regal Ring",
    right_ring="Supershear Ring",
    back="Tantalic Cape",
	
	--[[ammo="Ginsen",
        head="Founder's Corona",neck="Combatant's Torque",ear1="Zennaroi Earring",ear2="Telos Earring",
        body="Tartarus Platemail",hands="Leyline Gloves",ring1="Ramuh Ring +1",ring2="Patricius Ring",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Founder's Greaves"]]}
		
	sets.precast.JA['Violent Flourish'] = {ammo="Pemphredo Tathlum",
    head="Flam. Zucchetto +2",
    body={ name="Found. Breastplate", augments={'Accuracy+15','Mag. Acc.+15','Attack+15','"Mag.Atk.Bns."+15',}},
    hands="Flam. Manopolas +1",
    legs="Flamma Dirs +2",
    feet="Flam. Gambieras +2",
    neck="Moonbeam Necklace",
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring +1",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}
		
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Staunch Tathlum",
    head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body="Rev. Surcoat +2",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque +1",
    waist="Creed Baudrier",
    left_ear="Loquac. Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Kishar Ring",
    back="Moonbeam Cape",}
		
    sets.precast.FC.DT = {ammo="Staunch Tathlum",
    head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body="Rev. Surcoat +2",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque +1",
    waist="Creed Baudrier",
    left_ear="Loquac. Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Kishar Ring",
    back="Moonbeam Cape",}
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {waist="Acerbic Sash +1",left_ear="Nourish. Earring",right_ear="Mendi. Earring",neck="Diemer Gorget",})
  
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Aurgelmir Orb",
    head={ name="Valorous Mask", augments={'Weapon skill damage +3%','STR+9','Accuracy+14','Attack+6',}},
    body={ name="Valorous Mail", augments={'Weapon skill damage +3%','STR+8','Attack+13',}},
    hands={ name="Odyssean Gauntlets", augments={'Crit.hit rate+1','Mag. Acc.+16','Damage taken-3%','Accuracy+9 Attack+9',}},
    legs={ name="Odyssean Cuisses", augments={'Attack+26','Weapon skill damage +4%','Accuracy+15',}},
    feet="Sulev. Leggings +2",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Ishvara Earring",
    right_ear="Mache Earring +1",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}
		
    sets.precast.WS.DT = {ammo="Amar Cluster",
    head={ name="Valorous Mask", augments={'Weapon skill damage +3%','STR+9','Accuracy+14','Attack+6',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands="Sulev. Gauntlets +2",
    legs={ name="Odyssean Cuisses", augments={'Attack+26','Weapon skill damage +4%','Accuracy+15',}},
    feet="Sulev. Leggings +2",
    neck="Loricate Torque +1",
    waist="Grunfeld Rope",
    left_ear="Ishvara Earring",
    right_ear="Mache Earring +1",
    left_ring="Regal Ring",
    right_ring="Defending Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}}}

    sets.precast.WS.Acc = {ammo="Amar Cluster",
    head={ name="Valorous Mask", augments={'Accuracy+30','"Dbl.Atk."+1',}},
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +2",
    legs={ name="Odyssean Cuisses", augments={'Attack+26','Weapon skill damage +4%','Accuracy+15',}},
    feet="Sulev. Leggings +2",
    neck="Lissome Necklace",
    waist="Grunfeld Rope",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Regal Ring",
    right_ring="Patricius Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring"})
    sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget",ear1="Zennaroi Earring",ear2="Moonshade Earring"})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ammo="Jukukik Feather",
    head={ name="Lustratio Cap +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    body="Lustratio Harness",
    hands={ name="Lustratio Mittens", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
    legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    feet="Thereoid Greaves",
    neck="Flame Gorget",
    waist="Aqua Belt",
    left_ear="Mache Earring +1",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Regal Ring",
    right_ring="Begrudging Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},})
	
	
    sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Amar Cluster",
    head="Flam. Zucchetto +2",
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +2",
    legs="Flamma Dirs +2",
    feet="Sulev. Leggings +2",
    neck="Lissome Necklace",
    waist="Kentarch Belt +1",
    left_ear="Mache Earring +1",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Regal Ring",
    right_ring="Begrudging Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {ammo="Aurgelmir Orb",
    head={ name="Valorous Mask", augments={'Weapon skill damage +3%','STR+9','Accuracy+14','Attack+6',}},
    body={ name="Valorous Mail", augments={'Weapon skill damage +3%','STR+8','Attack+13',}},
    hands={ name="Valorous Mitts", augments={'Attack+2','DEX+6','Weapon skill damage +5%',}},
    legs={ name="Odyssean Cuisses", augments={'Attack+26','Weapon skill damage +4%','Accuracy+15',}},
    feet="Sulev. Leggings +2",
    neck="Breeze Gorget",
    waist="Breeze Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},})
	
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Amar Cluster",
    head="Flam. Zucchetto +2",
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +2",
    legs="Flamma Dirs +2",
    feet="Sulev. Leggings +2",
    neck="Breeze Gorget",
    waist="Breeze Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},})
	
	sets.precast.WS['Flat Blade'] = {ammo="Pemphredo Tathlum",
    head="Flam. Zucchetto +2",
    body={ name="Found. Breastplate", augments={'Accuracy+15','Mag. Acc.+15','Attack+15','"Mag.Atk.Bns."+15',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Flamma Dirs +2",
    feet="Flam. Gambieras +2",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Regal Ring",
    right_ring="Stikini Ring +1",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}
	
	
	--[[ammo="Ginsen",
        head="Founder's Corona",neck="Voltsurge Torque",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Flamma Korazin +1",hands="Leyline Gloves",ring1="Defending Ring",ring2="Stikini Ring +1",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Founder's Greaves"]]

	sets.precast.WS['Flat Blade'].Acc = {ammo="Pemphredo Tathlum",
    head="Flam. Zucchetto +2",
    body={ name="Found. Breastplate", augments={'Accuracy+15','Mag. Acc.+15','Attack+15','"Mag.Atk.Bns."+15',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Flamma Dirs +2",
    feet="Flam. Gambieras +2",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Regal Ring",
    right_ring="Stikini Ring +1",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}

    sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Found. Breastplate", augments={'Accuracy+15','Mag. Acc.+15','Attack+15','"Mag.Atk.Bns."+15',}},
    hands={ name="Founder's Gauntlets", augments={'STR+10','Attack+15','"Mag.Atk.Bns."+15','Phys. dmg. taken -5%',}},
    legs={ name="Valor. Hose", augments={'VIT+8','MND+3','"Treasure Hunter"+1','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    feet={ name="Founder's Greaves", augments={'VIT+5','Accuracy+5','Mag. Evasion+5',}},
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Archon Ring",
    right_ring="Fenrir Ring +1",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}

	sets.precast.WS['Sanguine Blade'].Acc = sets.precast.WS['Sanguine Blade']

    sets.precast.WS['Atonement'] = {ammo="Paeapua",
		head="Loess Barbuta +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body=gear.valorous_wsd_body,hands=gear.odyssean_wsd_hands,ring1="Defending Ring",ring2="Moonbeam Ring",
		back=gear.enmity_jse_back,waist="Fotia Belt",legs="Flamma Dirs +2",feet="Eschite Greaves"}

    sets.precast.WS['Atonement'].Acc = sets.precast.WS['Atonement']
    sets.precast.WS['Spirits Within'] = sets.precast.WS['Atonement']
    sets.precast.WS['Spirits Within'].Acc = sets.precast.WS['Atonement']

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = set_combine (sets.precast.FC, {})
		
	sets.midcast.FastRecast.DT = {ammo="Staunch Tathlum",
    head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body="Rev. Surcoat +2",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque +1",
    waist="Creed Baudrier",
    left_ear="Loquac. Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Kishar Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}

    sets.midcast.Flash = set_combine(sets.Enmity, {})
	
	sets.midcast.Flash.SIRD = set_combine(sets.Enmity.SIRD, {})
	
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.SIRD = set_combine(sets.Enmity.SIRD, {})
	
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Diemer Gorget",
    waist="Sroda Belt",
    left_ear="Nourish. Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back="Moonbeam Cape",}
		
    sets.midcast.Cure.SIRD = set_combine(sets.Enmity.SIRD, {})
		
    sets.midcast.Cure.DT = set_combine(sets.Enmity.SIRD, {})
		
    sets.midcast.Reprisal = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    neck="Moonbeam Necklace",
    waist="Audumbla Sash",
    left_ear="Knightly Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Defending Ring",
    back="Moonbeam Cape"}

	sets.Self_Healing = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Diemer Gorget",
    waist="Audumbla Sash",
    left_ear="Nourish. Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back="Moonbeam Cape",}
		
	sets.Self_Healing.SIRD = set_combine(sets.Enmity.SIRD, {})
		
	sets.Self_Healing.DT = set_combine(sets.Enmity.SIRD, {})

	sets.Cure_Received = {body="souveran Cuirass +1",feet="souveran Schuhs +1"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}

    sets.midcast['Enhancing Magic'] = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    neck="Moonbeam Necklace",
    waist="Audumbla Sash",
    left_ear="Knightly Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Evanescence Ring",
   back="Moonbeam Cape",}
		
    sets.midcast['Enhancing Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {main="Deacon Sword",hands="Souv. Handsch. +1",back="Weard Mantle",feet="Souveran Schuhs +1"})
	sets.midcast.Phalanx.SIRD = set_combine(sets.midcast['Enhancing Magic'].SIRD, {main="Deacon Sword",hands="Souv. Handsch. +1",back="Weard Mantle",feet="Souveran Schuhs +1"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.resting = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs="Sulevi. Cuisses +1",
    feet="Hippo. Socks +1",
    neck="Sanctity Necklace",
    waist="Flume Belt",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}

    -- Idle sets
    sets.idle = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Diemer Gorget",
    waist="Creed Baudrier",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back="Moonbeam Cape",}
		
    sets.idle.PDT = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Diemer Gorget",
    waist="Creed Baudrier",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back="Moonbeam Cape",}
		
    sets.idle.MDT = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Diemer Gorget",
    waist="Carrier's Sash",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
   back="Moonbeam Cape",}
		
	sets.idle.Refresh = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Diemer Gorget",
    waist="Creed Baudrier",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back="Moonbeam Cape",}

	sets.idle.Tank = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet="Rev. Leggings +3",
    neck="Diemer Gorget",
    waist="Flume Belt",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",}
		
	sets.idle.KiteTank = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Hippo. Socks +1",
    neck="Loricate Torque +1",
    waist="Audumbla Sash",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back="Moonbeam Cape",}
		
    sets.idle.Reraise = {main="Mafic Cudgel",sub="Ochain",ammo="Staunch Tathlum",
		head="Twilight Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Thureous Earring",
		body="Twilight Mail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Cab. Leggings +1"}
		
    sets.idle.Weak = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Diemer Gorget",
    waist="Creed Baudrier",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}
		
	sets.Kiting = {legs="Carmine Cuisses +1"}

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_regen = {ring1="Apeile Ring +1",ring2="Apeile Ring"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	--------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
	sets.Knockback = {}
    sets.MP = {head="Chev. Armet +1",neck="Coatl Gorget +1",ear2="Ethereal Earring",waist="Flume Belt",feet="Rev. Leggings +3"}
	sets.passive.AbsorbMP = {head="Chev. Armet +1",neck="Coatl Gorget +1",ear2="Ethereal Earring",waist="Flume Belt",feet="Rev. Leggings +3"}
    sets.MP_Knockback = {}
    sets.Twilight = {head="Twilight Helm", body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {head="Volte Cap",body="Volte Jupon",hands="Volte Bracers",})
	
	-- Weapons sets
	sets.weapons.Tank = {main={name="Burtgang", augments={'Path: C',}},sub="Duban",}
	sets.weapons.MTank = {main={ name="Moralltach", augments={'Path: C',}},sub="Aegis",waist = "Carrier's Sash"}
	sets.weapons.DDTank = { main="Naegling",sub={ name="Priwen", augments={'HP+50','Mag. Evasion+50','Damage Taken -3%',}},}
	sets.weapons.Dual = {main="Reikiko",sub={ name="Demers. Degen +1", augments={'Path: A',}},}
	sets.weapons.Club = {main="Mafic Cudgel",sub={ name="Priwen", augments={'HP+50','Mag. Evasion+50','Damage Taken -3%',}},}
	sets.weapons.Excalubur = {main={ name="Excalibur", augments={'Path: A',}},sub={ name="Priwen", augments={'HP+50','Mag. Evasion+50','Damage Taken -3%',}},}
	sets.weapons.ExcalDual = {main = "Burtgang",sub={ name="Demers. Degen +1", augments={'Path: A',}},}
	
	
    sets.defense.PDT = {ammo="Staunch Tathlum",
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Kentarch Belt +1",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Vengeful Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}
		
    sets.defense.PDT_HP = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body="Rev. Surcoat +2",
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs="Rev. Breeches +1",
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque +1",
    waist="Creed Baudrier",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}
		
    sets.defense.MDT_HP = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body="Rev. Surcoat +2",
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs="Rev. Breeches +1",
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque +1",
    waist="Carrier's Sash",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}
		
    sets.defense.MEVA_HP = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body="Rev. Surcoat +2",
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs="Rev. Breeches +1",
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque +1",
    waist="Carrier's Sash",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}
		
    sets.defense.PDT_Reraise = {ammo="Staunch Tathlum",
        head="Twilight Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Thureous Earring",
        body="Twilight Mail",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Moonbeam Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Arke Cosciales",feet="Souveran Schuhs +1"}
		
    sets.defense.MDT_Reraise = {main="Mafic Cudgel",sub="Aegis",ammo="Staunch Tathlum",
        head="Twilight Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Twilight Mail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Moonbeam Ring",
		back="Engulfer Cape +1",waist="Flume Belt",legs=gear.odyssean_fc_legs,feet="Cab. Leggings +1"}

	sets.defense.BDT = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body="Rev. Surcoat +2",
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs="Rev. Breeches +1",
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque +1",
    waist="Carrier's Sash",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}
		
	sets.defense.Tank = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet="Rev. Leggings +3",
    neck="Diemer Gorget",
    waist="Flume Belt",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Diemer Gorget",
    waist="Carrier's Sash",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}
		
	sets.defense.Death = {left_ring="Warden's Ring",
    right_ring="Shadow Ring",}
		
	sets.defense.Charm = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Diemer Gorget",
    waist="Creed Baudrier",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}
		
		-- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
    sets.defense.OchainMDT = {sub="Aegis",ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Creed Baudrier",legs="Chev. Cuisses +1",feet="Chev. Sabatons +1"}
		
    sets.defense.OchainNoShellMDT = {sub="Aegis",ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Flax Sash",legs="Sulev. Cuisses +2",feet="Chev. Sabatons +1"}
		
    sets.defense.AegisMDT = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Diemer Gorget",
    waist="Carrier's Sash",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}
		
    sets.defense.AegisNoShellMDT = {sub="Aegis",ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.fastcast_jse_back,waist="Asklepian Belt",legs="Sulev. Cuisses +2",feet="Amm Greaves"}		

	--------------------------------------
	-- Engaged sets
	--------------------------------------
    
	sets.engaged = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Diemer Gorget",
    waist="Creed Baudrier",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}

    sets.engaged.Acc = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Diemer Gorget",
    waist="Creed Baudrier",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}

    sets.engaged.DW = {ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Flamma Dirs +2",
    feet="Flam. Gambieras +2",
    neck="Lissome Necklace",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Chirich Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}

    sets.engaged.DW.Acc = {ammo="Amar Cluster",
    head="Flam. Zucchetto +2",
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +2",
    legs="Flamma Dirs +2",
    feet="Flam. Gambieras +2",
    neck="Sanctity Necklace",
    waist="Kentarch Belt +1",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Regal Ring",
    right_ring="Chirich Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}

	sets.engaged.Tank = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet="Rev. Leggings +3",
    neck="Diemer Gorget",
    waist="Flume Belt",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",}
		
	sets.engaged.Dawn = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Diemer Gorget",
    waist="Carrier's Sash",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}
	
	sets.engaged.BreathTank = {ammo="Amar Cluster",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands="Sulev. Gauntlets +2",
    legs="Scuff. Cosciales",
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Diemer Gorget",
    waist="Carrier's Sash",
    left_ear="Thureous Earring",
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring="Moonbeam Ring",
    back="Moonbeam Cape",}
		
	sets.engaged.DDTank = {ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Lissome Necklace",
    waist="Kentarch Belt +1",
    left_ear="Mache Earring +1",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Patricius Ring",
    back="Moonbeam Cape",}
		
	sets.engaged.Acc.DDTank = {ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Lissome Necklace",
    waist="Kentarch Belt +1",
    left_ear="Mache Earring +1",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Patricius Ring",
    back="Moonbeam Cape",}
		
	sets.engaged.NoShellTank = {ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Diemer Gorget",
    waist="Creed Baudrier",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}
		
    sets.engaged.Reraise = set_combine(sets.engaged.Tank, sets.Reraise)
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc.Tank, sets.Reraise)
		
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
    sets.buff.Cover = {body="Cab. Surcoat +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'NIN' then
        set_macro_page(2, 4)
    elseif player.sub_job == 'RUN' then
        set_macro_page(9, 4)
    elseif player.sub_job == 'RDM' then
        set_macro_page(6, 4)
    elseif player.sub_job == 'BLU' then
        set_macro_page(8, 4)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 4)
    else
        set_macro_page(1, 4) --War/Etc
    end
end