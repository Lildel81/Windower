-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder','Crit')
    state.HybridMode:options('Normal','Evasion','PDT')
    state.RangedMode:options('Normal','Acc')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder','Proc')
    state.CastingMode:options('Normal','Proc','Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Kikoku','Tank','Sword','Heishi','MagicWeapons','Crit','TPBonus','Blunt','GK','ProcDagger','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana','ProcKatana','ProcClub','ProcStaff')
	
	
	
	
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None','SuppaBrutal','DWEarrings','DWMax'}
	
	gear.wsd_jse_back = {name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.da_jse_back = {name="Andartia's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	
	send_command('bind ^` input /ja "Innin" <me>')
    send_command('bind !` input /ja "Yonin" <me>')
	send_command('bind @` gs c cycle SkillchainMode; gs c cycle MagicBurstMode')
	send_command('bind !r gs c set WeaponskillMode Proc;gs c set CastingMode Proc;gs c update')
	send_command('bind ^r gs c set WeaponskillMode Normal;gs c set CastingMode Normal;gs c update')
	send_command('bind @y gs c cycle stance')
	send_command('bind !@^t gs c set Weapons Tank; gs c update')
	send_command('bind %numpad1 gs c set Weapons Sword; gs c update')
	send_command('bind %numpad4 gs c set Weapons TPBonus; gs c update')
	send_command('bind %numpad3 gs c set Weapons Heishi; gs c update')
	send_command('bind %numpad2 c set Weapons Kikoku; gs c update')
	send_command('bind !@^m gs c set Weapons MagicWeapons; gs c update')
	send_command('bind !@^c gs c set Weapons Crit; gs c update')
	send_command('bind !@^s gs c set Weapons OmenSC; gs c update')
	send_command('bind %numpad7 gs c set Weapons Blunt; gs c update')
	send_command('alias tank gs c set Weapons Tank; gs c update')
	send_command('alias kikoku gs c set Weapons Kikoku; gs c update')
	send_command('alias heishi gs c set Weapons Heishi; gs c update')
	send_command('alias magic gs c set Weapons MagicWeapons; gs c update')
	
	
	
	send_command(';wait 1.0;lua l invspace')
	send_command(';wait 1.0;lua l skillchains')
	send_command('alias clean input //org organize all clean.lua')
	--send_command('bind %numpad1 input /ma "Utsusemi: Ichi" <me>')
	--send_command('bind %numpad2 input /ma "Utsusemi: Ni" <me>')
	--send_command('bind %numpad3 input /ma "Utsusemi: San" <me>')
	--send_command('bind ^delete input /ja "Curing Waltz III" <me>')
	send_command('alias tools send Lildel "\/\/ exec getnintools.txt')
	send_command('alias puttools send Lildel "\/\/ exec putnintools.txt')
	send_command('bind %y gs c toggle stance')
	send_command('bind %numpad5 input //send Picodelgallo /ma "Cure" Lildel')
	
	
	utsusemi_cancel_delay = .3
	utsusemi_ni_cancel_delay = .06
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------
	
	sets.Tools = {head = "Inoshishinufuda",body="Shikanufuda",feet = "Chonofuda",legs = "Shihei"}

    sets.Enmity = {ammo="Aqreqaq Bomblet",
    head="Genmei Kabuto",  -- Deceit Mask
    body="Emet Harness +1", --10
    hands="Kurys Gloves", --9
    legs="Obatala Subligar", --5
    feet="Danzo Sune-Ate",  -- Mochizuki Kyahan +3
    neck="Moonbeam Necklace", --10
    waist="Warwolf Belt", -- 3
    left_ear="Friomisi Earring", -- 2
    right_ear="Eris' Earring", --2
    left_ring="Supershear Ring", --5
    right_ring="Provocare Ring", --5
    back={ name="Andartia's Mantle", augments={'Enmity+10',}}, --10
	}
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {} --legs="Mochizuki Hakama"
    sets.precast.JA['Futae'] = {hands="Hattori Tekko +1"}
    sets.precast.JA['Sange'] = {legs="Mochizuki Chainmail"} --legs="Mochizuki Chainmail"
	sets.precast.JA['Provoke'] = sets.Enmity
	sets.precast.JA['Warcry'] = sets.Enmity

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Mummu Bonnet +2",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
	
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Zennaroi Earring",ear2="Telos Earring",
        body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Andartia's Mantle",waist="Olseni Belt",legs="Mummu Kecks +2",feet=gear.herculean_acc_feet}

    sets.precast.Flourish1 = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Mekosu. Harness",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Andartia's Mantle",waist="Olseni Belt",legs="Hattori Hakama +1",feet=gear.herculean_acc_feet}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Seki Shuriken",
    head={ name="Herculean Helm", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Store TP"+1','STR+7','Mag. Acc.+13','"Mag.Atk.Bns."+12',}},
    body="Dread Jupon",
    hands={ name="Leyline Gloves", augments={'Accuracy+2','Mag. Acc.+5','"Mag.Atk.Bns."+4',}},
    legs="Mummu Kecks +2",
    feet="Hattori Kyahan",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Loquac. Earring",
    right_ear="Friomisi Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}, -- Fast Cast Cape
	}
		
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body={ name="Mochi. Chainmail +1", augments={'Enhances "Sange" effect',}},feet="Hattori Kyahan +1"})
	sets.precast.FC.Shadows = set_combine(sets.precast.FC.Utsusemi, {ammo="Seki Shuriken",ring1="Prolix Ring"})

    -- Snapshot for ranged
    sets.precast.RA = {head={ name="Taeon Chapeau", augments={'"Snapshot"+4','"Snapshot"+3',}},
		body="Persuer's Doublet",
    legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
    feet={ name="Adhemar Gamashes", augments={'HP+50','"Store TP"+6','"Snapshot"+8',}},
    waist="Yemaya Belt",}  --  NEEDS - Teon hands / snapshot
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Crepuscular Pebble",
    head="Mpaca's Cap",
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands={ name="Ryuo Tekko", augments={'STR+10','DEX+10','Accuracy+15',}},
    legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +3%','INT+15','Mag. Acc.+2',}},
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Lugra Earring +1",
    right_ear="Odr Earring",
    left_ring="Beithir Ring",
    right_ring="Karieyh Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},}
	
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {head="Hiza. Somen　+2",
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},})
	
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {right_ear="Digni. Earring",})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {right_ear="Digni. Earring",})
	sets.precast.WS.Proc = {ammo="Togakushi Shuriken",
        head="Ynglinga Sallet",neck="Moonbeam Nodowa",ear1="Zennaroi Earring",ear2="Telos Earring",
        body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Olseni Belt",legs="Mummu Kecks +2",feet=gear.herculean_acc_feet}
	
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS, {ammo="Yetshila",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Mpaca's Doublet",
    hands={ name="Ryuo Tekko", augments={'STR+10','DEX+10','Accuracy+15',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Lugra Earring +1",
    right_ear="Odr Earring",
    left_ring="Begrudging Ring",
    right_ring="Mummu Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},})
	
    sets.precast.WS['Blade: Jin'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, { body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},})
    sets.precast.WS['Blade: Jin'].Acc = set_combine(sets.precast.WS.Acc, { body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},})
    sets.precast.WS['Blade: Jin'].FullAcc = set_combine(sets.precast.WS.FullAcc, { body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},})
    sets.precast.WS['Blade: Jin'].Fodder = set_combine(sets.precast.WS['Blade: Jin'], {head="Adhemar Bonnet"})
	
	sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, {ammo="Yetshila",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Mpaca's Doublet",
    hands={ name="Ryuo Tekko", augments={'STR+10','DEX+10','Accuracy+15',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Lugra Earring +1",
    right_ear="Odr Earring",
    left_ring="Begrudging Ring",
    right_ring="Mummu Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},})
	
    sets.precast.WS['Blade: Hi'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Yetshila",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Mpaca's Doublet",
    hands={ name="Ryuo Tekko", augments={'STR+10','DEX+10','Accuracy+15',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Lugra Earring +1",
    right_ear="Odr Earring",
    left_ring="Begrudging Ring",
    right_ring="Mummu Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},})
	
    sets.precast.WS['Blade: Hi'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Yetshila",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Mpaca's Doublet",
    hands={ name="Ryuo Tekko", augments={'STR+10','DEX+10','Accuracy+15',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Lugra Earring +1",
    right_ear="Odr Earring",
    left_ring="Begrudging Ring",
    right_ring="Mummu Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},})
	
    sets.precast.WS['Blade: Hi'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Yetshila",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Mpaca's Doublet",
    hands={ name="Ryuo Tekko", augments={'STR+10','DEX+10','Accuracy+15',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Lugra Earring +1",
    right_ear="Odr Earring",
    left_ring="Begrudging Ring",
    right_ring="Mummu Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},})
	
    sets.precast.WS['Blade: Hi'].Fodder = set_combine(sets.precast.WS['Blade: Hi'], {})

    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {ammo="C. Palug Stone",
    head="Mpaca's Cap",
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Jokushu Haidate",
    feet="Mpaca's Boots",
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Mache Earring +1",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Regal Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},})
	
    sets.precast.WS['Blade: Shun'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="C. Palug Stone",
    head="Mpaca's Cap",
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Jokushu Haidate",
    feet="Mpaca's Boots",
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Mache Earring +1",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Regal Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},})
	
    sets.precast.WS['Blade: Shun'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Yamarang",left_ear="Mache Earring",
    right_ear="Digni. Earring",})
	
    sets.precast.WS['Blade: Shun'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Yamarang",left_ear="Mache Earring +1",
    right_ear="Digni. Earring",})
	
    sets.precast.WS['Blade: Shun'].Fodder = set_combine(sets.precast.WS['Blade: Shun'], {})

    sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, {ammo="Crepuscular Pebble",
    head="Hachiya Hatsu. +3",
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands="Malignance Gloves",
    legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Lugra Earring +1",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Beithir Ring",
    right_ring="Karieyh Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
	
    sets.precast.WS['Blade: Ten'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Crepuscular Pebble",
    head="Hachiya Hatsu. +3",
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands="Malignance Gloves",
    legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Lugra Earring +1",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Beithir Ring",
    right_ring="Karieyh Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
	
    sets.precast.WS['Blade: Ten'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Crepuscular Pebble",
    head="Hachiya Hatsu. +3",
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands="Malignance Gloves",
    legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Lugra Earring +1",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Beithir Ring",
    right_ring="Karieyh Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
	
    sets.precast.WS['Blade: Ten'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Crepuscular Pebble",
    head="Hachiya Hatsu. +3",
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands="Malignance Gloves",
    legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Lugra Earring +1",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Beithir Ring",
    right_ring="Karieyh Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
	
    sets.precast.WS['Blade: Ten'].Fodder = set_combine(sets.precast.WS['Blade: Ten'], {})
	
	sets.precast.WS['Blade: Metsu'] = {ammo="C. Palug Stone",
    head="Hachiya Hatsu. +3",
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands="Malignance Gloves",
    legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Lugra Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Beithir Ring",
    right_ring="Karieyh Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Blade: Metsu'].SomeAcc = {ammo="C. Palug Stone",
    head="Hachiya Hatsu. +3",
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands="Malignance Gloves",
    legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Lugra Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Beithir Ring",
    right_ring="Karieyh Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Blade: Metsu'].Acc = {ammo="C. Palug Stone",
    head="Hachiya Hatsu. +3",
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands="Malignance Gloves",
    legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Lugra Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Beithir Ring",
    right_ring="Karieyh Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Blade: Metsu'].FullAcc = {ammo="C. Palug Stone",
    head="Hachiya Hatsu. +3",
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands="Malignance Gloves",
    legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Lugra Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Beithir Ring",
    right_ring="Karieyh Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},}
	sets.precast.WS['Blade: Metsu'].Fodder = {}
	
    sets.precast.WS['Aeolian Edge'] = {ammo="Pemphredo Tathlum",
    head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
    body="Gyve Doublet",
    hands={ name="Herculean Gloves", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Mag. Acc.+15','"Mag.Atk.Bns."+10',}},
    legs={ name="Herculean Trousers", augments={'CHR+8','"Mag.Atk.Bns."+23','Chance of successful block +5','Accuracy+6 Attack+6','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +3%','INT+15','Mag. Acc.+2',}},
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Dingir Ring",
    right_ring="Regal Ring",
    back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},}
	
	sets.precast.WS['Blade: Chi'] = {ammo="Seeth. Bomblet +1",
    head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands="Nyame Gauntlets",
    legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +3%','INT+15','Mag. Acc.+2',}},
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Lugra Earring +1",
    right_ear="Friomisi Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},--[[ammo="Seeth. Bomblet +1",
    head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
    body="Gyve Doublet",
    hands={ name="Herculean Gloves", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Mag. Acc.+15','"Mag.Atk.Bns."+10',}},
    legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +3%','INT+15','Mag. Acc.+2',}},
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Lugra Earring +1",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},]]}
	
	sets.precast.WS['Tachi: Jinpu'] = {ammo="Seeth. Bomblet +1",
    head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands="Nyame Gauntlets",
    legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +3%','INT+15','Mag. Acc.+2',}},
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Lugra Earring +1",
    right_ear="Friomisi Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Blade: Ei'] = {ammo="Seeth. Bomblet +1",
    head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands="Nyame Gauntlets",
    legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +3%','INT+15','Mag. Acc.+2',}},
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Lugra Earring +1",
    right_ear="Friomisi Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Blade: To'] = {ammo="Seeth. Bomblet +1",
    head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands="Nyame Gauntlets",
    legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +3%','INT+15','Mag. Acc.+2',}},
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Lugra Earring +1",
    right_ear="Friomisi Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Blade: Teki'] = {ammo="Seeth. Bomblet +1",
    head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
    body={ name="Herculean Vest", augments={'MND+8','Weapon skill damage +9%','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    hands="Nyame Gauntlets",
    legs={ name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +3%','INT+15','Mag. Acc.+2',}},
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Lugra Earring +1",
    right_ear="Friomisi Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring",ear2="Lugra Earring +1",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Cessance Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Moonshade Earring",ear2="Brutal Earring",}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {head={ name="Herculean Helm", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Store TP"+1','STR+7','Mag. Acc.+13','"Mag.Atk.Bns."+12',}},
    body="Dread Jupon",
    hands={ name="Leyline Gloves", augments={'Accuracy+2','Mag. Acc.+5','"Mag.Atk.Bns."+4',}},
    legs="Mummu Kecks +2",
    feet="Hattori Kyahan",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Loquac. Earring",
    right_ear="Friomisi Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}-- Fast Cast Cape
	

    sets.midcast.ElementalNinjutsu = {ammo="Pemphredo Tathlum",
    head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Hermetic Earring",
    right_ear="Digni. Earring",
    left_ring="Shiva Ring",
    right_ring="Dingir Ring",
    back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},}
		
	sets.midcast.ElementalNinjutsu.Proc = sets.midcast.FastRecast
		
    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {})
	
	sets.MagicBurst = {ammo="Pemphredo Tathlum",
    head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Hermetic Earring",
    right_ear="Digni. Earring",
    left_ring="Locus Ring",
    right_ring="Mujin Band",
    back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},}
	
	sets.element.Earth = {neck="Quanpur Necklace"}

    sets.midcast.NinjutsuDebuff = {ammo="Yamarang",
    head="Hachiya Hatsu. +3",
    body="Mummu Jacket +2",
    hands="Mummu Wrists +2",
    legs="Mummu Kecks +2",
    feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Enchntr. Earring +1",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},}

    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {head="Hachi. Hatsu. +1",
    feet={ name="Mochizuki Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
    waist="Cimmerian Sash",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Yokaze Mantle", augments={'STR+3','DEX+1','Sklchn.dmg.+1%',}},}) --back="Mujin Mantle"
	
    sets.midcast.Utsusemi = set_combine(sets.midcast.NinjutsuBuff, {back="Andartia's Mantle",feet="Hattori Kyahan +1"})

    sets.midcast.RA = {
        head="Mummu Bonnet +2",
    body="Mummu Jacket +2",
    hands="Mummu Wrists +2",
    legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
    feet={ name="Adhemar Gamashes", augments={'HP+50','"Store TP"+6','"Snapshot"+8',}},
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Suppanomimi",
    right_ear="Digni. Earring",
    left_ring="Dingir Ring",
    right_ring="Paqichikaji Ring",
    back={ name="Yokaze Mantle", augments={'STR+3','DEX+1','Sklchn.dmg.+1%',}},}
		
    sets.midcast.RA.Acc = {
        head="Mummu Bonnet +2",
    body="Mummu Jacket +2",
    hands="Mummu Wrists +2",
    legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
    feet={ name="Adhemar Gamashes", augments={'HP+50','"Store TP"+6','"Snapshot"+8',}},
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Suppanomimi",
    right_ear="Digni. Earring",
    left_ring="Dingir Ring",
    right_ring="Paqichikaji Ring",
    back={ name="Yokaze Mantle", augments={'STR+3','DEX+1','Sklchn.dmg.+1%',}},}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {}

    -- Idle sets
    sets.idle = {ammo="Seki Shuriken",
    head="Genmei Kabuto",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Mummu Kecks +2",
    feet={ name="Herculean Boots", augments={'Attack+15','Phys. dmg. taken -3%',}},
    neck="Bathy Choker",
    waist="Flume Belt",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.idle.PDT = {ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs="Mpaca's Hose",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Infused Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Hizamaru Ring",
    right_ring="Purity Ring",
    back="Moonbeam Cape",}
		
    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})
		
    sets.idle.Weak = {ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs="Mpaca's Hose",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Infused Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Hizamaru Ring",
    right_ring="Purity Ring",
    back="Moonbeam Cape",}
    
    -- Defense sets
    sets.defense.Evasion = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Apate Ring",
        back="Andartia's Mantle",waist="Shetal Stone",legs="Nahtirah Trousers",feet=gear.herculean_dt_feet}

    sets.defense.PDT = {ammo="Staunch Tathlum",
    head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs="Mpaca's Hose",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Hizamaru Ring",
    right_ring="Purity Ring",
    back="Moonbeam Cape",}

    sets.defense.MDT = {ammo="Staunch Tathlum",
    head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs="Mpaca's Hose",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Hizamaru Ring",
    right_ring="Purity Ring",
    back="Moonbeam Cape",}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
    head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs="Mpaca's Hose",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Hizamaru Ring",
    right_ring="Purity Ring",
    back="Moonbeam Cape",}


    sets.Kiting = {feet="Danzo Sune-Ate"}
	sets.DuskKiting = {feet = "Hachiya Kyahan +1"}
	sets.DuskIdle = {feet = "Hachiya Kyahan +1"}
	sets.DayIdle = {feet="Danzo Sune-Ate"}
	sets.NightIdle = {feet="Danzo Sune-Ate"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Seki Shuriken",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
    sets.engaged.SomeAcc = {ammo="Seki Shuriken",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Petrov Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
    sets.engaged.Acc = {ammo="Seki Shuriken",
    head={ name="Ryuo Somen", augments={'HP+50','Accuracy+15','Attack+15',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
    sets.engaged.FullAcc = {ammo="Seki Shuriken",
    head={ name="Ryuo Somen", augments={'HP+50','Accuracy+15','Attack+15',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Eabani Earring",
    right_ear="Suppanomimi",
    left_ring="Petrov Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
    sets.engaged.Fodder = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Dedition Earring",ear2="Brutal Earring",
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
		
    sets.engaged.Crit = {ammo="Date Shuriken",
    head="Mpaca's Cap",
    body="Ken. Samue +1",
    hands={ name="Ryuo Tekko", augments={'STR+10','DEX+10','Accuracy+15',}},
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck={ name="Ninja Nodowa +1", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear="Mache Earring +1",
    right_ear="Odr Earring",
    left_ring="Mummu Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
    sets.engaged.Evasion = {ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs="Hattori Hakama +1",
    feet="Malignance Boots",
    neck="Bathy Choker",
    waist="Carrier's Sash",
    left_ear="Eabani Earring",
    right_ear="Cryptic Earring",
    left_ring="Defending Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
		sets.engaged.SomeAcc.Evasion = {ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs="Hattori Hakama +1",
    feet="Malignance Boots",
    neck="Bathy Choker",
    waist="Carrier's Sash",
    left_ear="Eabani Earring",
    right_ear="Cryptic Earring",
    left_ring="Defending Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
    sets.engaged.Acc.Evasion = {ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs="Hattori Hakama +1",
    feet="Malignance Boots",
    neck="Bathy Choker",
    waist="Carrier's Sash",
    left_ear="Eabani Earring",
    right_ear="Cryptic Earring",
    left_ring="Defending Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
    sets.engaged.FullAcc.Evasion = {ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs="Hattori Hakama +1",
    feet="Malignance Boots",
    neck="Bathy Choker",
    waist="Carrier's Sash",
    left_ear="Eabani Earring",
    right_ear="Cryptic Earring",
    left_ring="Defending Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
    sets.engaged.PDT = {ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs="Hattori Hakama +1",
    feet="Malignance Boots",
    neck="Bathy Choker",
    waist="Carrier's Sash",
    left_ear="Eabani Earring",
    right_ear="Cryptic Earring",
    left_ring="Defending Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
		sets.engaged.SomeAcc.PDT = {ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs="Hattori Hakama +1",
    feet="Malignance Boots",
    neck="Bathy Choker",
    waist="Carrier's Sash",
    left_ear="Eabani Earring",
    right_ear="Cryptic Earring",
    left_ring="Defending Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.engaged.Acc.PDT = {ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs="Hattori Hakama +1",
    feet="Malignance Boots",
    neck="Bathy Choker",
    waist="Carrier's Sash",
    left_ear="Eabani Earring",
    right_ear="Cryptic Earring",
    left_ring="Defending Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
	sets.engaged.FullAcc.PDT = {ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs="Hattori Hakama +1",
    feet="Malignance Boots",
    neck="Bathy Choker",
    waist="Carrier's Sash",
    left_ear="Eabani Earring",
    right_ear="Cryptic Earring",
    left_ring="Defending Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
	sets.engaged.Fodder.PDT = {ammo="Togakushi Shuriken",
        head="Ynglinga Sallet",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Epona's Ring",
        back="Moonlight Cape",waist="Flume Belt",legs=gear.herculean_dt_legs,feet=gear.herculean_dt_feet}
		
		
    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Migawari = {} --body="Hattori Ningi +1"
    sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff.Yonin = {legs="Hattori Hakama +1"} --
    sets.buff.Innin = {} --head="Hattori Zukin +1"
	
    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {body="Onca Suit",
    left_ear="Dominance Earring",
    right_ear="Domin. Earring +1",}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Shetal Stone"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, { head="Volte Cap",body="Volte Jupon",hands="Volte Bracers",})
	
		sets.Skillchain = {head="Nyame Helm",body="Nyame Mail",hands="Nyame Gauntlets",legs="Nyame Flanchard",feet="Nyame Sollerets",}
	
	-- Weapons sets
	sets.weapons.Kikoku = {main={ name="Kikoku", augments={'Path: A',}},sub="Kunimitsu",}
	sets.weapons.Heishi = {main={ name="Heishi Shorinken", augments={'Path: A',}},sub="Kunimitsu",}
	sets.weapons.Tank = {main={ name="Fudo Masamune", augments={'Path: C',}},sub="Tsuru",}
	sets.weapons.Sword = {main="Naegling",sub="Uzura +2",}
	sets.weapons.TPBonus = {main={ name="Heishi Shorinken", augments={'Path: A',}},sub={ name="Uzura +2", augments={'TP Bonus +1000',}},}
	sets.weapons.MagicWeapons = {main="Gokotai",sub={ name="Kunimitsu", augments={'Path: A',}},}
	sets.weapons.Crit = {main="Tauret",sub="Gleti's Knife",}
	sets.weapons.Blunt = {main="Karambit",}
	sets.weapons.GK = {main = "Hachimonji",}
	sets.weapons.ProcDagger = {main="Qutrub Knife", sub=empty, ammo="Yamarang",}
	sets.weapons.ProcSword = {main="Firetongue",sub=empty, ammo="Yamarang",}
	sets.weapons.ProcGreatSword = {main="Lament",sub=empty, ammo="Yamarang",}
	sets.weapons.ProcScythe = {main="Lost Sickle",sub=empty, ammo="Yamarang",}
	sets.weapons.ProcPolearm = {main="Tzee Xicu's Blade",sub=empty, ammo="Yamarang",}
	sets.weapons.ProcGreatKatana = {main="Zanmato",sub=empty, ammo="Yamarang",}
	sets.weapons.ProcKatana = {main="Debahocho +1",sub=empty, ammo="Yamarang",}
	sets.weapons.ProcClub = {main="Soulflayer's Wand",sub=empty, ammo="Yamarang",}
	sets.weapons.ProcStaff = {main="Ranine Staff",sub=empty, ammo="Yamarang",}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 4)
    elseif player.sub_job == 'RNG' then
        set_macro_page(1, 4)
    elseif player.sub_job == 'RDM' then
        set_macro_page(1, 4)
    else
        set_macro_page(1, 4)
    end
end