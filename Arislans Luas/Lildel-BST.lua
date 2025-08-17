-------------------------------------------------------------------------------------------------------------------
-- ctrl+F12 cycles Idle modes


-------------------------------------------------------------------------------------------------------------------
							-- THE STUFF YOU CARE ABOUT STARTS AFTER LINE 101 --
							-- THE STUFF YOU CARE ABOUT STARTS AFTER LINE 101 --
							-- THE STUFF YOU CARE ABOUT STARTS AFTER LINE 101 --
							-- THE STUFF YOU CARE ABOUT STARTS AFTER LINE 101 --
							-- THE STUFF YOU CARE ABOUT STARTS AFTER LINE 101 --
							-- THE STUFF YOU CARE ABOUT STARTS AFTER LINE 101 --
							-- THE STUFF YOU CARE ABOUT STARTS AFTER LINE 101 --
							-- THE STUFF YOU CARE ABOUT STARTS AFTER LINE 101 --
							-- THE STUFF YOU CARE ABOUT STARTS AFTER LINE 101 --
-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

	-- Load and initialize the include file.
	include('Mote-Include.lua')
	include('MoveGear.lua')
	include('Lildel_Globals.lua')
	include('organizer-lib')
end

function job_setup()

	get_combat_form()

end


function user_setup()
        state.IdleMode:options('Normal', 'Reraise')
		state.OffenseMode:options('Normal', 'PetDT')
		state.CorrelationMode = M{['description']='Correlation Mode', 'Neutral', 'HighAcc', 'MaxAcc',}
        send_command('bind ^f8 gs c cycle CorrelationMode')
		state.WeaponSet = M{['description']='Weapon Set', 'Sword', 'Axe', 'PetFocus'}
		send_command('bind f7 gs c cycle WeaponSet')
		send_command('bind !f7 gs c cycleback WeaponSet')
		
       

       
 end
     

-- Complete list of Ready moves to use with Sic & Ready Recast -5 Desultor Tassets.
ready_moves_to_check = S{'Sic','Whirl Claws','Dust Cloud','Foot Kick','Sheep Song','Sheep Charge','Lamb Chop',
	'Rage','Head Butt','Scream','Dream Flower','Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang',
	'Roar','Gloeosuccus','Palsy Pollen','Soporific','Cursed Sphere','Venom','Geist Wall','Toxic Spit',
	'Numbing Noise','Nimble Snap','Cyclotail','Spoil','Rhino Guard','Rhino Attack','Power Attack',
	'Hi-Freq Field','Sandpit','Sandblast','Venom Spray','Mandibular Bite','Metallic Body','Bubble Shower',
	'Bubble Curtain','Scissor Guard','Big Scissors','Grapple','Spinning Top','Double Claw','Filamented Hold',
	'Frog Kick','Queasyshroom','Silence Gas','Numbshroom','Spore','Dark Spore','Shakeshroom','Blockhead',
	'Secretion','Fireball','Tail Blow','Plague Breath','Brain Crush','Infrasonics','??? Needles',
	'Needleshot','Chaotic Eye','Blaster','Scythe Tail','Ripper Fang','Chomp Rush','Intimidate','Recoil Dive',
	'Water Wall','Snow Cloud','Wild Carrot','Sudden Lunge','Spiral Spin','Noisome Powder','Wing Slap',
	'Beak Lunge','Suction','Drainkiss','Acid Mist','TP Drainkiss','Back Heel','Jettatura','Choke Breath',
	'Fantod','Charged Whisker','Purulent Ooze','Corrosive Ooze','Tortoise Stomp','Harden Shell','Aqua Breath',
	'Sensilla Blades','Tegmina Buffet','Molting Plumage','Swooping Frenzy','Pentapeck','Sweeping Gouge',
	'Zealous Snort','Somersault ','Tickling Tendrils','Stink Bomb','Nectarous Deluge','Nepenthic Plunge',
        'Pecking Flurry','Pestilent Plume','Foul Waters','Spider Web','Sickle Slash','Frogkick','Ripper Fang','Scythe Tail','Chomp Rush'}

		
mab_ready_moves = S{
	 'Cursed Sphere','Venom','Toxic Spit',
	 'Venom Spray','Bubble Shower',
	 'Fireball','Plague Breath',
	 'Snow Cloud','Acid Spray','Silence Gas','Dark Spore',
	 'Charged Whisker','Purulent Ooze','Aqua Breath','Stink Bomb',
	 'Nectarous Deluge','Nepenthic Plunge','Foul Waters','Dust Cloud','Sheep Song','Scream','Dream Flower','Roar','Gloeosuccus','Palsy Pollen',
	 'Soporific','Geist Wall','Numbing Noise','Spoil','Hi-Freq Field',
	 'Sandpit','Sandblast','Filamented Hold',
	 'Spore','Infrasonics','Chaotic Eye',
	 'Blaster','Intimidate','Noisome Powder','TP Drainkiss','Jettatura','Spider Web',
	 'Corrosive Ooze','Molting Plumage','Swooping Frenzy',
	 'Pestilent Plume',}


-- List of abilities to reference for applying Treasure Hunter +1 via Chaac Belt.


function file_unload()
	if binds_on_unload then
		binds_on_unload()
	end

	-- Unbinds the Jug Pet, Reward, Correlation, Treasure, PetMode, MDEF Mode hotkeys.
	send_command('unbind !=')
	send_command('unbind ^=')
	send_command('unbind !f8')
	send_command('unbind ^f8')
	send_command('unbind @f8')
	send_command('unbind ^f11')
end



		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		

-- BST gearsets
function init_gear_sets()


	-- PRECAST SETS
        sets.precast.JA['Killer Instinct'] = {head="Ankusa Helm +1"}
		
		sets.precast.JA['Bestial Loyalty'] = {hands="Ankusa Gloves",body="Mirke Wardecors",}
		
		sets.precast.JA['Call Beast'] = sets.precast.JA['Bestial Loyalty']
		
        sets.precast.JA.Familiar = {legs="Ankusa Trousers"}
		
		sets.precast.JA.Tame = {head="Totemic Helm +1",}
		
		sets.precast.JA.Spur = {feet="Nukumi Ocreae +1"}

        
	--This is what will equip when you use Reward.  No need to manually equip Pet Food Theta.
		sets.precast.JA.Reward = {
				ammo="Pet Food Theta",
				head="Khimaira Bonnet",
    body={ name="Ankusa Jackcoat", augments={'Enhances "Feral Howl" effect',}},
    hands="Ogre Gloves",
    legs={ name="Ankusa Trousers", augments={'Enhances "Familiar" effect',}},
    feet={ name="Ankusa Gaiters", augments={'Enhances "Beast Healer" effect',}},
	back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10',}},}

	--This is your base FastCast set that equips during precast for all spells/magic.
    sets.precast.FC = {
		ammo="Staunch Tathlum",
		head="Malignance Chapeau",
		body={ name="Taeon Tabard", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs="Arjuna Breeches",
		feet="Malignance Boots",
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		waist="Flume Belt",
		left_ear="Loquac. Earring",
		right_ear="Enchntr. Earring +1",
		left_ring="Prolix Ring",
		right_ring="Purity Ring",
		back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10',}},}
			
         			
	sets.midcast.Stoneskin = {
			head="Taeon Chapeau",
			neck="Stone Gorget",
			ear1="Earthcry Earring",
			ear2="Lifestorm Earring",
			body="Totemic Jackcoat +1",
			hands="Stone Mufflers",
			ring1="Aquasoul Ring",
			ring2="Aquasoul Ring",
			back="Pastoralist's Mantle",
			waist="Crudelis Belt",
			legs="Haven Hose",
			feet="Amm Greaves"}

				
        -- WEAPONSKILLS
		
		
        -- Default weaponskill set.
	sets.precast.WS = {
		ammo="Aurgelmir Orb +1",
		head={ name="Valorous Mask", augments={'Attack+23','Weapon skill damage +4%','STR+7',}},
		body={ name="Gleti's Cuirass", augments={'Path: A',}},
		hands={ name="Argosy Mufflers +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs={ name="Zoar Subligar +1", augments={'Path: A',}},
		feet={ name="Argosy Sollerets +1", augments={'STR+12','DEX+12','Attack+20',}},
		neck="Shulmanu Collar",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Karieyh Ring",
		right_ring="Regal Ring",
		back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10',}},}

	
        -- Specific weaponskill sets.
    sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {ammo="Aurgelmir Orb +1",
    head="Gleti's Mask",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Argosy Mufflers +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs={ name="Zoar Subligar +1", augments={'Path: A',}},
    feet={ name="Argosy Sollerets +1", augments={'STR+12','DEX+12','Attack+20',}},
    neck="Breeze Gorget",
    waist="Aqua Belt",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Regal Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10',}},})
				
    sets.precast.WS['Onslaught'] = set_combine(sets.precast.WS, {
			ammo="Floestone",
            neck="Justiciar's Torque",
			ear1="Tati Earring +1",
			ear2="Brutal Earring",
			body="Mes'yohi Haubergeon",
			hands="Nomkahpa Mittens +1",
			ring1="Ramuh Ring +1",
            back="Vespid Mantle",
			legs="Mikinaak Cuisses",
			feet="Vanir Boots"})
			
		
	sets.precast.WS['Primal Rend'] = {
		ammo="Pemphredo Tathlum",
		head={ name="Valorous Mask", augments={'Attack+23','Weapon skill damage +4%','STR+7',}},
		body={ name="Valorous Mail", augments={'Pet: Accuracy+20 Pet: Rng. Acc.+20','Weapon skill damage +4%','Accuracy+14 Attack+14',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Breeze Gorget",
		waist="Aqua Belt",
		left_ear="Friomisi Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Karieyh Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10',}},}

	
		
	sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS['Primal Rend'],{ammo="Aurgelmir Orb +1",
    head="Gleti's Mask",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Argosy Mufflers +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs={ name="Zoar Subligar +1", augments={'Path: A',}},
    feet={ name="Argosy Sollerets +1", augments={'STR+12','DEX+12','Attack+20',}},
    neck="Breeze Gorget",
    waist="Aqua Belt",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Regal Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10',}},})

	-- PET SIC & READY MOVES


--This is your base Ready move set, activating for physical Ready moves. Merlin/D.Tassets are accounted for already. 
	sets.midcast.Pet.WS = {
		ammo="Hesperiidae",
		head={ name="Emicho Coronet +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
		body={ name="Valorous Mail", augments={'Pet: "Mag.Atk.Bns."+14','Pet: "Dbl. Atk."+3','Pet: STR+6','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Attack+3 Pet: Rng.Atk.+3',}},
		hands={ name="Emi. Gauntlets +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Enmerkar Earring",
		right_ear="Kyrene's Earring",
		left_ring="C. Palug Ring",
		right_ring="Varar Ring +1",
		back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20',}},}
	
	sets.midcast.Pet.Neutral = set_combine(sets.midcast.Pet.WS, {  
		ammo="Hesperiidae",
		head={ name="Emicho Coronet +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
		body={ name="Valorous Mail", augments={'Pet: "Mag.Atk.Bns."+14','Pet: "Dbl. Atk."+3','Pet: STR+6','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Attack+3 Pet: Rng.Atk.+3',}},
		hands={ name="Emi. Gauntlets +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Enmerkar Earring",
		right_ear="Kyrene's Earring",
		left_ring="C. Palug Ring",
		right_ring="Varar Ring +1",
		back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20',}},})
			
			
	sets.midcast.Pet.HighAcc = set_combine(sets.midcast.Pet.WS, {
		ammo="Hesperiidae",
		head={ name="Emicho Coronet +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
		body={ name="Valorous Mail", augments={'Pet: "Mag.Atk.Bns."+14','Pet: "Dbl. Atk."+3','Pet: STR+6','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Attack+3 Pet: Rng.Atk.+3',}},
		hands={ name="Emi. Gauntlets +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Enmerkar Earring",
		right_ear="Kyrene's Earring",
		left_ring="C. Palug Ring",
		right_ring="Varar Ring +1",
		back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20',}},})
			
	sets.midcast.Pet.MaxAcc = set_combine(sets.midcast.Pet.WS, {
		ammo="Hesperiidae",
		head={ name="Emicho Coronet +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
		body={ name="Valorous Mail", augments={'Pet: "Mag.Atk.Bns."+14','Pet: "Dbl. Atk."+3','Pet: STR+6','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Attack+3 Pet: Rng.Atk.+3',}},
		hands={ name="Emi. Gauntlets +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Enmerkar Earring",
		right_ear="Kyrene's Earring",
		left_ring="C. Palug Ring",
		right_ring="Varar Ring +1",
		back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20',}},})

--This will equip for Magical Ready moves like Fireball
	sets.midcast.Pet.MabReady = set_combine(sets.midcast.Pet.WS, {
		ammo="Hesperiidae",
		head={ name="Emicho Coronet +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
		body={ name="Valorous Mail", augments={'Pet: "Mag.Atk.Bns."+14','Pet: "Dbl. Atk."+3','Pet: STR+6','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Attack+3 Pet: Rng.Atk.+3',}},
		hands={ name="Emi. Gauntlets +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Enmerkar Earring",
		right_ear="Kyrene's Earring",
		left_ring="C. Palug Ring",
		right_ring="Varar Ring +1",
		back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20',}},})
	
	
	sets.midcast.Pet.TPBonus = {hands="Nukumi Manoplas +1",}
		
	sets.midcast.Pet.ReadyRecast = {main="Charmer's Merlin",legs="Desultor Tassets",}

      
        
        -- IDLE SETS (TOGGLE between RERAISE and NORMAL with CTRL+F12)
		
		
		-- Base Idle Set (when you do NOT have a pet out)
    sets.idle = {
		ammo="Hesperiidae",
		head="Gleti's Mask",
		body={ name="Gleti's Cuirass", augments={'Path: A',}},
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		neck="Loricate Torque +1",
		waist="Isa Belt",
		left_ear="Hypaspist Earring",
		right_ear="Enmerkar Earring",
		left_ring="Defending Ring",
		right_ring="C. Palug Ring",
		back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10',}},}

			
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})

	
		-- Idle Set that equips when you have a pet out and not fighting an enemy.
	sets.idle.Pet = set_combine(sets.idle, {
		ammo="Hesperiidae",
		head="Gleti's Mask",
		body={ name="Gleti's Cuirass", augments={'Path: A',}},
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		neck="Loricate Torque +1",
		waist="Isa Belt",
		left_ear="Hypaspist Earring",
		right_ear="Enmerkar Earring",
		left_ring="Defending Ring",
		right_ring="C. Palug Ring",
		back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10',}},})
		
		-- Idle set that equips when you have a pet out and ARE fighting an enemy.
	sets.idle.Pet.Engaged = set_combine(sets.idle, {
		ammo="Hesperiidae",
		head="Gleti's Mask",
		body={ name="Valorous Mail", augments={'Pet: "Mag.Atk.Bns."+14','Pet: "Dbl. Atk."+3','Pet: STR+6','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Attack+3 Pet: Rng.Atk.+3',}},
		hands={ name="Emi. Gauntlets +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
		legs={ name="Valorous Hose", augments={'Pet: "Store TP"+8','Pet: STR+3','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Attack+7 Pet: Rng.Atk.+7',}},
		feet={ name="Valorous Greaves", augments={'Pet: "Dbl.Atk."+4 Pet: Crit.hit rate +4','Pet: VIT+1','Pet: Accuracy+14 Pet: Rng. Acc.+14','Pet: Attack+8 Pet: Rng.Atk.+8',}},
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Rimeice Earring",
		right_ear="Enmerkar Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20',}},})
        


        -- MELEE (SINGLE-WIELD) SETS
	
	sets.engaged = {
		ammo="Aurgelmir Orb +1",
		head="Skormoth Mask",
		body="Tali'ah Manteel +2",
		hands={ name="Emi. Gauntlets +1", augments={'Accuracy+25','"Dual Wield"+6','Pet: Accuracy+25',}},
		legs="Meg. Chausses +2",
		feet="Malignance Boots",
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Ilabrat Ring",
		right_ring="Regal Ring",
		back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10',}},}
			
	sets.engaged.PetDT = {
		ammo="Aurgelmir Orb +1",
		head="Skormoth Mask",
		body={ name="Gleti's Cuirass", augments={'Path: A',}},
		hands={ name="Emi. Gauntlets +1", augments={'Accuracy+25','"Dual Wield"+6','Pet: Accuracy+25',}},
		legs="Gleti's Breeches",
		feet="Malignance Boots",
		neck="Shulmanu Collar",
		waist="Flume Belt",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Patricius Ring",
		right_ring="Defending Ring",
		back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10',}},}
				
	     -- MELEE (DUAL-WIELD) SETS FOR DNC AND NIN SUBJOB
		
	sets.engaged.DW = {
		ammo="Aurgelmir Orb +1",
		head="Skormoth Mask",
		body="Tali'ah Manteel +2",
		hands={ name="Emi. Gauntlets +1", augments={'Accuracy+25','"Dual Wield"+6','Pet: Accuracy+25',}},
		legs="Meg. Chausses +2",
		feet="Malignance Boots",
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Ilabrat Ring",
		right_ring="Regal Ring",
		back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10',}},}
			
	sets.engaged.DW.PetDT = {
		ammo="Aurgelmir Orb +1",
		head="Skormoth Mask",
		body={ name="Gleti's Cuirass", augments={'Path: A',}},
		hands={ name="Emi. Gauntlets +1", augments={'Accuracy+25','"Dual Wield"+6','Pet: Accuracy+25',}},
		legs="Gleti's Breeches",
		feet="Malignance Boots",
		neck="Shulmanu Collar",
		waist="Flume Belt",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Patricius Ring",
		right_ring="Defending Ring",
		back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10',}},}
	
			
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED -- 
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED --
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED --
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED --
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED --
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED --
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED --
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED --
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED --
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED --

	sets.Sword = {main="Naegling",sub="Agwu's Axe",}
	sets.Axe = {main="Dolichenus",sub={ name="Digirbalag", augments={'"Dbl.Atk."+3','VIT+4','Accuracy+13','Attack+8','DMG:+8',}},}
	sets.PetFocus = {main={ name="Skullrender", augments={'DMG:+15','Pet: Accuracy+20','Pet: Attack+20',}},sub={ name="Skullrender", augments={'DMG:+15','Pet: Accuracy+20','Pet: Attack+20',}},}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)
	cancel_conflicting_buffs(spell, action, spellMap, eventArgs)

     
	

-- Define class for Sic and Ready moves.
        if ready_moves_to_check:contains(spell.name) and pet.status == 'Engaged' then
                classes.CustomClass = "WS"
		equip(sets.midcast.Pet.ReadyRecast)
        end
end



function job_pet_midcast(spell, action, spellMap, eventArgs)

	
        end
-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, action, spellMap, eventArgs)

if spell.type == "Monster" and not spell.interrupted then

 equip(set_combine(sets.midcast.Pet.WS, sets.midcast.Pet[state.CorrelationMode.value]))

	if mab_ready_moves:contains(spell.english) and pet.status == 'Engaged' then
 equip(sets.midcast.Pet.MabReady)
 end
 
	if buffactive['Unleash'] then
                hands={ name="Valorous Mitts", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Pet: "Store TP"+10','System: 1 ID: 1792 Val: 13','Pet: Accuracy+3 Pet: Rng. Acc.+3',}}
        end
 

 eventArgs.handled = true
 end


end

function job_state_change(stateField, newValue, oldValue)
	if stateField == 'Correlation Mode' then
		state.CorrelationMode:set(newValue)
	end
end

function get_combat_form()
	if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		state.CombatForm:set('DW')
	else
	     state.CombatForm:reset()
	     end

end