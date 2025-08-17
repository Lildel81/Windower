-- Setup vars that are user-dependent.  Can override this function in a sidecar file.

function user_job_setup()

include ('organizer-lib')
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.HybridMode:options('Normal','DT')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('Default','Leaden','LeadenMelee','Racc','Savage','SavageAcc','Evisceration','Skillchains','LastStand','KnifeAndBoard')
	state.CompensatorMode:options('Always','300','1000','Never')

    gear.RAbullet = "Chrono Bullet"
	--gear.RAbullet = "Decimating Bullet"
	gear.RAAccBullet = "Decimating Bullet"
    gear.WSbullet = "Living Bullet"
    gear.MAbullet = "Living Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Hauksbok Bullet"
    options.ammo_warning_limit = 15

	gear.tp_ranger_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}}
	gear.snapshot_jse_back = {name="Camulus's Mantle",augments={'"Snapshot"+10',}}
	gear.tp_jse_back = {name="Camulus's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.ranger_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	gear.str_wsd_jse_back = {name="Camulus's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

    -- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c elemental quickdraw')
	send_command('bind ^!@c gs c cycle CompensatorMode')
	
	send_command('bind ^backspace input /ja "Double-up" <me>')
	send_command('bind @backspace input /ja "Snake Eye" <me>')
	send_command('bind !backspace input /ja "Fold" <me>')
	send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
	
	send_command('bind ^\\\\ input /ja "Random Deal" <me>')
    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')

	send_command('bind !r gs c weapons Racc;gs c update')
	send_command('bind ] gs c weapons Savage; gs c update')
	send_command('bind [ gs c weapons Rolls; gs c update')
	send_command('bind \ gs c weapons Racc; gs c update')
	send_command('bind ^q gs c weapons Savage;gs c update')
	send_command('bind @q gs c weapons Leaden;gs c update')
	send_command('bind !q gs c weapons LeadenMelee;gs c update')
	send_command('bind @pause roller roll')
	send_command('alias cure input //send Picodelgallo /ma "Cure" <Lildel>')
	send_command('alias cure4 input //send Picodelgallo /ma "Cure IV" <Lildel>')
	send_command('bind !@^l gs c autows Leaden Salute')
	send_command('bind !@^w gs c autows Wildfire')
	send_command('bind !@^7 gs c autows tp 1750')
	send_command('bind !@^1 gs c autows tp 1000')
	send_command('bind !@^pageup input //cor on')
	send_command('bind !@^pagedown input //cor off')
	
	

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +3"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants"}

    sets.precast.CorsairRoll = {main = {name="Rostam", augments={'Path: C',}},
	--range={'Compensator'},
    head={ name="Lanun Tricorne", augments={'Enhances "Winning Streak" effect',}},
    hands="Chasseur's Gants +1",
    neck="Regal Necklace",
    back={ name="Camulus's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','Accuracy+5','Weapon skill damage +10%','Damage taken-3%',}},}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})
    
    sets.precast.CorsairShot = {
	main="Naegling",
    sub="Tauret",
    ammo=gear.QDbullet,
    head={ name="Herculean Helm", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Store TP"+1','STR+7','Mag. Acc.+13','"Mag.Atk.Bns."+12',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Attack+10','Pet: Attack+30 Pet: Rng.Atk.+30','Weapon skill damage +4%','Accuracy+9 Attack+9','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Commodore Charm +2",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Dingir Ring",
    right_ring="Shiva Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},}
		
	sets.precast.CorsairShot.Damage = {main="Naegling",
    sub="Tauret",
    ammo="Chrono Bullet",
    head={ name="Herculean Helm", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Store TP"+1','STR+7','Mag. Acc.+13','"Mag.Atk.Bns."+12',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Attack+10','Pet: Attack+30 Pet: Rng.Atk.+30','Weapon skill damage +4%','Accuracy+9 Attack+9','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Commodore Charm +2",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Dingir Ring",
    right_ring="Shiva Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},}
	
    sets.precast.CorsairShot.Proc = {main="Naegling",
    sub="Tauret",
    ammo="Chrono Bullet",
    head={ name="Herculean Helm", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Store TP"+1','STR+7','Mag. Acc.+13','"Mag.Atk.Bns."+12',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Attack+10','Pet: Attack+30 Pet: Rng.Atk.+30','Weapon skill damage +4%','Accuracy+9 Attack+9','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Dingir Ring",
    right_ring="Shiva Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},}

    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
    head="Malignance Chapeau",
    body="Mummu Jacket +2",
    hands="Malignance Gloves",
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','Magic burst dmg.+1%','VIT+10','Mag. Acc.+12',}},
    feet="Malignance Boots",
    neck="Commodore Charm +2",
    waist="Eschan Stone",
    left_ear="Enchntr. Earring +1",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Mummu Bonnet +1",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands="Malignance Gloves",
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','Magic burst dmg.+1%','VIT+10','Mag. Acc.+12',}},
    feet="Malignance Boots",
    neck="Unmoving Collar",
    waist="Chaac Belt",
    left_ear="Handler's Earring +1",
    right_ear="Enchntr. Earring +1",
    left_ring="Defending Ring",
    right_ring="Supershear Ring",
    back="Tantalic Cape",}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body="Dread Jupon",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast CastCast"+3',}},
    legs={ name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}},
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

    sets.precast.RA = {ammo=gear.RAbullet,
    head={ name="Taeon Chapeau", augments={'"Snapshot"+4','"Snapshot"+3',}},
    body="Oshosi Vest",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
    feet="Meg. Jam. +2",
    waist="Impulse Belt",
    back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}},}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {head={ name="Taeon Chapeau", augments={'"Snapshot"+4','"Snapshot"+3',}},
    body="Laksa. Frac +3",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
    feet="Meg. Jam. +2",
    waist="Yemaya Belt",
    back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}},})

	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {head={ name="Taeon Chapeau", augments={'"Snapshot"+4','"Snapshot"+3',}},
    body="Laksa. Frac +3",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
    feet="Meg. Jam. +2",
    waist="Yemaya Belt",
    back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}},})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    head="Malignance Chapeau",
    body="Meg. Cuirie +2",
    hands="Malignance Gloves",
    legs="Meg. Chausses +2",
    feet="Malignance Boots",
    neck="Ej Necklace",
    waist="Grunfeld Rope",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}
		
    sets.precast.WS.Acc = {
    head="Malignance Chapeau",
    body="Meg. Cuirie +2",
    hands="Malignance Gloves",
    legs="Meg. Chausses +2",
    feet="Malignance Boots",
    neck="Ej Necklace",
    waist="Grunfeld Rope",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}		
		
    sets.precast.WS.Proc = {}
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {head="Malignance Chapeau",
    body="Meg. Cuirie +2",
    hands="Malignance Gloves",
    legs="Meg. Chausses +2",
    feet="Malignance Boots",
    neck="Ej Necklace",
    waist="Grunfeld Rope",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})

	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
    head={ name="Herculean Helm", augments={'Accuracy+10','Weapon skill damage +5%','Attack+3',}},
    body="Laksa. Frac +3",
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Rng.Acc.+14','DEX+8','Weapon skill damage +9%',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}

    sets.precast.WS['Savage Blade'].Acc = {ammo=gear.WSbullet,
    head={ name="Herculean Helm", augments={'Accuracy+10','Weapon skill damage +5%','Attack+3',}},
    body="Laksa. Frac +3",
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Rng.Acc.+14','DEX+8','Weapon skill damage +9%',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Ej Necklace",
    waist="Grunfeld Rope",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Mache Earring +1",
    left_ring="Regal Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}
	
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
    ammo="Chrono Bullet",
    head="Malignance Chapeau",
    body="Laksa. Frac +3",
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Rng.Acc.+14','DEX+8','Weapon skill damage +9%',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Flame Gorget",
    waist="Light Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+5','Weapon skill damage +10%','Damage taken-3%',}},}

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
    head="Malignance Chapeau",
    body="Laksa. Frac +3",
    hands="Malignance Gloves",
    legs="Meg. Chausses +2",
    feet="Malignance Boots",
    neck={ name="Comm. Charm +1", augments={'Path: A',}},
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Beyla Earring",
    left_ring="Regal Ring",
    right_ring="Longshot Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+5','Weapon skill damage +10%','Damage taken-3%',}},}
		
    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc
	
    sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
    head="Pixie Hairpin +1",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Herculean Trousers", augments={'CHR+8','"Mag.Atk.Bns."+23','Chance of successful block +5','Accuracy+6 Attack+6','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hermetic Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Leaden Salute'].Acc = {ammo=gear.MAbullet,
    head="Pixie Hairpin +1",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Herculean Trousers", augments={'CHR+8','"Mag.Atk.Bns."+23','Chance of successful block +5','Accuracy+6 Attack+6','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +1", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Digni. Earring",
    left_ring="Dingir Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},}

    sets.precast.WS['Aeolian Edge'] = {ammo=gear.MAbullet,
    head={ name="Herculean Helm", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Store TP"+1','STR+7','Mag. Acc.+13','"Mag.Atk.Bns."+12',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Herculean Trousers", augments={'CHR+8','"Mag.Atk.Bns."+23','Chance of successful block +5','Accuracy+6 Attack+6','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +1", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Karieyh Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
    head={ name="Herculean Helm", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Store TP"+1','STR+7','Mag. Acc.+13','"Mag.Atk.Bns."+12',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Herculean Trousers", augments={'CHR+8','"Mag.Atk.Bns."+23','Chance of successful block +5','Accuracy+6 Attack+6','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +1", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Karieyh Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
    head={ name="Herculean Helm", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Store TP"+1','STR+7','Mag. Acc.+13','"Mag.Atk.Bns."+12',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Herculean Trousers", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Crit. hit damage +1%','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hermetic Earring",
    left_ring="Dingir Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},}
		
    sets.precast.WS['Hot Shot'] = {ammo=gear.MAbullet,
	head="Malignance Chapeau",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Meg. Chausses +2",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +1", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Beyla Earring",
    right_ear="Telos Earring",
    left_ring="Dingir Ring",
    right_ring="Longshot Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+5','Weapon skill damage +10%','Damage taken-3%',}},}
	
    sets.precast.WS['Hot Shot'].Acc = {ammo=gear.MAbullet,
	head="Malignance Chapeau",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Meg. Chausses +2",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +1", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Beyla Earring",
    right_ear="Telos Earring",
    left_ring="Dingir Ring",
    right_ring="Longshot Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+5','Weapon skill damage +10%','Damage taken-3%',}},}
		
		--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {ammo=gear.MAbullet,
    head="Malignance Chapeau",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands="Malignance Gloves",
    legs="Meg. Chausses +2",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +1", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Beyla Earring",
    right_ear="Telos Earring",
    left_ring="Dingir Ring",
    right_ring="Longshot Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+5','Weapon skill damage +10%','Damage taken-3%',}},}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body="Dread Jupon",
    hands={ name="Leyline Gloves", augments={'Accuracy+9','Mag. Acc.+5','"Mag.Atk.Bns."+6','"Fast Cast"+1',}},
    legs="Rawhide Trousers",
    left_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",}
        
    -- Specific spells

	sets.midcast.Cure = {
        head="Carmine Mask +1",neck="Phalaina Locket",ear1="Enchntr. Earring +1",ear2="Mendi. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Solemnity Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
    head="Ikenga's Hat",
    body="Ikenga's Vest",
    hands="Malignance Gloves",
    legs="Ikenga's Trousers",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="K. Kachina Belt +1",
    left_ear="Enervating Earring",
    right_ear="Beyla Earring",
    left_ring="Crepuscular Ring",
    right_ring="Paqichikaji Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},}

    sets.midcast.RA.Acc = {ammo=gear.RAAccBullet,
    head="Meghanada Visor +2",
    body="Laksa. Frac +3",
    hands="Malignance Gloves",
    legs="Meg. Chausses +2",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="K. Kachina Belt +1",
    left_ear="Enervating Earring",
    right_ear="Beyla Earring",
    left_ring="Crepuscular Ring",
    right_ring="Paqichikaji Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},}
		
	sets.buff['Triple Shot'] = {head="Oshosi Mask",
    body="Chasseur's Frac +1",
    hands="Oshosi Gloves",
    legs="Oshosi Trousers",}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Malignance Chapeau",
    body="Meg. Cuirie +2",
    hands="Malignance Gloves",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Malignance Boots",
    neck={ name="Comm. Charm +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Reraise Earring",
    right_ear="Beyla Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}
		
    sets.idle.PDT = {ammo=gear.RAbullet,
        head="Malignance Chapeau",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands="Malignance Gloves",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Malignance Boots",
    neck="Warder's Charm +1",
    waist="Flume Belt",
    left_ear="Reraise Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back="Moonbeam Cape",}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
        head="Rawhide Mask",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
        body="Mekosu. Harness",hands=gear.herculean_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Malignance Boots"}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
        head="Malignance Chapeau",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands="Malignance Gloves",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Malignance Boots",
    neck="Warder's Charm +1",
    waist="Flume Belt",
    left_ear="Reraise Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back="Moonbeam Cape",}

    sets.defense.MDT = {ammo=gear.RAbullet,
        head="Malignance Chapeau",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands="Malignance Gloves",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Malignance Boots",
    neck="Warder's Charm +1",
    waist="Flume Belt",
    left_ear="Reraise Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back="Moonbeam Cape",}
		
    sets.defense.MEVA = {ammo=gear.RAbullet,
    head="Malignance Chapeau",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands="Malignance Gloves",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Malignance Boots",
    neck="Warder's Charm +1",
    waist="Flume Belt",
    left_ear="Reraise Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back="Moonbeam Cape",}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {head="Volte Cap",
    body={ name="Herculean Vest", augments={'Pet: INT+2','"Treasure Hunter"+2','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    waist="Chaac Belt",})
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}

	-- Weapons sets
	sets.weapons.Default = { main={ name="Rostam", augments={'Path: A',}},sub="Tauret",range={ name="Death Penalty", augments={'Path: A',}},}
	sets.weapons.KnifeAndBoard = {main={ name="Rostam", augments={'Path: A',}},sub="Nusku Shield",range={ name="Death Penalty", augments={'Path: A',}},}
	sets.weapons.Leaden = {main={ name="Rostam", augments={'Path: A',}}, sub="Tauret", range={ name="Death Penalty", augments={'Path: A',}},}
	sets.weapons.LeadenMelee = {main={ name="Rostam", augments={'Path: A',}},sub={ name="Demers. Degen +1", augments={'Path: A',}},range="Death Penalty",}
	sets.weapons.Racc = {main = { name="Rostam", augments={'Path: A',}},sub={ name="Lanun Knife", augments={'Path: A',}},range={ name="Death Penalty", augments={'Path: A',}},}
	sets.weapons.Savage = {main="Naegling",sub={ name="Demers. Degen +1", augments={'Path: A',}},range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},}
	sets.weapons.SavageAcc={main="Naegling",sub={ name="Demers. Degen +1", augments={'Path: A',}},range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},}
	sets.weapons.Evisceration = {main="Tauret",sub={ name="Demers. Degen +1", augments={'Path: A',}},range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},}
	sets.weapons.Skillchains = {main="Naegling",sub={ name="Demers. Degen +1", augments={'Path: A',}},range="Fomalhaut",}
	sets.weapons.LastStand = { main={ name="Rostam", augments={'Path: A',}},sub={ name="Rostam", augments={'Path: C',}},range="Fomalhaut",}
	
	
	
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion7
    
    -- Normal melee group
    sets.engaged = {head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
    
    sets.engaged.Acc = {
	head="Malignance Chapeau",
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Gazu Bracelet +1", augments={'Path: A',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Malignance Boots",
    neck="Ej Necklace",
    waist="Reiki Yotai",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Chirich Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
    sets.engaged.DT = {
    head="Malignance Chapeau",
    body="Nyame Mail",
    hands="Malignance Gloves",
    legs="Nyame Flanchard",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Patricius Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
    
    sets.engaged.Acc.DT = {
    head="Malignance Chapeau",
    body="Nyame Mail",
    hands="Malignance Gloves",
    legs="Nyame Flanchard",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Patricius Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}

    sets.engaged.DW = {
	head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck="Lissome Necklace",
    waist="Reiki Yotai",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Chirich Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
    
    sets.engaged.DW.Acc = {
	head="Malignance Chapeau",
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Gazu Bracelet +1", augments={'Path: A',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Malignance Boots",
    neck="Ej Necklace",
    waist="Reiki Yotai",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Chirich Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
    sets.engaged.DW.DT = {
    head="Malignance Chapeau",
    body="Nyame Mail",
    hands="Malignance Gloves",
    legs="Nyame Flanchard",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Patricius Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
    
    sets.engaged.DW.Acc.DT = {
    head="Malignance Chapeau",
    body="Nyame Mail",
    hands="Malignance Gloves",
    legs="Nyame Flanchard",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Patricius Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(1, 7)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1, 7)
    elseif player.sub_job == 'RNG' then
        set_macro_page(1, 7)
    elseif player.sub_job == 'DRG' then
        set_macro_page(1, 7)
    else
        set_macro_page(1, 7)
    end
end

function user_job_lockstyle()
	if player.equipment.main == nil or player.equipment.main == 'empty' then
		windower.chat.input('/lockstyleset 007')
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Sword/Nothing.
				windower.chat.input('/lockstyleset 007')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Sword/Shield
				windower.chat.input('/lockstyleset 007')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
			windower.chat.input('/lockstyleset 007')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
			windower.chat.input('/lockstyleset 007')
		else
			windower.chat.input('/lockstyleset 007') --Catchall just in case something's weird.
		end
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Dagger/Nothing.
			windower.chat.input('/lockstyleset 007')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Dagger/Shield
			windower.chat.input('/lockstyleset 007')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
			windower.chat.input('/lockstyleset 007')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
			windower.chat.input('/lockstyleset 007')
		else
			windower.chat.input('/lockstyleset 007') --Catchall just in case something's weird.
		end
	end
end