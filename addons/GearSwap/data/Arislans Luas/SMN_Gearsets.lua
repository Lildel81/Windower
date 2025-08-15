-- Setup your Key Bindings here:  
	-- Old Binds from Phelt
    windower.send_command('bind f7 input /target <me>')
    windower.send_command('bind f9 gs c avatar mode')
    windower.send_command('bind f10 gs c toggle auto')
    windower.send_command('bind ^f12 gs c toggle melee')
	windower.send_command('bind !w input /equip ring2 "Warp Ring"; /echo Warping; wait 11; input /item "Warp Ring" <me>;')
	windower.send_command('bind !q input /equip ring2 "Dim. Ring (Holla)"; /echo Reisenjima; wait 11; input /item "Dim. Ring (Holla)" <me>;')
	windower.send_command('bind ^delete input /ma "Cure IV" <me>')
	windower.send_command('bind ^insert input /ma "Cure IV" <t>')
	windower.send_command('bind ^pagedown input /ma "Regen" <me>')
	windower.send_command('bind ^pageup input /ma "Regen" <t>')
	windower.send_command('bind ^end input /ma "Stoneskin" <me>')
	windower.send_command('bind ` input /mount "Crawler" <me>')
	windower.send_command('bind !a input /ja "Apogee" <me>')
	windower.send_command('bind !j input /jump')
	windower.send_command('bind !. input //gs c toggle favor')
	-- Number Pad Binds
	windower.send_command('bind !numpad9 input //gs c pact bp99')
	windower.send_command('bind !numpad8 input //gs c pact bp75')
	windower.send_command('bind !numpad7 input //gs c pact bp70')
	windower.send_command('bind !numpad6 input //gs c pact nuke4')
	windower.send_command('bind !numpad5 input //gs c pact sleep')
	windower.send_command('bind !numpad4 input //gs c pact debuff2')
	windower.send_command('bind !numpad3 input //gs c pact buffoffense')
	windower.send_command('bind !numpad2 input //gs c pact curaga')
	windower.send_command('bind !numpad1 input /target <bt>')
	windower.send_command('bind !numpad0 input /pet "Assault" <t>')
	windower.send_command('bind !z input /assist "Phelt"')
	windower.send_command('bind !v input /pet "Avatar\'s Favor" <me>')
-- Alias Binds
	windower.send_command('alias s input /ma "Stoneskin" <me>')
	windower.send_command('alias cc input /ma "Cure II" <t>')
	windower.send_command('alias ccc input /ma "Cure III" <t>')
	send_command('bind numpad. setkey escape down;wait .1;setkey escape up')
	
	
	
	
	
	-- Called when this job file is unloaded (eg: job change)
function file_unload()
    if binds_on_unload then
        binds_on_unload()
    end
     
    windower.send_command('unbind f7')
    windower.send_command('unbind f9')
    windower.send_command('unbind f10')
    windower.send_command('unbind f12')
	windower.send_command('unbind !e')
	windower.send_command('unbind !r')
	windower.send_command('unbind !p')
	windower.send_command('unbind !h')
	windower.send_command('unbind !w')
	windower.send_command('unbind !q')
	windower.send_command('unbind ^delete')
	windower.send_command('unbind ^insert')
	windower.send_command('unbind ^pagedown')
	windower.send_command('unbind ^pageup')
	windower.send_command('unbind !s')
	windower.send_command('unbind ^end')
	windower.send_command('unbind ^home')
	windower.send_command('unbind !c')
    windower.send_command('unbind `')
	windower.send_command('unbind @2')
	windower.send_command('unbind !a')
	windower.send_command('unbind !j')
	windower.send_command('unbind !.')
	windower.send_command('unbind @9')
	windower.send_command('unbind @8')
	windower.send_command('unbind @7')
	windower.send_command('unbind @6')
	windower.send_command('unbind @5')
	windower.send_command('unbind @4')
	windower.send_command('unbind @3')
	windower.send_command('unbind @1')
end
     
-- Setup your Gear Sets below:
function get_sets()
  
    -- My formatting is very easy to follow. All sets that pertain to my character doing things are under 'me'.
    -- All sets that are equipped to faciliate my avatar's behaviour or abilities are under 'avatar', eg, Perpetuation, Blood Pacts, etc
      
    sets.me = {}        -- leave this empty
    sets.avatar = {}    -- leave this empty
      
    -- Your idle set when you DON'T have an avatar out
    sets.me.idle = { main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="Convoker's Horn +3",
    body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
    hands="Asteria Mitts +1",
    legs="Assid. Pants +1",
    feet="Herald's Gaiters",
    neck="Smn. Collar +2",
    waist="Fucho-no-Obi",
    left_ear="C. Palug Earring",
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -3%',}},
    back="Solemnity Cape",
	}
      
    -- Your MP Recovered Whilst Resting Set
    sets.me.resting = { main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="Convoker's Horn +3",
    body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
    hands="Asteria Mitts +1",
    legs="Assid. Pants +1",
    feet="Herald's Gaiters",
    neck="Smn. Collar +2",
    waist="Fucho-no-Obi",
    left_ear="C. Palug Earring",
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -3%',}},
    back="Solemnity Cape",
	}
      
    -----------------------
    -- Perpetuation Related
    -----------------------
      
    -- Avatar's Out --  
    -- This is the base for all perpetuation scenarios, as seen below
	sets.avatar.perp = {
    main= "Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="Convoker's Horn +3",
    body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
    hands="Asteria Mitts +1",
    legs="Assid. Pants +1",
    feet="Baaya. Sabots +1",
    neck={ name="Smn. Collar +2", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear="C. Palug Earring",
    right_ear="Evans Earring",
    left_ring="C. Palug Ring",
    right_ring="Evoker's Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10',}},
	}
  
    -- The following sets base off of perpetuation, so you can consider them idle sets.
    -- Set the relevant gear, bearing in mind it will overwrite the perpetuation item for that slot!
    sets.avatar["Carbuncle"] = {hands="Carbuncle Mitts"}
    sets.avatar["Cait Sith"] = {hands="Lamassu Mitts +1"}
    -- When we want our avatar to stay alive
    sets.avatar.tank = set_combine(sets.avatar.perp,{ main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head={ name="Apogee Crown", augments={'Pet: Attack+20','Pet: "Mag.Atk.Bns."+20','Blood Pact Dmg.+7',}},
    body={ name="Glyphic Doublet +1", augments={'Reduces Sp. "Blood Pact" MP cost',}},
    hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+28 Pet: Rng. Acc.+28','Blood Pact Dmg.+10','Pet: Mag. Acc.+14',}},
    legs="Tali'ah Sera. +1",
    feet={ name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
    neck="Smn. Collar +2",
    waist="Klouskap Sash",
    left_ear="Handler's Earring +1",
    right_ear="Evans Earring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10',}},
    })
      
    -- When we want our avatar to shred
    sets.avatar.melee = {main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="Convoker's Horn +3",
    body="Con. Doublet +3",
    hands="Tali'ah Gages +2",
    legs="Bunzi's Pants",
    feet="Convo. Pigaches +3",
    neck="Shulmanu Collar",
    waist="Incarnation Sash",
    left_ear="Sroda Earring",
    right_ear="Enmerkar Earring",
    left_ring="C. Palug Ring",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10',}},
}
      
    -- When we want our avatar to hit
    sets.avatar.acc = {main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="Convoker's Horn +3",
    body="Con. Doublet +3",
    hands="Tali'ah Gages +2",
    legs="Bunzi's Pants",
    feet="Convo. Pigaches +3",
    neck="Shulmanu Collar",
    waist="Incarnation Sash",
    left_ear="Sroda Earring",
    right_ear="Enmerkar Earring",
    left_ring="C. Palug Ring",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10',}},
}
      
    -- When Avatar's Favor is active
    sets.avatar.favor = set_combine(sets.avatar.perp,{       
       --[[sub="Vox Grip",
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +2",
    body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
    hands="Lamassu Mitts",
    legs="Baayami Slops",
    feet="Baaya. Sabots +1",
    neck="Melic Torque",
    waist="Lucidity Sash",
    left_ear="C. Palug Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring",
    right_ring="Evoker's Ring",
    back={ name="Conveyance Cape", augments={'Summoning magic skill +4','Pet: Enmity+11','Blood Pact Dmg.+1','Blood Pact ab. del. II -3',}},]]
    })
      
    ----------------------------
    -- Summoning Skill Related
    -- Including all blood pacts
    ----------------------------
      
    -- + Summoning Magic. This is a base set for max skill and blood pacts and we'll overwrite later as and when we need to
    sets.avatar.skill = {main={ name="Glyphic Staff", augments={'Path: C',}},
    sub="Vox Grip",
    ammo="Sancus Sachet +1",
    head="Convoker's Horn +3",
    body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
    hands="Lamassu Mitts",
    legs="Baayami Slops",
    feet="Baaya. Sabots +1",
    neck="Melic Torque",
    waist="Lucidity Sash",
    left_ear="C. Palug Earring",
    right_ear="Andoaa Earring",
    left_ring="Evoker's Ring",
    right_ring="Stikini Ring",
    back={ name="Conveyance Cape", augments={'Summoning magic skill +4','Pet: Enmity+11','Blood Pact Dmg.+1','Blood Pact ab. del. II -3',}},
	}
      
    -------------------------
    -- Individual Blood Pacts
    -------------------------
      
    -- Physical damage
    sets.avatar.atk =  {main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
     head={ name="Apogee Crown", augments={'Pet: Attack+20','Pet: "Mag.Atk.Bns."+20','Blood Pact Dmg.+7',}},
    body="Con. Doublet +3",
    hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+28 Pet: Rng. Acc.+28','Blood Pact Dmg.+10','Pet: Mag. Acc.+14',}},
    legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
    feet="Convo. Pigaches +3",
    neck="Smn. Collar +2",
    waist="Regal Belt",
    left_ear="Lugalbanda Earring",
    right_ear="Gelos Earring",
    left_ring="Cath Palug Ring",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10',}},
	}

    sets.avatar.pacc = {main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="Convoker's Horn +3",
    body="Con. Doublet +3",
    hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+28 Pet: Rng. Acc.+28','Blood Pact Dmg.+10','Pet: Mag. Acc.+14',}},
    legs="Tali'ah Sera. +1",
    feet="Convo. Pigaches +3",
    neck="Smn. Collar +2",
    waist="Regal Belt",
    left_ear="Lugalbanda Earring",
    right_ear="Enmerkar Earring",
    left_ring="Cath Palug Ring",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10',}},
}
      
    -- Magic Attack
    sets.avatar.mab = {main={ name="Grioavolr", augments={'Blood Pact Dmg.+6','Pet: Mag. Acc.+19','Pet: "Mag.Atk.Bns."+25','DMG:+12',}},
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head={ name="Glyphic Horn +2", augments={'Enhances "Astral Flow" effect',}},
    body="Con. Doublet +3",
    hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7','Pet: DEX+1',}},
    legs={ name="Glyphic Spats +2", augments={'Increases Sp. "Blood Pact" accuracy',}},
    feet={ name="Apogee Pumps +1", augments={'Pet: Attack+25','Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+8',}},
    neck="Smn. Collar +2",
    waist="Regal Belt",
    left_ear="Lugalbanda Earring",
    right_ear="Gelos Earring",
    left_ring="Cath Palug Ring",
    right_ring="Speaker's Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Mag. Acc.+10','"Fast Cast"+10',}},
	}

    sets.avatar.mb = set_combine(sets.avatar.mab,{hands="Glyphic Bracers"})
	
	
    -- Hybrid
    sets.avatar.hybrid = { main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
     head={ name="Glyphic Horn +2", augments={'Enhances "Astral Flow" effect',}},
    body="Con. Doublet +3",
    hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+28 Pet: Rng. Acc.+28','Blood Pact Dmg.+10','Pet: Mag. Acc.+14',}},
    legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
    feet={ name="Apogee Pumps +1", augments={'Pet: Attack+25','Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+8',}},
    neck="Smn. Collar +2",
    waist="Incarnation Sash",
    left_ear="Lugalbanda Earring",
    right_ear="Gelos Earring",
    left_ring="Cath Palug Ring",
    right_ring="Speaker's Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10',}},
	}
      
    -- Magic Accuracy
    sets.avatar.macc = set_combine(sets.avatar.skill,{
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    })
      
    -- Buffs
    sets.avatar.buff = {main={ name="Glyphic Staff", augments={'Path: C',}},
    sub="Vox Grip",
    ammo="Sancus Sachet +1",
    head="Convoker's Horn +3",
    body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
    hands="Lamassu Mitts +1",
    legs="Baayami Slops",
    feet="Baaya. Sabots +1",
    neck="Melic Torque",
    waist="Lucidity Sash",
    left_ear="C. Palug Earring",
    right_ear="Andoaa Earring",
    left_ring="Evoker's Ring",
    right_ring="Stikini Ring",
    back={ name="Conveyance Cape", augments={'Summoning magic skill +4','Pet: Enmity+11','Blood Pact Dmg.+1','Blood Pact ab. del. II -3',}},
	}
    -- Other
    sets.avatar.other = set_combine(sets.avatar.skill,{
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    })
      
    -- Combat Related Sets
      
    -- Melee
    -- The melee set combines with perpetuation, because we don't want to be losing all our MP whilst we swing our Staff
    -- Anything you equip here will overwrite the perpetuation/refresh in that slot.
    sets.me.melee = {ammo="Sancus Sachet +1",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Tali'ah Manteel +2",
    hands="Bunzi's Gloves",
    legs="Bunzi's Pants",
    feet="Beck. Pigaches +2",
    neck="Shulmanu Collar",
    waist="Windbuffet Belt +1",
    left_ear="Sroda Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring",
    right_ring="Chirich Ring",
    back={ name="Campestres's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
      
    -- Shattersoul. Weapon Skills do not work off perpetuation as it only stays equipped for a moment
    sets.me["Shattersoul"] = {ammo="Sancus Sachet +1",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Tali'ah Manteel +2",
    hands="Bunzi's Gloves",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Shulmanu Collar",
    waist="Fotia Belt",
    left_ear="Sroda Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Patricius Ring",
    back={ name="Campestres's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
    
	sets.me["Garland of Bliss"] = {head="Nyame Helm",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Bunzi's Pants",
    feet={ name="Merlinic Crackows", augments={'VIT+1','Weapon Skill Acc.+10','Quadruple Attack +1','Accuracy+14 Attack+14','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    neck="Mizu. Kubikazari",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Friomisi Earring",
    left_ring="Weather. Ring",
    right_ring="Fenrir Ring +1",
    back={ name="Campestres's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}},
	}
      
    -- Feel free to add new weapon skills, make sure you spell it the same as in game. These are the only two I ever use though
  
    ---------------
    -- Casting Sets
    ---------------
      
    sets.precast = {}
    sets.midcast = {}
    sets.aftercast = {}
      
    ----------
    -- Precast
    ----------
      
    -- Generic Casting Set that all others take off of. Here you should add all your fast cast  
    sets.precast.casting = {main={ name="Grioavolr", augments={'Blood Pact Dmg.+6','Pet: Mag. Acc.+19','Pet: "Mag.Atk.Bns."+25','DMG:+12',}},
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    feet="Regal Pumps",
    waist="Witful Belt",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Mag. Acc.+10','"Fast Cast"+10',}},
	} 
      
    -- Summoning Magic Cast time - gear
    sets.precast.summoning = {main={ name="Grioavolr", augments={'Blood Pact Dmg.+6','Pet: Mag. Acc.+19','Pet: "Mag.Atk.Bns."+25','DMG:+12',}},
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    feet="Regal Pumps",
    waist="Witful Belt",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Mag. Acc.+10','"Fast Cast"+10',}},
	} 
      
      
    -- Enhancing Magic, eg. Siegal Sash, etc
    sets.precast.enhancing = {main={ name="Grioavolr", augments={'Blood Pact Dmg.+6','Pet: Mag. Acc.+19','Pet: "Mag.Atk.Bns."+25','DMG:+12',}},
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    feet="Regal Pumps",
    waist="Witful Belt",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Mag. Acc.+10','"Fast Cast"+10',}},
	} 
  
    -- Stoneskin casting time -, works off of enhancing -
    sets.precast.stoneskin = {main={ name="Grioavolr", augments={'Blood Pact Dmg.+6','Pet: Mag. Acc.+19','Pet: "Mag.Atk.Bns."+25','DMG:+12',}},
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    feet="Regal Pumps",
    waist="Witful Belt",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Mag. Acc.+10','"Fast Cast"+10',}},
	} 
      
    -- Curing Precast, Cure Spell Casting time -
    sets.precast.cure = {main={ name="Grioavolr", augments={'Blood Pact Dmg.+6','Pet: Mag. Acc.+19','Pet: "Mag.Atk.Bns."+25','DMG:+12',}},
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    feet="Regal Pumps",
    waist="Witful Belt",
    left_ear="Mendi. Earring",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Mag. Acc.+10','"Fast Cast"+10',}},
	} 
    ---------------------
    -- Ability Precasting
    ---------------------
      
    -- Blood Pact Ability Delay
    sets.precast.bp = {main="Nirvana",
    ssub="Vox Grip",
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +2",
    body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
    hands="Lamassu Mitts",
    legs="Baayami Slops",
    feet="Baaya. Sabots +1",
    neck="Melic Torque",
    waist="Lucidity Sash",
    left_ear="C. Palug Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring",
    right_ring="Evoker's Ring",
    back={ name="Conveyance Cape", augments={'Summoning magic skill +4','Pet: Enmity+11','Blood Pact Dmg.+1','Blood Pact ab. del. II -3',}},
}
      
    -- Mana Cede
    sets.precast["Mana Cede"] = {
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    }
      
    -- Astral Flow  
    sets.precast["Astral Flow"] = {
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    }
      
    ----------
    -- Midcast
    ----------
      
    -- We handle the damage and etc. in Pet Midcast later
      
    -- Whatever you want to equip mid-cast as a catch all for all spells, and we'll overwrite later for individual spells
    sets.midcast.casting = {main="Nirvana",
    sub="Mensch Strap",
    ammo="Sancus Sachet +1",
    head="Tali'ah Turban",
    body={ name="Helios Jacket", augments={'Accuracy+8','"Occult Acumen"+10','MP+39',}},
    hands="Tali'ah Gages",
    legs="Tali'ah Sera. +1",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','"Occult Acumen"+10','Mag. Acc.+14',}},
    neck="Sanctity Necklace",
    waist="Witful Belt",
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    left_ring="Perception Ring",
    right_ring="Acumen Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Mag. Acc.+10','"Fast Cast"+10',}},
	} 
      
    -- Enhancing
    sets.midcast.enhancing = set_combine(sets.midcast.casting,{
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    })
      
    -- Stoneskin
    sets.midcast.stoneskin = set_combine(sets.midcast.enhancing,{
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    })
    -- Elemental Siphon, eg, Tatsumaki Thingies, Esper Stone, etc
    sets.midcast.siphon = set_combine(sets.avatar.skill,{
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    })
        
    -- Cure Potency
    sets.midcast.cure = {main="Nirvana",
    sub="Mensch Strap",
    ammo="Sancus Sachet +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Telchine Chas.",
    hands="Bokwus Gloves",
    legs="Tali'ah Sera. +1",
    feet="Regal Pumps",
    neck="Healing Torque",
    waist="Witful Belt",
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    left_ring="Perception Ring",
    right_ring="Sirona's Ring",
    back="Solemnity Cape",
	}
      
    ------------
    -- Aftercast
    ------------
      
    -- I don't use aftercast sets, as we handle what to equip later depending on conditions using a function, eg, do we have an avatar out?
  
end
