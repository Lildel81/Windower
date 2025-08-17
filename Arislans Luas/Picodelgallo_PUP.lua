----------------------------------------------------------------------------------------
--  __  __           _                     __   _____                        _
-- |  \/  |         | |                   / _| |  __ \                      | |
-- | \  / | __ _ ___| |_ ___ _ __    ___ | |_  | |__) |   _ _ __  _ __   ___| |_ ___
-- | |\/| |/ _` / __| __/ _ \ '__|  / _ \|  _| |  ___/ | | | '_ \| '_ \ / _ \ __/ __|
-- | |  | | (_| \__ \ ||  __/ |    | (_) | |   | |   | |_| | |_) | |_) |  __/ |_\__ \
-- |_|  |_|\__,_|___/\__\___|_|     \___/|_|   |_|    \__,_| .__/| .__/ \___|\__|___/
--                                                         | |   | |
--                                                         |_|   |_|
-----------------------------------------------------------------------------------------
--[[

    Originally Created By: Faloun
    Programmers: Arrchie, Kuroganashi, Byrne, Tuna
    Testers:Arrchie, Kuroganashi, Haxetc, Patb, Whirlin, Petsmart
    Contributors: Xilkk, Byrne, Blackhalo714

    ASCII Art Generator: http://www.network-science.de/ascii/
    
]]

-- Initialization function for this job file.
-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include("Mote-Include.lua")
	include('organizer-lib')
	--include('PPacker.lua')
	include('Global-Binds.lua')
end

function user_setup()
    -- Alt-F10 - Toggles Kiting Mode.

    --[[
        F9 - Cycle Offense Mode (the offensive half of all 'hybrid' melee modes).
        
        These are for when you are fighting with or without Pet
        When you are IDLE and Pet is ENGAGED that is handled by the Idle Sets
    ]]
    state.OffenseMode:options("MasterPet", "Master", "Trusts")

    --[[
        Ctrl-F9 - Cycle Hybrid Mode (the defensive half of all 'hybrid' melee modes).
        
        Used when you are Engaged with Pet
        Used when you are Idle and Pet is Engaged
    ]]
    state.HybridMode:options("Normal", "Acc", "TP", "DT", "Regen", "Ranged")

    --[[
        Alt-F12 - Turns off any emergency mode
        
        Ctrl-F10 - Cycle type of Physical Defense Mode in use.
        F10 - Activate emergency Physical Defense Mode. Replaces Magical Defense Mode, if that was active.
    ]]
    state.PhysicalDefenseMode:options("PetDT", "MasterDT")

    --[[
        Alt-F12 - Turns off any emergency mode

        F11 - Activate emergency Magical Defense Mode. Replaces Physical Defense Mode, if that was active.
    ]]
    state.MagicalDefenseMode:options("PetMDT")

    --[[ IDLE Mode Notes:

        F12 - Update currently equipped gear, and report current status.
        Ctrl-F12 - Cycle Idle Mode.
        
        Will automatically set IdleMode to Idle when Pet becomes Engaged and you are Idle
    ]]
    state.IdleMode:options("Idle", "MasterDT")

    --Various Cycles for the different types of PetModes
    state.PetStyleCycleTank = M {"NORMAL", "DD", "MAGIC", "SPAM"}
    state.PetStyleCycleMage = M {"NORMAL", "HEAL", "SUPPORT", "MB", "DD"}
    state.PetStyleCycleDD = M {"NORMAL", "BONE", "SPAM", "OD", "ODACC"}

    --The actual Pet Mode and Pet Style cycles
    --Default Mode is Tank
    state.PetModeCycle = M {"TANK", "DD", "MAGE"}
    --Default Pet Cycle is Tank
    state.PetStyleCycle = state.PetStyleCycleTank

    --Toggles
    --[[
        Alt + E will turn on or off Auto Maneuver
    ]]
    state.AutoMan = M(false, "Auto Maneuver")

    --[[
        //gs c toggle autodeploy
    ]]
    state.AutoDeploy = M(false, "Auto Deploy")

    --[[
        Alt + D will turn on or off Lock Pet DT
        (Note this will block all gearswapping when active)
    ]]
    state.LockPetDT = M(false, "Lock Pet DT")

    --[[
        Alt + (tilda) will turn on or off the Lock Weapon
    ]]
    state.LockWeapon = M(false, "Lock Weapon")

    --[[
        //gs c toggle setftp
    ]]
    state.SetFTP = M(false, "Set FTP")

   --[[
        This will hide the entire HUB
        //gs c hub all
    ]]
    state.textHideHUB = M(false, "Hide HUB")

    --[[
        This will hide the Mode on the HUB
        //gs c hub mode
    ]]
    state.textHideMode = M(false, "Hide Mode")

    --[[
        This will hide the State on the HUB
        //gs c hub state
    ]]
    state.textHideState = M(false, "Hide State")

    --[[
        This will hide the Options on the HUB
        //gs c hub options
    ]]
    state.textHideOptions = M(false, "Hide Options")

    --[[
        This will toggle the HUB lite mode
        //gs c hub lite
    ]]  
    state.useLightMode = M(false, "Toggles Lite mode")

    --[[
        This will toggle the default Keybinds set up for any changeable command on the window
        //gs c hub keybinds
    ]]
    state.Keybinds = M(true, "Hide Keybinds")

    --[[ 
        This will toggle the CP Mode 
        //gs c toggle CP 
    ]] 
    state.CP = M(false, "CP") 
    CP_CAPE = "Mecisto. Mantle" 

    --[[
        Enter the slots you would lock based on a custom set up.
        Can be used in situation like Salvage where you don't want
        certain pieces to change.

        //gs c toggle customgearlock
        ]]
    state.CustomGearLock = M(false, "Custom Gear Lock")
    --Example customGearLock = T{"head", "waist"}
    customGearLock = T{}

    send_command("bind !f7 gs c cycle PetModeCycle")
    send_command("bind ^f7 gs c cycleback PetModeCycle")
    send_command("bind !f8 gs c cycle PetStyleCycle")
    send_command("bind ^f8 gs c cycleback PetStyleCycle")
    send_command("bind !e gs c toggle AutoMan")
    send_command("bind !d gs c toggle LockPetDT")
    send_command("bind !f6 gs c predict")
    send_command("bind ^` gs c toggle LockWeapon")
    send_command("bind ^f gs c toggle setftp")
    send_command("bind PAGEUP gs c toggle autodeploy")
    send_command("bind PAGEDOWN gs c toggle keybinds")
    send_command("bind ^c gs c toggle CP") 
    send_command("bind = gs c clear")
	send_command("bind ^end gs c toggle textHideHub")
	send_command('alias drachen input /ja "Dracken Roll" <me>')
	send_command('alias double input /ja "Double-Up" <me>')
	send_command('alias turtle input //autocontrol equipset turtle; input /echo Light Fire Fire or Light Fire Water or Light Fire Dark for dispel')
	send_command('alias bruiser input //autocontrol equipset bruiser; input /echo Light Fire Fire or Light Fire Wind')
	send_command('alias harle input //acon equipset harle; input /echo Light Fire Water')
	send_command('alias sharpshottank input //autocontrol equipset sharpshottank; input /echo Light Fire Fire or Light Fire Wind')
	send_command('alias standarddd input //autocontrol equipset standarddd; input /echo Wind Fire Fire or Light Fire Wind')
	send_command('alias ranger input //autocontrol equipset ranger; input /echo Wind Wind Wind or Fire Fire Wind')
	send_command('alias boneslayer input //autocontrol equipset boneslayer; input /echo Light Fire Wind')
	send_command('alias whitemage input //acon equipset whitemage; input /echo Light Dark Ice or Light Light Dark for intense healing or Light Dark Water for -na spells')
	send_command('alias redmage input //acon equipset redmage; input /echo Light Dark Ice')
	send_command('alias blackmage input //acon equipset blackmage; input /echo Ice Ice Ice or Light Dark Ice')
	send_command('alias overdrive input //autocontrol equipset overdrive; input /echo Fire Thunder Light')
	

    select_default_macro_book()

    -- Adjust the X (horizontal) and Y (vertical) position here to adjust the window
    pos_x = 0
    pos_y = 0
    setupTextWindow(pos_x, pos_y)
    
end

function file_unload()
    send_command("unbind !f7")
    send_command("unbind ^f7")
    send_command("unbind !f8")
    send_command("unbind ^f8")
    send_command("unbind !e")
    send_command("unbind !d")
    send_command("unbind !f6")
    send_command("unbind ^`")
    send_command("unbind home")
    send_command("unbind PAGEUP")
    send_command("unbind PAGEDOWN")       
    send_command("unbind end")
    send_command("unbind =")
end

function job_setup()
    include("PUP-LIB.lua")
	include('MoveGear.lua')
	include('Lildel_Globals.lua')
	include('organizer-lib')
end

function init_gear_sets()
    --Table of Contents
    ---Gear Variables
    ---Master Only Sets
    ---Hybrid Only Sets
    ---Pet Only Sets
    ---Misc Sets

    -------------------------------------------------------------------------
    --  _____                  __      __        _       _     _
    -- / ____|                 \ \    / /       (_)     | |   | |
    --| |  __  ___  __ _ _ __   \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___
    --| | |_ |/ _ \/ _` | '__|   \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
    --| |__| |  __/ (_| | |       \  / (_| | |  | | (_| | |_) | |  __/\__ \
    -- \_____|\___|\__,_|_|        \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/
    -------------------------------------------------------------------------
    --[[
        This section is best ultilized for defining gear that is used among multiple sets
        You can simply use or ignore the below
    ]]
    Animators = {}
    Animators.Range = "Animator P II +1"
    Animators.Melee = "Animator P +1"
	
	Weapons = {}
	Weapons.SU5 = "Xiucoatl"
	Weapons.Aeonic = "Godhands"
	Weapons.Midnights = "Midnights"
	Weapons.Nibiru = "Nibiru Sainti"
	Weapons.Ohtas = "Ohtas"
	Weapons.Karambit = "Karambit"
	Weapons.Gnafron = "Gnafron\'s Adargas"

    --Adjust to your reforge level
    --Sets up a Key, Value Pair
    Artifact_Foire = {}
    Artifact_Foire.Head_PRegen = "Foire Taj +1"
    Artifact_Foire.Body_WSD_PTank = "Foire Tobe +2"
    Artifact_Foire.Hands_Mane_Overload = "Foire Dastanas +1"
    Artifact_Foire.Legs_PCure = "Foire Churidars +1"
    Artifact_Foire.Feet_Repair_PMagic = "Foire Babouches +1"

    Relic_Pitre = {}
    Relic_Pitre.Head_PRegen = "Pitre Taj +2" --Enhances Optimization
    Relic_Pitre.Body_PTP = "Pitre Tobe +2" --Enhances Overdrive
    Relic_Pitre.Hands_WSD = "Pitre Dastanas +2" --Enhances Fine-Tuning
    Relic_Pitre.Legs_PMagic = "Pitre Churidars +2" --Enhances Ventriloquy
    Relic_Pitre.Feet_PMagic = "Pitre Babouches +1" --Role Reversal

    Empy_Karagoz = {}
    Empy_Karagoz.Head_PTPBonus = "Karagoz Capello +1"
    Empy_Karagoz.Body_Overload = "Karagoz Farsetto +1"
    Empy_Karagoz.Hands = "Karagoz Guanti"
    Empy_Karagoz.Legs_Combat = "Karagoz Pantaloni +1"
    Empy_Karagoz.Feet_Tatical = "Karagoz Scarpe +1"

    Visucius = {}
    Visucius.PetDT = {
        name = "Visucius's Mantle",
        augments = {
            "Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20",
            "Accuracy+20 Attack+20",
            "Pet: Accuracy+4 Pet: Rng. Acc.+4",
            'Pet: "Regen"+10',
            "Pet: Damage taken -5%"
        }
    }
    Visucius.PetMagic = {
        name = "Visucius's Mantle",
        augments = {
            "Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20",
            "Accuracy+20 Attack+20",
            "Pet: Accuracy+4 Pet: Rng. Acc.+4",
            'Pet: "Regen"+10',
            "Pet: Damage taken -5%"
        }
    }

    --------------------------------------------------------------------------------
    --  __  __           _               ____        _          _____      _
    -- |  \/  |         | |             / __ \      | |        / ____|    | |
    -- | \  / | __ _ ___| |_ ___ _ __  | |  | |_ __ | |_   _  | (___   ___| |_ ___
    -- | |\/| |/ _` / __| __/ _ \ '__| | |  | | '_ \| | | | |  \___ \ / _ \ __/ __|
    -- | |  | | (_| \__ \ ||  __/ |    | |__| | | | | | |_| |  ____) |  __/ |_\__ \
    -- |_|  |_|\__,_|___/\__\___|_|     \____/|_| |_|_|\__, | |_____/ \___|\__|___/
    --                                                  __/ |
    --                                                 |___/
    ---------------------------------------------------------------------------------
    --This section is best utilized for Master Sets
    --[[
        Will be activated when Pet is not active, otherwise refer to sets.idle.Pet
    ]]
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
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},
}

    -------------------------------------Fastcast
    sets.precast.FC = {head={ name="Herculean Helm", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Store TP"+1','STR+7','Mag. Acc.+13','"Mag.Atk.Bns."+12',}},
    feet="Regal Pumps",
    neck="Loricate Torque +1",
    left_ear="Loquac. Earring",
    left_ring="Prolix Ring",
       -- Add your set here 
    }

    -------------------------------------Midcast
    sets.midcast = {} --Can be left empty

    sets.midcast.FastRecast = {head={ name="Herculean Helm", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Store TP"+1','STR+7','Mag. Acc.+13','"Mag.Atk.Bns."+12',}},
    feet="Regal Pumps",
    neck="Loricate Torque +1",
    left_ear="Loquac. Earring",
    left_ring="Prolix Ring",
       -- Add your set here 
    }

    -------------------------------------Kiting
    sets.Kiting = {feet = "Hermes' Sandals"}

    -------------------------------------JA
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck = "Magoraga Beads", body = "Passion Jacket"})

    -- Precast sets to enhance JAs
    sets.precast.JA = {} -- Can be left empty

    sets.precast.JA["Tactical Switch"] = {feet = Empy_Karagoz.Feet_Tatical}

    sets.precast.JA["Ventriloquy"] = {legs = Relic_Pitre.Legs_PMagic}

    sets.precast.JA["Role Reversal"] = {feet = Relic_Pitre.Feet_PMagic}

    sets.precast.JA["Overdrive"] = {body = Relic_Pitre.Body_PTP}

    sets.precast.JA["Repair"] = {
        ammo = "Automat. Oil +3",
        fhead={ name="Herculean Helm", augments={'"Repair" potency +5%','Pet: INT+2','Pet: Attack+5 Pet: Rng.Atk.+5','Pet: "Mag.Atk.Bns."+15',}},
    body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    hands={ name="Herculean Gloves", augments={'Pet: "Mag.Atk.Bns."+13','"Repair" potency +7%','Pet: STR+5','Pet: Attack+11 Pet: Rng.Atk.+11',}},
    legs={ name="Herculean Trousers", augments={'"Repair" potency +5%',}},
    feet={ name="Herculean Boots", augments={'Pet: Mag. Acc.+8','"Repair" potency +7%','Pet: AGI+2','Pet: Attack+2 Pet: Rng.Atk.+2','Pet: "Mag.Atk.Bns."+15',}},
    }

    sets.precast.JA["Maintenance"] = set_combine(sets.precast.JA["Repair"], {})

    sets.precast.JA.Maneuver = {
        neck = "Buffoon's Collar +1",
        body = "Karagoz Farsetto +1",
        hands = "Foire Dastanas +1",
        back = "Visucius's Mantle",
        --ear1 = "Burana Earring"
    }

    sets.precast.JA["Activate"] = {back = "Visucius's Mantle"}

    sets.precast.JA["Deus Ex Automata"] = sets.precast.JA["Activate"]

    sets.precast.JA["Provoke"] = {}

    --Waltz set (chr and vit)
    sets.precast.Waltz = {head="Hiza. Somen　+2",
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
    back="Solemnity Cape",
       -- Add your set here 
    }

    sets.precast.Waltz["Healing Waltz"] = {}

    -------------------------------------WS
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {head="Tali'ah Turban +2",
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
    back={ name="Dispersal Mantle", augments={'STR+2','DEX+2','Pet: TP Bonus+460','"Martial Arts"+13',}},
       -- Add your set here 
    }

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Stringing Pummel"] = set_combine(sets.precast.WS, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Heyoka Harness",
    hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
    legs="Heyoka Subligar",
    feet="Heyoka Leggings",
    neck="Breeze Gorget",
    waist="Moonbow Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Mache Earring +1",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Dispersal Mantle", augments={'STR+2','DEX+2','Pet: TP Bonus+460','"Martial Arts"+13',}},})

    sets.precast.WS["Stringing Pummel"].Mod = set_combine(sets.precast.WS, {})

    sets.precast.WS["Victory Smite"] = set_combine(sets.precast.WS, {head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Heyoka Harness",
    hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
    legs="Heyoka Subligar",
    feet="Heyoka Leggings",
    neck="Breeze Gorget",
    waist="Moonbow Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Mache Earring +1",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Dispersal Mantle", augments={'STR+2','DEX+2','Pet: TP Bonus+460','"Martial Arts"+13',}},})

    sets.precast.WS["Shijin Spiral"] =
        set_combine(sets.precast.WS, {head="Tali'ah Turban +2",
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
    back={ name="Dispersal Mantle", augments={'STR+2','DEX+2','Pet: TP Bonus+460','"Martial Arts"+13',}},
            -- Add your set here
        }

    )

    sets.precast.WS["Howling Fist"] = set_combine(sets.precast.WS, {ammo="Automat. Oil +3",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Tali'ah Manteel +2",
    hands={ name="Pitre Dastanas +3", augments={'Enhances "Fine-Tuning" effect',}},
    legs="Hiza. Hizayoroi +2",
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck={ name="Pup. Collar +1", augments={'Path: A',}},
    waist="Moonbow Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Dispersal Mantle", augments={'STR+2','DEX+2','Pet: TP Bonus+460','"Martial Arts"+13',}},})
	
	sets.precast.WS["Asuran Fists"] = {ammo="Automat. Oil +3",
    head="Malignance Chapeau",
    body="Tali'ah Manteel +2",
    hands={ name="Pitre Dastanas +3", augments={'Enhances "Fine-Tuning" effect',}},
    legs="Hiza. Hizayoroi +2",
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck="Flame Gorget",
    waist="Soil Belt",
    left_ear="Telos Earring",
    right_ear="Mache Earring +1",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},}

    -------------------------------------Idle
    --[[
        Pet is not active
        Idle Mode = MasterDT
    ]]
    sets.idle.MasterDT = {head="Malignance Chapeau",
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
    back="Moonbeam Cape",
       -- Add your set here 
    }

    -------------------------------------Engaged
    --[[
        Offense Mode = Master
        Hybrid Mode = Normal
    ]]
    sets.engaged.Master = {head={ name="Ryuo Somen", augments={'HP+50','Accuracy+15','Attack+15',}},
    body="Tali'ah Manteel +2",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck="Shulmanu Collar",
    waist="Moonbow Belt",
    left_ear="Telos Earring",
    right_ear="Mache Earring +1",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Dispersal Mantle", augments={'STR+2','DEX+2','Pet: TP Bonus+460','"Martial Arts"+13',}},
       -- Add your set here 
    }

    -------------------------------------Acc
    --[[
        Offense Mode = Master
        Hybrid Mode = Acc
    ]]
    sets.engaged.Master.Acc = {head={ name="Ryuo Somen", augments={'HP+50','Accuracy+15','Attack+15',}},
    body="Tali'ah Manteel +2",
    hands={ name="Herculean Gloves", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','Attack+12',}},
    legs="Hiza. Hizayoroi +2",
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+2','Attack+9',}},
    neck="Shulmanu Collar",
    waist="Moonbow Belt",
    left_ear="Telos Earring",
    right_ear="Mache Earring +1",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Dispersal Mantle", augments={'STR+2','DEX+2','Pet: TP Bonus+460','"Martial Arts"+13',}},
       -- Add your set here 
    }

    -------------------------------------TP
    --[[
        Offense Mode = Master
        Hybrid Mode = TP
    ]]
    sets.engaged.Master.TP = {head="Malignance Chapeau",
    body="Tali'ah Manteel +2",
    hands="Malignance Gloves",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck="Shulmanu Collar",
    waist="Moonbow Belt",
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Chirich Ring",
    right_ring="Chirich Ring",
    back={ name="Dispersal Mantle", augments={'STR+2','DEX+2','Pet: TP Bonus+460','"Martial Arts"+13',}},
       -- Add your set here
    }

    -------------------------------------DT
    --[[
        Offense Mode = Master
        Hybrid Mode = DT
    ]]
    sets.engaged.Master.DT = {head="Malignance Chapeau",
    body="Tali'ah Manteel +2",
    hands="Malignance Gloves",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Moonbow Belt",
    left_ear="Telos Earring",
    right_ear="Genmei Earring",
    left_ring="Patricius Ring",
    right_ring="Defending Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},
       -- Add your set here 
    }

    ----------------------------------------------------------------------------------
    --  __  __         _           ___     _     ___      _
    -- |  \/  |__ _ __| |_ ___ _ _| _ \___| |_  / __| ___| |_ ___
    -- | |\/| / _` (_-<  _/ -_) '_|  _/ -_)  _| \__ \/ -_)  _(_-<
    -- |_|  |_\__,_/__/\__\___|_| |_| \___|\__| |___/\___|\__/__/
    -----------------------------------------------------------------------------------

    --[[
        These sets are designed to be a hybrid of player and pet gear for when you are
        fighting along side your pet. Basically gear used here should benefit both the player
        and the pet.
    ]]
    --[[
        Offense Mode = MasterPet
        Hybrid Mode = Normal
    ]]
    sets.engaged.MasterPet = {
    ammo="Automat. Oil +3",
    head="Heyoka Cap",
    body="Tali'ah Manteel +2",
    hands="Tali'ah Gages +2",
    legs="Heyoka Subligar",
    feet="Tali'ah Crackows +2",
    neck="Bathy Choker +1",
    waist="Moonbow Belt",
    left_ear="Telos Earring",
    right_ear="Enmerkar Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Varar Ring +1",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},
       -- Add your set here 
    }

    -------------------------------------Acc
    --[[
        Offense Mode = MasterPet
        Hybrid Mode = Acc
    ]]
    sets.engaged.MasterPet.Acc = {
    ammo="Automat. Oil +3",
    head="Heyoka Cap",
    body="Tali'ah Manteel +2",
    hands="Tali'ah Gages +2",
    legs="Heyoka Subligar",
    feet="Tali'ah Crackows +2",
    neck="Bathy Choker +1",
    waist="Moonbow Belt",
    left_ear="Telos Earring",
    right_ear="Enmerkar Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Varar Ring +1",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},
       -- Add your set here 
    }

    -------------------------------------TP
    --[[
        Offense Mode = MasterPet
        Hybrid Mode = TP
    ]]
    sets.engaged.MasterPet.TP = {
    ammo="Automat. Oil +3",
    head={ name="Ryuo Somen +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
    body="Heyoka Harness",
    hands="Heyoka Mittens",
    legs="Heyoka Subligar",
    feet="Heyoka Leggings",
    neck="Empath Necklace",
    waist="Klouskap Sash +1",
    left_ear="Rimeice Earring",
    right_ear="Handler's Earring +1",
    left_ring="Hizamaru Ring",
    right_ring="Varar Ring +1",
    back="Shadow Mantle",
       -- Add your set here 
    }

    -------------------------------------DT
    --[[
        Offense Mode = MasterPet
        Hybrid Mode = DT
    ]]
    sets.engaged.MasterPet.DT = {
    ammo="Automat. Oil +3",
    head="Malignance Chapeau",
    body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    hands="Malignance Gloves",
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Isa Belt",
    left_ear="Telos Earring",
    right_ear="Genmei Earring",
    left_ring="Overbearing Ring",
    right_ring="Defending Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},
       -- Add your set here 
    }

    -------------------------------------Regen
    --[[
        Offense Mode = MasterPet
        Hybrid Mode = Regen
    ]]
    sets.engaged.MasterPet.Regen = {head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    body="Hiza. Haramaki +1",
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    neck="Bathy Choker +1",
    waist="Moonbow Belt",
    left_ear="Infused Earring",
    right_ear="Genmei Earring",
    left_ring="Chirich Ring",
    right_ring="Chirich Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},
       -- Add your set here  25 hp/tic
    }

    ----------------------------------------------------------------
    --  _____     _      ____        _          _____      _
    -- |  __ \   | |    / __ \      | |        / ____|    | |
    -- | |__) |__| |_  | |  | |_ __ | |_   _  | (___   ___| |_ ___
    -- |  ___/ _ \ __| | |  | | '_ \| | | | |  \___ \ / _ \ __/ __|
    -- | |  |  __/ |_  | |__| | | | | | |_| |  ____) |  __/ |_\__ \
    -- |_|   \___|\__|  \____/|_| |_|_|\__, | |_____/ \___|\__|___/
    --                                  __/ |
    --                                 |___/
    ----------------------------------------------------------------

    -------------------------------------Magic Midcast
    sets.midcast.Pet = {
       -- Add your set here 
    }

    sets.midcast.Pet.Cure = {
       -- Add your set here 
    }

    sets.midcast.Pet["Healing Magic"] = {
       -- Add your set here 
    }

    sets.midcast.Pet["Elemental Magic"] = {ammo="Automat. Oil +3",
    head={ name="Herculean Helm", augments={'"Repair" potency +5%','Pet: INT+2','Pet: Attack+5 Pet: Rng.Atk.+5','Pet: "Mag.Atk.Bns."+15',}},
    body="Pup. Tobe",
    hands={ name="Herculean Gloves", augments={'Pet: Mag. Acc.+28','Pet: "Subtle Blow"+7','Pet: Attack+3 Pet: Rng.Atk.+3','Pet: "Mag.Atk.Bns."+15',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet={ name="Herculean Boots", augments={'Pet: Mag. Acc.+8','"Repair" potency +7%','Pet: AGI+2','Pet: Attack+2 Pet: Rng.Atk.+2','Pet: "Mag.Atk.Bns."+15',}},
    neck="Adad Amulet",
    waist="Klouskap Sash +1",
    left_ear="Rimeice Earring",
    right_ear="Handler's Earring +1",
    left_ring="Defending Ring",
    right_ring="Varar Ring +1",
    back="Shadow Mantle"
       -- Add your set here 
    }

    sets.midcast.Pet["Enfeebling Magic"] = {ammo="Automat. Oil +3",
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
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},
       -- Add your set here 
    }

    sets.midcast.Pet["Dark Magic"] = {ammo="Automat. Oil +3",
    head={ name="Herculean Helm", augments={'Pet: "Mag.Atk.Bns."+30','"Store TP"+4','Pet: STR+7','Pet: Attack+11 Pet: Rng.Atk.+11',}},
    body={ name="Herculean Vest", augments={'Pet: "Mag.Atk.Bns."+22','"Store TP"+1',}},
    hands="Mpaca's Gloves",
    legs={ name="Herculean Trousers", augments={'Pet: "Mag.Atk.Bns."+30','Pet: "Store TP"+8',}},
    feet="Mpaca's Boots",
    neck={ name="Pup. Collar +1", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Enmerkar Earring",
    left_ring="Overbearing Ring",
    right_ring="Tali'ah Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},
       -- Add your set here 
    }

    sets.midcast.Pet["Divine Magic"] = {
       -- Add your set here 
    }

    sets.midcast.Pet["Enhancing Magic"] = {ammo="Automat. Oil +3",
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
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 3',}},
       -- Add your set here 
    }

    -------------------------------------Idle
    --[[
        This set will become default Idle Set when the Pet is Active 
        and sets.idle will be ignored
        Player = Idle and not fighting
        Pet = Idle and not fighting

        Idle Mode = Idle
    ]]
    sets.idle.Pet = {
    ammo="Automat. Oil +3",
    head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet="Hermes' Sandals",
    neck="Empath Necklace",
    waist="Klouskap Sash +1",
    left_ear="Gelai Earring",
    right_ear="Handler's Earring +1",
    left_ring="Varar Ring +1",
    right_ring="Overbearing Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 4',}},
       -- Add your set here 
    }

    --[[
        If pet is active and you are idle and pet is idle
        Player = idle and not fighting
        Pet = idle and not fighting

        Idle Mode = MasterDT
    ]]
    sets.idle.Pet.MasterDT = {ammo="Automat. Oil +3",
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    body="Onca Suit",
    neck="Adad Amulet",
    waist="Klouskap Sash +1",
    left_ear="Rimeice Earring",
    right_ear="Handler's Earring +1",
    left_ring="Defending Ring",
    right_ring="Varar Ring +1",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 4',}},
       -- Add your set here 
    }

    -------------------------------------Enmity
    sets.pet = {} -- Not Used

    --Equipped automatically
    sets.pet.Enmity = { head="Heyoka Cap",
    body="Heyoka Harness",
    hands="Heyoka Mittens",
    legs="Heyoka Subligar",
    feet="Heyoka Leggings",
	right_ear="Rimeice Earring",
       -- Add your set here 
    }

    --[[
        Activated by Alt+D or
        F10 if Physical Defense Mode = PetDT
    ]]
    sets.pet.EmergencyDT = {head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    neck="Bathy Choker +1",
    waist="Isa Belt",
    left_ear="Enmerkar Earring",
    right_ear="Handler's Earring +1",
    left_ring="Tali'ah Ring",
    right_ring="Overbearing Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 4',}},
       -- Add your set here 
    }

    -------------------------------------Engaged for Pet Only
    --[[
      For Technical Users - This is layout of below
      sets.idle[idleScope][state.IdleMode][ Pet[Engaged] ][CustomIdleGroups] 

      For Non-Technical Users:
      If you the player is not fighting and your pet is fighting the first set that will activate is sets.idle.Pet.Engaged
      You can further adjust this by changing the HyrbidMode using Ctrl+F9 to activate the Acc/TP/DT/Regen/Ranged sets
    ]]
    --[[
        Idle Mode = Idle
        Hybrid Mode = Normal
    ]]
    sets.idle.Pet.Engaged = {ammo="Automat. Oil +3",
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+3','Pet: Damage taken -2%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','Pet: "Dbl. Atk."+5','Pet: Damage taken -3%',}},
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    neck="Empath Necklace",
    waist="Klouskap Sash +1",
    left_ear="Rimeice Earring",
    right_ear="Handler's Earring +1",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
	back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 4',}},
       -- Add your set here 
    }

    --[[
        Idle Mode = Idle
        Hybrid Mode = Acc
    ]]
    sets.idle.Pet.Engaged.Acc = {ammo="Automat. Oil +3",
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+3','Pet: Damage taken -2%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','Pet: "Dbl. Atk."+5','Pet: Damage taken -3%',}},
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    neck="Empath Necklace",
    waist="Klouskap Sash +1",
    left_ear="Rimeice Earring",
    right_ear="Handler's Earring +1",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
	back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 4',}},
       -- Add your set here 
    }

    --[[
        Idle Mode = Idle
        Hybrid Mode = TP
    ]]
    sets.idle.Pet.Engaged.TP = {ammo="Automat. Oil +3",
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+3','Pet: Damage taken -2%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','Pet: "Dbl. Atk."+5','Pet: Damage taken -3%',}},
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    neck="Empath Necklace",
    waist="Klouskap Sash +1",
    left_ear="Rimeice Earring",
    right_ear="Handler's Earring +1",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
	back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 4',}},
       -- Add your set here 
    }

    --[[
        Idle Mode = Idle
        Hybrid Mode = DT
    ]]
    sets.idle.Pet.Engaged.DT = {ammo="Automat. Oil +3",
    head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    neck="Empath Necklace",
    waist="Klouskap Sash +1",
    left_ear="Rimeice Earring",
    right_ear="Handler's Earring +1",
    left_ring="Varar Ring +1",
    right_ring="Overbearing Ring",
	back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 4',}},
       -- Add your set here 
    }

    --[[
        Idle Mode = Idle
        Hybrid Mode = Regen
    ]]
    sets.idle.Pet.Engaged.Regen = {ammo="Automat. Oil +3",
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+3','Pet: Damage taken -2%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','Pet: "Dbl. Atk."+5','Pet: Damage taken -3%',}},
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    neck="Empath Necklace",
    waist="Klouskap Sash +1",
    left_ear="Gelai Earring",
    right_ear="Handler's Earring +1",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
	back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 4',}},
       -- Add your set here 
    }

    --[[
        Idle Mode = Idle
        Hybrid Mode = Ranged
    ]]
    sets.idle.Pet.Engaged.Ranged =
        set_combine(
        sets.idle.Pet.Engaged,
        {ammo="Automat. Oil +3",
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+3','Pet: Damage taken -2%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','Pet: "Dbl. Atk."+5','Pet: Damage taken -3%',}},
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+4','Pet: Damage taken -3%',}},
    neck="Empath Necklace",
    waist="Klouskap Sash +1",
    left_ear="Gelai Earring",
    right_ear="Handler's Earring +1",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
	back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 4',}},
        }
    )

    -------------------------------------WS
    --[[
        WSNoFTP is the default weaponskill set used
    ]]
    sets.midcast.Pet.WSNoFTP = {
    main={ name="Xiucoatl", augments={'Path: C',}},
    ammo="Automat. Oil +3",
    head="Karagoz Capello +1",
    body="Mpaca's Doublet",
    hands="Mpaca's Gloves",
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+21 Pet: Rng. Acc.+21','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    feet="Mpaca's Boots",
    neck="Shulmanu Collar",
    waist="Klouskap Sash +1",
    left_ear="Handler's Earring +1",
    right_ear="Enmerkar Earring",
    left_ring="Overbearing Ring",
    right_ring="Varar Ring +1",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1246 Val: 4',}},
       -- Add your set here
    }

    --[[
        If we have a pet weaponskill that can benefit from WSFTP
        then this set will be equipped
    ]]
    sets.midcast.Pet.WSFTP = {
    main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},
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
    back={ name="Dispersal Mantle", augments={'STR+2','DEX+2','Pet: TP Bonus+460','"Martial Arts"+13',}},
       -- Add your set here
    }

    --[[
        Base Weapon Skill Set
        Used by default if no modifier is found
    ]]
    sets.midcast.Pet.WS = { main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},
    ammo="Automat. Oil +3",
    head="Karagoz Capello +1",
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -3%',}},
    legs="Karagoz Pantaloni",
    feet="Tali'ah Crackows +2",
    neck="Shulmanu Collar",
    waist="Klouskap Sash +1",
    left_ear="Handler's Earring +1",
    right_ear="Enmerkar Earring",
    left_ring="Varar Ring +1",
    right_ring="Overbearing Ring",
    back={ name="Dispersal Mantle", augments={'STR+2','DEX+2','Pet: TP Bonus+460','"Martial Arts"+13',}},}

    --Chimera Ripper, String Clipper
    sets.midcast.Pet.WS["STR"] = set_combine(sets.midcast.Pet.WSNoFTP, {head="Tali'ah Turban +2",
    body="Tali'ah Manteel +2",
    hands="Tali'ah Gages +2",
    legs="Tali'ah Sera. +1",
    feet="Tali'ah Crackows +2",
    neck="Empath Necklace",
    waist="Klouskap Sash +1",
    left_ear="Mache Earring +1",
    right_ear="Enmerkar Earring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back="Solemnity Cape",})

    -- Bone crusher, String Shredder
    sets.midcast.Pet.WS["VIT"] =
        set_combine(
        sets.midcast.Pet.WSNoFTP,
        {head="Tali'ah Turban +2",
    body="Tali'ah Manteel +2",
    hands="Tali'ah Gages +2",
    legs="Tali'ah Sera. +1",
    feet="Tali'ah Crackows +2",
    neck="Empath Necklace",
    waist="Klouskap Sash +1",
    left_ear="Mache Earring +1",
    right_ear="Enmerkar Earring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back="Solemnity Cape",
            -- Add your gear here that would be different from sets.midcast.Pet.WSNoFTP
           
        }
    )

    -- Cannibal Blade
    sets.midcast.Pet.WS["MND"] = set_combine(sets.midcast.Pet.WSNoFTP, {head="Tali'ah Turban +2",
    body="Tali'ah Manteel +2",
    hands="Tali'ah Gages +2",
    legs="Tali'ah Sera. +1",
    feet="Tali'ah Crackows +2",
    neck="Empath Necklace",
    waist="Klouskap Sash +1",
    left_ear="Mache Earring +1",
    right_ear="Enmerkar Earring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back="Solemnity Cape",})

    -- Armor Piercer, Armor Shatterer
    sets.midcast.Pet.WS["DEX"] = set_combine(sets.midcast.Pet.WSNoFTP, {head="Tali'ah Turban +2",
    body="Tali'ah Manteel +2",
    hands="Tali'ah Gages +2",
    legs="Tali'ah Sera. +1",
    feet="Tali'ah Crackows +2",
    neck="Empath Necklace",
    waist="Klouskap Sash +1",
    left_ear="Mache Earring +1",
    right_ear="Enmerkar Earring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back="Solemnity Cape",})

    -- Arcuballista, Daze
    sets.midcast.Pet.WS["DEXFTP"] =
        set_combine(
        sets.midcast.Pet.WSFTP,
        {
            -- Add your gear here that would be different from sets.midcast.Pet.WSFTP
     
        }
    )

    ---------------------------------------------
    --  __  __ _             _____      _
    -- |  \/  (_)           / ____|    | |
    -- | \  / |_ ___  ___  | (___   ___| |_ ___
    -- | |\/| | / __|/ __|  \___ \ / _ \ __/ __|
    -- | |  | | \__ \ (__   ____) |  __/ |_\__ \
    -- |_|  |_|_|___/\___| |_____/ \___|\__|___/
    ---------------------------------------------
    -- Town Set
    sets.idle.Town = {main="Godhands",
    ammo="Automat. Oil +3",
    head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    neck="Shulmanu Collar",
    waist="Klouskap Sash +1",
    left_ear="Handler's Earring +1",
    right_ear="Enmerkar Earring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back="Solemnity Cape",
       -- Add your set here
    }

    -- Resting sets
    sets.resting = {
    ammo="Automat. Oil +3",
    head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    body={ name="Rao Togi +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    neck="Bathy Choker +1",
    waist="Isa Belt",
    left_ear="Infused Earring",
    right_ear="Enmerkar Earring",
    left_ring="Chirich Ring",
    right_ring="Chirich Ring",
    back="Solemnity Cape",
       -- Add your set here
    }

    sets.defense.MasterDT = sets.idle.MasterDT

    sets.defense.PetDT = sets.pet.EmergencyDT

    sets.defense.PetMDT = set_combine(sets.pet.EmergencyDT, {})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == "WAR" then
        set_macro_page(1, 1)
    elseif player.sub_job == "NIN" then
        set_macro_page(1, 1)
    elseif player.sub_job == "DNC" then
        set_macro_page(1, 1)
    else
        set_macro_page(1, 1)
    end
end

