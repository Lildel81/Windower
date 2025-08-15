require 'organizer-lib'
---------------------------------------------------------------------------------------------------------------------------------------
-------------------------------- Initialization function that defines sets and variables to be used -----------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
 
-- IMPORTANT: Make sure to also get the Mote-Include.lua file to go with this.
 
-- Initialization function for this job file.
function get_sets()
 
    -- Load and initialize the include file.
    include('Mote-IncludePLD.lua')
	include('MoveGear.lua')
	include('Lildel_Globals.lua')
	include('organizer-lib')
end

 
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    -- Options: Override default values
    options.OffenseModes = {'Normal', 'Acc', 'Tank'}
	options.DefenseModes = {'Normal', 'PDT'}
    options.WeaponskillModes = {'Normal', 'Acc'}
    options.CastingModes = {'Normal', 'DT', 'SIRD'} 
    options.IdleModes = {'Normal',}
    options.RestingModes = {'Normal'}
    options.PhysicalDefenseModes = {'Aegis', 'Srivatsa', 'Ochain'}
    options.MagicalDefenseModes = {'MDT' ,'BDT','ResistCharm'}
    options.HybridDefenseModes = {'None', 'Reraise',}
    options.BreathDefenseModes = {'BDT'}
	state.Defense.PhysicalMode = 'Aegis'
    state.HybridDefenseMode = 'None'
    state.BreathDefenseModes = 'BDT'
	--state.GI = true
	state.autobuff = true
	
    send_command('bind f12 gs c cycle MagicalDefense')
 	send_command('bind ^= gs c activate MDT')
	send_command('bind delete gs c cycle offensemode')
	send_command('bind home gs c cycle castingmode')
    select_default_macro_book()
	send_command('alias binds input /echo "home" - Casting mode // "delete" - Offense Mode // "CTRL F1-5" Pico Cure P1-5 // "ALT F1-5" Pico Curaga P1-5')
	
	
end

 function user_unload()
	send_command('unbind `')
	send_command('unbind ^`')
	send_command('unbind !`')
	send_command('unbind ^-')
	send_command('unbind !-')	
	send_command('unbind ^=')
	send_command('unbind !=')		
	send_command('unbind delete')
	send_command('unbind end')
	send_command('unbind home')
end

-- Define sets and vars used by this job file.
function job_setup()
 	include('caster-buffWatcher.lua')
buffWatcher.watchList = 
{
                       ["Enlight"]="Enlight II",
					   ["Enmity Boost"]="Crusade",
                       ["Phalanx"]="Phalanx",
                       ["Protect"]="Protect V",
                       ["Shell"]="Shell IV",							   
}
include('common_info.status.lua')	
end

--------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------Precast sets-----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

function init_gear_sets()

	 -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.precast.JA['Rampart'], {legs="Cab. Breeches +3"})
   
    sets.precast.JA['Holy Circle'] = set_combine(sets.precast.JA['Rampart'], {feet="Rev. Leggings +3"})
         
    sets.precast.JA['Shield Bash'] = set_combine(sets.precast.JA['Rampart'], {hands="Cab. Gauntlets +3", left_ear="Knightly Earring", left_ring="Guardian's Ring",right_ring="Fenian Ring"})
     
    sets.precast.JA['Intervene'] = sets.precast.JA['Shield Bash']
    
    sets.precast.JA['Sentinel'] = set_combine(sets.precast.JA['Provoke'], {feet="Cab. Leggings +3"})   
     
    --The amount of damage absorbed is variable, determined by VIT*2
    sets.precast.JA['Rampart'] = {ammo="Paeapua", --2
    head={ name="Loess Barbuta +1", augments={'Path: A',}},--24
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --20
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},--9
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},--9
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},--9
    neck="Moonlight Necklace",--15
    waist="Creed Baudrier",--5
    left_ear="Cryptic Earring",--4
    right_ear="Friomisi Earring",--2
    left_ring="Provocare Ring",--5
    right_ring="Supershear Ring",--5
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},--10
}--Total Enmity = 114 (137 with Burtgang and 167 with Crusader) Absorbs 596 Damage
     
    sets.buff['Rampart'] = sets.precast.JA['Rampart']
	
	sets.buff['Valiance'] = sets.precast.JA['Provoke']
	
	sets.buff['Pflug'] = sets.precast.JA['Provoke']
	
	sets.buff['Vallation'] = sets.precast.JA['Provoke']
   
    sets.precast.JA['Fealty'] = set_combine(sets.precast.JA['Provoke'], {body="Cab. Surcoat +3",})
     
    sets.precast.JA['Divine Emblem'] = set_combine(sets.precast.JA['Provoke'], {feet="Chev. Sabatons +1"})
     
    --15 + min(max(floor((user VIT + user MND - target VIT*2)/4),0),15)
    sets.precast.JA['Cover'] = set_combine(sets.precast.JA['Rampart'], {head="Rev. Coronet +3", body="Cab. Surcoat +1"})
    
    sets.buff['Cover'] = sets.precast.JA['Cover']
     
    -- add MND for Chivalry
    sets.precast.JA['Chivalry'] = 
{
	ammo="Staunch Tathlum",
    head={ name="Cab. Coronet +3", augments={'Enhances "Iron Will" effect',}},
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Cab. Leggings +3", augments={'Enhances "Guardian" effect',}},
    neck="Unmoving Collar",
    waist="Warwolf Belt",
    left_ear="Friomisi Earring",
    right_ear="Cryptic Earring",
    left_ring="Eihwaz Ring",
    right_ring="Provocare Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},
}
     
    ------------------------ Sub WAR ------------------------ 
	sets.precast.JA['Provoke'] =    --enmity +142 || Enmity + 172 with Crusade
{
    ammo="Paeapua", --2
    head={ name="Loess Barbuta +1", augments={'Path: A',}},--24
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --20
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},--9
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},--9
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},--9
    neck="Moonlight Necklace",--15
    waist="Creed Baudrier",--5
    left_ear="Cryptic Earring",--4
    right_ear="Friomisi Earring",--2
    left_ring="Provocare Ring",--5
    right_ring="Supershear Ring",--5
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},--10
}	
 
    sets.precast.JA['Warcry'] = sets.precast.JA['Provoke'] 
     
    sets.precast.JA['Defender'] = sets.precast.JA['Provoke']
 
    ------------------------ Sub DNC ------------------------ 
     
    -- Waltz set (chr and vit)
    sets.precast.Waltz = 
{
    ammo="Paeapua", --2
    head={ name="Loess Barbuta +1", augments={'Path: A',}},--24
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --20
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},--9
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},--9
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},--9
    neck="Moonlight Necklace",--10
    waist="Creed Baudrier",--5
    left_ear="Cryptic Earring",--4
    right_ear="Friomisi Earring",--2
    left_ring="Provocare Ring",--5
    right_ring="Supershear Ring",--5
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},--10
}
         
    -- Special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = sets.precast.Waltz
     
    sets.precast.Step = sets.precast.JA['Provoke']
        
    sets.precast.Flourish1 = sets.precast.Step
     
    ------------------------ Sub RUN ------------------------ 
    sets.precast.JA['Ignis'] = sets.precast.JA['Provoke']   
    sets.precast.JA['Gelus'] = sets.precast.JA['Provoke'] 
    sets.precast.JA['Flabra'] = sets.precast.JA['Provoke'] 
    sets.precast.JA['Tellus'] = sets.precast.JA['Provoke']  
    sets.precast.JA['Sulpor'] = sets.precast.JA['Provoke'] 
    sets.precast.JA['Unda'] = sets.precast.JA['Provoke'] 
    sets.precast.JA['Lux'] = sets.precast.JA['Provoke']     
    sets.precast.JA['Tenebrae'] = sets.precast.JA['Provoke'] 
     
    sets.precast.JA['Vallation'] = sets.precast.JA['Provoke'] 
     
    sets.precast.JA['Pflug'] = sets.precast.JA['Provoke'] 
          
    -- Fast cast sets for spells   2844HP FC+80/80
	sets.precast.FC = 
{
    ammo="Staunch Tathlum",--10
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},--20
    body="Rev. Surcoat +2",
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},--30
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},--20
    neck="Moonlight Necklace",--10
    waist="Audumbla Sash",--10
    left_ear="Knightly Earring",--9
    right_ear="Genmei Earring",
    left_ring="Evanescence Ring",--5
    right_ring="Defending Ring",
    back="Moonbeam Cape",
}	-- Total SIRD = 114 -- 64 PDT
     
	sets.precast.FC.DT = 
{ 
    ammo="Staunch Tathlum",--10
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},--20
    body="Rev. Surcoat +2",
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},--30
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},--20
    neck="Moonlight Necklace",--10
    waist="Audumbla Sash",--10
    left_ear="Knightly Earring",--9
    right_ear="Genmei Earring",
    left_ring="Evanescence Ring",--5
    right_ring="Defending Ring",
    back="Moonbeam Cape",
}
	 
    sets.precast.FC.Phalanx = set_combine(sets.precast.FC , {
    head={ name="Odyssean Helm", augments={'Pet: INT+4','Pet: STR+3','Phalanx +2','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},--2
    
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},--5
    legs="Sakpata's Cuisses",--5
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},--5
    }) --+19 with Priwen
	
	sets.precast.FC['Enlight II'] = sets.precast.FC
	sets.precast.FC.Protect = sets.precast.FC
	sets.precast.FC.Shell = sets.precast.FC
	sets.precast.FC.Crusade = sets.precast.FC
         
    sets.precast.FC.Cure = 
{
    ammo="Staunch Tathlum",--10
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},--20
    body="Rev. Surcoat +2",
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},--30
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},--20
    neck="Moonlight Necklace",--10
    waist="Sroda Belt",
    left_ear="Knightly Earring",--9
    right_ear="Odnowa Earring +1",
    left_ring="Evanescence Ring",--5
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}       -- 104 SIRD 35% Healing 
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = 
{
    ammo="Focal Orb",
    head={ name="Valorous Mask", augments={'Weapon skill damage +3%','STR+9','Accuracy+14','Attack+6',}},
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet="Sulev. Leggings +2",
    neck="Caro Necklace",
    waist="Audumbla Sash",
    left_ear="Ishvara Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},
}
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
 
    --Stat Modifier:     73~85% MND  fTP:    1.0
 sets.precast.WS['Requiescat'] = 
{
    ammo="Focal Orb",
    head={ name="Valorous Mask", augments={'Weapon skill damage +3%','STR+9','Accuracy+14','Attack+6',}},
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet="Sulev. Leggings +2",
    neck="Caro Necklace",
    waist="Audumbla Sash",
    left_ear="Ishvara Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Karieyh Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},
}
    
   --Stat Modifier:  50%MND / 30%STR MAB+    fTP:2.75
    sets.precast.WS['Sanguine Blade'] = 
{
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Sanctity Necklace",
    waist="Soil Belt",
    left_ear="Hermetic Earring",
    right_ear="Friomisi Earring",
    left_ring="Moonbeam Ring",
    right_ring="Karieyh Ring",
    back="Moonbeam Cape",
}	
	
     
    sets.precast.WS['Aeolian Edge'] = 
{
    ammo="Pemphredo Tathlum",
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet="Sulev. Leggings +2",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring={ name="Beithir Ring", augments={'Path: A',}},
    right_ring="Epaminondas's Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},
}	
 
    --Stat Modifier: 50%MND / 50%STR fTP: 1000:4.0 2000:10.25 3000:13.75
    sets.precast.WS['Savage Blade'] = 
{
    ammo="Aurgelmir Orb +1",
    head={ name="Valorous Mask", augments={'Attack+23','Weapon skill damage +4%','STR+7',}},
    body="Sakpata's Plate",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet="Sulev. Leggings +2",
    neck="Caro Necklace",
    waist="Prosilio Belt +1",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring={ name="Beithir Ring", augments={'Path: A',}},
    right_ring="Epaminondas's Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},
}

   --Stat Modifier:  80%DEX  fTP:2.25
   sets.precast.WS['Chant du Cygne'] = 
{	
    ammo="Aurgelmir Orb +1",
    head="Hjarrandi Helm",
    body={ name="Valorous Mail", augments={'Pet: Accuracy+20 Pet: Rng. Acc.+20','Weapon skill damage +4%','Accuracy+14 Attack+14',}},
    hands="Flam. Manopolas +1",
    legs="Sulevi. Cuisses +1",
    feet={ name="Valorous Greaves", augments={'Accuracy+26','Crit. hit damage +4%',}},
    neck="Flame Gorget",
    waist="Grunfeld Rope",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Begrudging Ring",
    right_ring="Regal Ring",
    back="Moonbeam Cape",
}
	
    --Stat Modifier: WS damage + 30/31%   2211DMG maxaggro
    sets.precast.WS['Atonement'] = 
{
	ammo="Paeapua", --2
    head={ name="Loess Barbuta +1", augments={'Path: A',}},--24
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --20
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},--9
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},--9
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},--9
    neck="Moonlight Necklace",--10
    waist="Creed Baudrier",--5
    left_ear="Cryptic Earring",--4
    right_ear="Friomisi Earring",--2
    left_ring="Provocare Ring",--5
    right_ring="Supershear Ring",--5
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},--10
}
           
    ------------------------------------------------------------------------------------------------
    -----------------------------------------Midcast sets-------------------------------------------
    ------------------------------------------------------------------------------------------------
    sets.midcast.FastRecast = 
{
    ammo="Crepuscular Pebble",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs="Nyame Flanchard",
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Bathy Choker +1",
    waist="Creed Baudrier",
    left_ear="Odnowa Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}
	
    -- Divine Skill 590/594 142 Acc
    sets.midcast.Divine = 
{
    ammo="Crepuscular Pebble",
    head="Hjarrandi Helm",
    body="Rev. Surcoat +2",
    hands="Flam. Manopolas +1",
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Cab. Leggings +3", augments={'Enhances "Guardian" effect',}},
    neck="Deviant Necklace",
    waist="Luminary Sash",
    left_ear="Mache Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Begrudging Ring",
    right_ring="Regal Ring",
    back="Moonbeam Cape",
}

    sets.midcast.Divine.DT = 
{
    ammo="Crepuscular Pebble",
    head="Hjarrandi Helm",
    body="Rev. Surcoat +2",
    hands="Flam. Manopolas +1",
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Deviant Necklace",
    waist="Audumbla Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back="Moonbeam Cape",
}

	
	--skill 401/402
	sets.midcast['Enhancing Magic'] =
{
    ammo="Crepuscular Pebble",
    head="Hjarrandi Helm",
    body="Rev. Surcoat +2",
    hands="Flam. Manopolas +1",
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Deviant Necklace",
    waist="Audumbla Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back="Moonbeam Cape",

}

	sets.midcast.MAB = 
{
    ammo="Crepuscular Pebble",
    head="Hjarrandi Helm",
    body="Rev. Surcoat +2",
    hands="Flam. Manopolas +1",
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Deviant Necklace",
    waist="Audumbla Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back="Moonbeam Cape",
}
     
    sets.midcast.Flash = 
{
    ammo="Paeapua", --2
    head={ name="Loess Barbuta +1", augments={'Path: A',}},--24
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --20
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},--9
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},--9
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},--9
    neck="Moonlight Necklace",--10
    waist="Creed Baudrier",--5
    left_ear="Cryptic Earring",--4
    right_ear="Friomisi Earring",--2
    left_ring="Provocare Ring",--5
    right_ring="Supershear Ring",--5
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},--10
}	

	sets.midcast.Flash.SIRD = {ammo="Staunch Tathlum",--10
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},--20
    body="Rev. Surcoat +2",
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},--30
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},--20
    neck="Moonlight Necklace",--10
    waist="Audumbla Sash",--10
    left_ear="Knightly Earring",--9
    right_ear="Genmei Earring",
    left_ring="Evanescence Ring",--5
    right_ring="Defending Ring",
    back="Moonbeam Cape",}

    sets.midcast.Flash.DT = 
{
    ammo="Paeapua", --2
    head={ name="Loess Barbuta +1", augments={'Path: A',}},--24
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --20
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},--9
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},--9
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},--9
    neck="Moonlight Necklace",--10
    waist="Creed Baudrier",--5
    left_ear="Cryptic Earring",--4
    right_ear="Friomisi Earring",--2
    left_ring="Provocare Ring",--5
    right_ring="Supershear Ring",--5
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},--10
}	
         
    sets.midcast.Enlight = sets.midcast.Divine --+95 accu
    sets.midcast['Enlight II'] = sets.midcast.Enlight--+142 accu (+2 acc each 20 divine skill)
     
    --Max HP+ set for reprisal 3951HP / war so 7902+ damage reflect before it off (8k+ with food)
    sets.midcast.Reprisal =	
{
    ammo="Crepuscular Pebble",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},
    legs="Nyame Flanchard",
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Bathy Choker +1",
    waist="Creed Baudrier",
    left_ear="Odnowa Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}
     
    --Phalanx skill 386/386 = 31/31  + phalanx + 30/31 total 61/62
    sets.midcast.Phalanx = 
{
    head={ name="Odyssean Helm", augments={'Pet: INT+4','Pet: STR+3','Phalanx +2','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},--2
    
    hands={ name="Souv. Handsch. +1", augments={'HP+65','STR+12','Accuracy+13',}},--5
    legs="Sakpata's Cuisses",--5
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},--5
}
     
    sets.midcast.Banish = 
{
    ammo="Pemphredo Tathlum",
    head="Wh. Rarab Cap +1",
    body={ name="Odyss. Chestplate", augments={'Pet: "Subtle Blow"+9','Pet: Mag. Acc.+13 Pet: "Mag.Atk.Bns."+13','"Treasure Hunter"+1',}},
    hands={ name="Founder's Gauntlets", augments={'STR+10','Attack+15','"Mag.Atk.Bns."+15','Phys. dmg. taken -5%',}},
    legs={ name="Odyssean Cuisses", augments={'Pet: "Dbl.Atk."+1 Pet: Crit.hit rate +1','AGI+14','"Treasure Hunter"+2',}},
    feet={ name="Founder's Greaves", augments={'VIT+10','Accuracy+15','"Mag.Atk.Bns."+15','Mag. Evasion+15',}},
    neck="Eddy Necklace",
    waist="Chaac Belt",
    left_ear="Crematio Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring +1",
    right_ring="Fenian Ring",
    back={ name="Rudianos's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}},
}
	
	
    sets.midcast['Banish II'] = set_combine(sets.midcast.MAB, {right_ring="Fenian Ring"})
     
    sets.midcast.Holy = sets.midcast.MAB
    sets.midcast['Holy II'] = sets.midcast.Holy
     
    sets.midcast.Crusade = 
{
    ammo="Staunch Tathlum",--10
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},--20
    body="Rev. Surcoat +2",
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},--30
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},--20
    neck="Moonlight Necklace",--10
    waist="Creed Baudrier",
    left_ear="Knightly Earring",--9
    right_ear="Odnowa Earring +1",
    left_ring="Evanescence Ring",--5
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}
     
-- Cure1=120; Cure2=266; Cure3=600; Cure4=1123; cure potency caps at 50/50% received caps at 32/30%. sans signet 
    sets.midcast.Cure = 
{
    ammo="Staunch Tathlum",--10
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},--20
    body="Rev. Surcoat +2",
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},--30
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},--20
    neck="Moonlight Necklace",--10
    waist="Sroda Belt",
    left_ear="Knightly Earring",--9
    right_ear="Odnowa Earring +1",
    left_ring="Evanescence Ring",--5
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}	

    sets.midcast.Cure.DT = 
{
   ammo="Staunch Tathlum",--10
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},--20
    body="Rev. Surcoat +2",
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},--30
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},--20
    neck="Moonlight Necklace",--10
    waist="Sroda Belt",
    left_ear="Knightly Earring",--9
    right_ear="Odnowa Earring +1",
    left_ring="Evanescence Ring",--5
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}
-- 630 HP (curecheat)
	sets.self_healing =
{
    ammo="Staunch Tathlum",--10
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},--20
    body="Rev. Surcoat +2",
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},--30
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},--20
    neck="Moonlight Necklace",--10
    waist="Sroda Belt",
    left_ear="Knightly Earring",--9
    right_ear="Odnowa Earring +1",
    left_ring="Evanescence Ring",--5
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}
	
	sets.self_healing.DT =
{
    ammo="Staunch Tathlum",--10
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},--20
    body="Rev. Surcoat +2",
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},--30
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},--20
    neck="Moonlight Necklace",--10
    waist="Sroda Belt",
    left_ear="Knightly Earring",--9
    right_ear="Odnowa Earring +1",
    left_ring="Evanescence Ring",--5
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}

    sets.midcast.Protect = 
{
    ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands="Sakpata's Gauntlets",
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Mendi. Earring",
    right_ear="Knightly Earring",
    left_ring="Evanescence Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}
    sets.midcast.Shell = 
{
    ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands="Sakpata's Gauntlets",
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Mendi. Earring",
    right_ear="Knightly Earring",
    left_ring="Evanescence Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}
	sets.midcast.Raise = 
{
    ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands="Sakpata's Gauntlets",
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Mendi. Earring",
    right_ear="Knightly Earring",
    left_ring="Evanescence Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}	
    sets.midcast.Stun = sets.midcast.Flash
	
	--Spell interupt down (pro shell raise)104/102
	sets.SID =
{--SIRD/DT/Enmity
    ammo="Staunch Tathlum",--10/2/0
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},--20/0/5
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},--0/10/20
    hands="Sakpata's Gauntlets",--0/8/0
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},--30/0/0
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},--20/0/0
    neck="Moonlight Necklace",--15/0/15
    waist="Sroda Belt",
    left_ear="Knightly Earring",--9/0/0
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},--0/3/0
    left_ring="Evanescence Ring",--5/0/0
    right_ring="Moonlight Ring",--0/5/0
    back="Moonbeam Cape",--0/5/0   3051HP unbuffed
}

---------- NIN Spell	--------------
	sets.midcast.Utsusemi = 
{
    ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands="Sakpata's Gauntlets",
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Mendi. Earring",
    right_ear="Knightly Earring",
    left_ring="Evanescence Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}

sets.midcast.Utsusemi.SIRD = {ammo="Staunch Tathlum",--10
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},--20
    body="Rev. Surcoat +2",
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},--30
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},--20
    neck="Moonlight Necklace",--10
    waist="Audumbla Sash",--10
    left_ear="Knightly Earring",--9
    right_ear="Genmei Earring",
    left_ring="Evanescence Ring",--5
    right_ring="Defending Ring",
    back="Moonbeam Cape",}

	
---------- BLU Spell	--------------
    sets.midcast['Geist Wall'] =
{
    ammo="Paeapua", --2
    head={ name="Loess Barbuta +1", augments={'Path: A',}},--24
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --20
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},--9
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},--9
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},--9
    neck="Moonlight Necklace",--15
    waist="Creed Baudrier",--5
    left_ear="Cryptic Earring",--4
    right_ear="Friomisi Earring",--2
    left_ring="Provocare Ring",--5
    right_ring="Supershear Ring",--5
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},--10
}

	sets.midcast['Geist Wall'].SIRD = {ammo="Staunch Tathlum",--10
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},--20
    body="Rev. Surcoat +2",
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},--30
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},--20
    neck="Moonlight Necklace",--10
    waist="Audumbla Sash",--10
    left_ear="Knightly Earring",--9
    right_ear="Genmei Earring",
    left_ring="Evanescence Ring",--5
    right_ring="Defending Ring",
    back="Moonbeam Cape",}
	

    sets.midcast['Sheep Song'] = 
{
    ammo="Paeapua", --2
    head={ name="Loess Barbuta +1", augments={'Path: A',}},--24
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --20
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},--9
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},--9
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},--9
    neck="Moonlight Necklace",--15
    waist="Creed Baudrier",--5
    left_ear="Cryptic Earring",--4
    right_ear="Friomisi Earring",--2
    left_ring="Provocare Ring",--5
    right_ring="Supershear Ring",--5
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},--10
}
	sets.midcast['Sheep Song'].SIRD = {ammo="Staunch Tathlum",--10
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},--20
    body="Rev. Surcoat +2",
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},--30
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},--20
    neck="Moonlight Necklace",--10
    waist="Audumbla Sash",--10
    left_ear="Knightly Earring",--9
    right_ear="Genmei Earring",
    left_ring="Evanescence Ring",--5
    right_ring="Defending Ring",
    back="Moonbeam Cape",}

	
	sets.midcast.Soporific = 
{
    ammo="Paeapua", --2
    head={ name="Loess Barbuta +1", augments={'Path: A',}},--24
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --20
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},--9
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},--9
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},--9
    neck="Moonlight Necklace",--15
    waist="Creed Baudrier",--5
    left_ear="Cryptic Earring",--4
    right_ear="Friomisi Earring",--2
    left_ring="Provocare Ring",--5
    right_ring="Supershear Ring",--5
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},--10
}

sets.midcast['Soporific'].SIRD = {ammo="Staunch Tathlum",--10
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},--20
    body="Rev. Surcoat +2",
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},--30
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},--20
    neck="Moonlight Necklace",--10
    waist="Audumbla Sash",--10
    left_ear="Knightly Earring",--9
    right_ear="Genmei Earring",
    left_ring="Evanescence Ring",--5
    right_ring="Defending Ring",
    back="Moonbeam Cape",}

	
	--[[sets.midcast['Stinking Gas'] = 
{
    ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands="Sakpata's Gauntlets",
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Mendi. Earring",
    right_ear="Knightly Earring",
    left_ring="Evanescence Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}]]

    sets.midcast['Blank Gaze'] = {
	ammo="Paeapua", --2
    head={ name="Loess Barbuta +1", augments={'Path: A',}},--24
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --20
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},--9
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},--9
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},--9
    neck="Moonlight Necklace",--15
    waist="Creed Baudrier",--5
    left_ear="Cryptic Earring",--4
    right_ear="Friomisi Earring",--2
    left_ring="Provocare Ring",--5
    right_ring="Supershear Ring",--5
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},--10
	}
	sets.midcast['Blank Gaze'].SIRD = {ammo="Staunch Tathlum",--10
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},--20
    body="Rev. Surcoat +2",
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},--30
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},--20
    neck="Moonlight Necklace",--10
    waist="Audumbla Sash",--10
    left_ear="Knightly Earring",--9
    right_ear="Genmei Earring",
    left_ring="Evanescence Ring",--5
    right_ring="Defending Ring",
    back="Moonbeam Cape",}
	
	
	sets.midcast['Bomb Toss'] = 
{
    ammo="Staunch Tathlum",
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands="Sakpata's Gauntlets",
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Mendi. Earring",
    right_ear="Knightly Earring",
    left_ring="Evanescence Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}
	
	sets.midcast['Jettatura'] = {ammo="Paeapua", --2
    head={ name="Loess Barbuta +1", augments={'Path: A',}},--24
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --20
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},--9
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},--9
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},--9
    neck="Moonlight Necklace",--15
    waist="Creed Baudrier",--5
    left_ear="Cryptic Earring",--4
    right_ear="Friomisi Earring",--2
    left_ring="Provocare Ring",--5
    right_ring="Supershear Ring",--5
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},}--10
	
	sets.midcast['Jettatura'].SIRD = {ammo="Staunch Tathlum",--10
    head={ name="Souv. Schaller +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},--20
    body="Rev. Surcoat +2",
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Founder's Hose", augments={'MND+4','Mag. Acc.+3',}},--30
    feet={ name="Odyssean Greaves", augments={'MND+3','Mag. Acc.+12','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},--20
    neck="Moonlight Necklace",--10
    waist="Audumbla Sash",--10
    left_ear="Knightly Earring",--9
    right_ear="Genmei Earring",
    left_ring="Evanescence Ring",--5
    right_ring="Defending Ring",
    back="Moonbeam Cape",
}

	
	
	
	
	
	
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
	sets.Cover = set_combine(sets.precast.JA['Rampart'], {main="Kheshig Blade", head="Rev. Coronet +3", body="Cab. Surcoat +1"})
    sets.Doom = {legs="Shabti Cuisses +1",left_ring="Eshmun's Ring",right_ring="Eshmun's Ring", waist="Gishdubar Sash"} -- +65%
    sets.Petri = {back="Sand Mantle"} 
	sets.Reraise = {head="Twilight Helm", body="Twilight Mail"}
	sets.Sleep = {neck="Vim Torque +1",}
	sets.Breath =
{
    ammo="Staunch Tathlum",
    head="Hjarrandi Helm",
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs="Sakpata's Cuisses",
    feet={ name="Cab. Leggings +3", augments={'Enhances "Guardian" effect',}},
    neck="Diemer Gorget",
    waist="Flume Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Thureous Earring",
    left_ring="Eihwaz Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}
   
    sets.resting = 
{
    ammo="Staunch Tathlum",
    head="Hjarrandi Helm",
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs="Sakpata's Cuisses",
    feet={ name="Cab. Leggings +3", augments={'Enhances "Guardian" effect',}},
    neck="Diemer Gorget",
    waist="Flume Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Thureous Earring",
    left_ring="Eihwaz Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}
     
    -- Idle sets
    sets.idle = 
{
    ammo="Staunch Tathlum",
    head={ name="Cab. Coronet +3", augments={'Enhances "Iron Will" effect',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Rev. Leggings +3",
    neck="Diemer Gorget",
    waist="Flume Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Thureous Earring",
    left_ring="Eihwaz Ring",
    right_ring="Moonlight Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},
}
 
    sets.idle.Town = 
{		
    ammo="Staunch Tathlum",
    head="Hjarrandi Helm",
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Cab. Leggings +3", augments={'Enhances "Guardian" effect',}},
    neck="Diemer Gorget",
    waist="Flume Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Thureous Earring",
    left_ring="Eihwaz Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}
     
    sets.idle.Weak = 
{
    ammo="Staunch Tathlum",
    head="Hjarrandi Helm",
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs="Sakpata's Cuisses",
    feet={ name="Cab. Leggings +3", augments={'Enhances "Guardian" effect',}},
    neck="Diemer Gorget",
    waist="Flume Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Thureous Earring",
    left_ring="Eihwaz Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}
     
    sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)
	
	sets.HQ =
{
    ammo="Staunch Tathlum",
    head="Hjarrandi Helm",
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs="Sakpata's Cuisses",
    feet={ name="Cab. Leggings +3", augments={'Enhances "Guardian" effect',}},
    neck="Diemer Gorget",
    waist="Flume Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Thureous Earring",
    left_ring="Eihwaz Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}
	

     
    --   Physical
    --     PDT
    --     Aegis
    -- Defense sets
    --   Magical
    --     MDT
    --   Hybrid (on top of either physical or magical)
    --     Repulse  
    --     Reraise
    --     RepulseReraise
    --   Custom
     
    -- sets.Repulse = {back="Repulse Mantle"}
  --3367 HP   
    sets.defense.PDT = 
{
    ammo="Staunch Tathlum",
    head={ name="Cab. Coronet +3", augments={'Enhances "Iron Will" effect',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet="Rev. Leggings +3",
    neck="Diemer Gorget",
    waist="Flume Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Thureous Earring",
    left_ring="Eihwaz Ring",
    right_ring="Moonlight Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},
}
    -- To cap MDT with Shell IV (52/256), need 76/256 in gear. Current gear set is 248/256.
    -- Shellra V can provide 75/256.
    sets.defense.MDT =
{
    ammo="Staunch Tathlum",
    head="Hjarrandi Helm",
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs="Sakpata's Cuisses",
    feet={ name="Cab. Leggings +3", augments={'Enhances "Guardian" effect',}},
    neck="Diemer Gorget",
    waist="Flume Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Thureous Earring",
    left_ring="Eihwaz Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}

	sets.defense.BDT =
{   
	main="Burtgang",
    sub="Aegis",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque +1",
    waist="Creed Baudrier",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Moonlight Ring",
	right_ring="Defending Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10',}},
}

	sets.defense.ResistCharm =
{
    ammo="Staunch Tathlum",
    head="Hjarrandi Helm",
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs="Sakpata's Cuisses",
    feet={ name="Cab. Leggings +3", augments={'Enhances "Guardian" effect',}},
    neck="Diemer Gorget",
    waist="Flume Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Thureous Earring",
    left_ring="Eihwaz Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}	
	
    sets.defense.Ochain = 
{
    ammo="Staunch Tathlum",
    head="Hjarrandi Helm",
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs="Sakpata's Cuisses",
    feet={ name="Cab. Leggings +3", augments={'Enhances "Guardian" effect',}},
    neck="Diemer Gorget",
    waist="Flume Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Thureous Earring",
    left_ring="Eihwaz Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}
         
    sets.defense.Aegis = 
{
    sub="Aegis",
    ammo="Staunch Tathlum",
    head="Hjarrandi Helm",
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Cab. Leggings +3", augments={'Enhances "Guardian" effect',}},
    neck="Diemer Gorget",
    waist="Carrier's Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Thureous Earring",
    left_ring="Eihwaz Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}	
 
    sets.defense.Srivatsa = 
{
    sub={ name="Priwen", augments={'HP+50','Mag. Evasion+50','Damage Taken -3%',}},
    ammo="Staunch Tathlum",
    head="Hjarrandi Helm",
    body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}},
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Cab. Leggings +3", augments={'Enhances "Guardian" effect',}},
    neck="Diemer Gorget",
    waist="Flume Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Thureous Earring",
    left_ring="Eihwaz Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}
 
--Doom/RR",
     
    sets.defense.PDT.Reraise = set_combine(sets.defense.PDT, sets.Reraise)
    sets.defense.Aegis.Reraise = set_combine(sets.defense.Aegis, sets.Reraise)
    sets.defense.MDT.Reraise = set_combine(sets.defense.MDT, sets.Reraise)
    sets.defense.Aegis.Reraise = set_combine(sets.defense.Aegis, sets.Reraise)
     
    sets.defense.PDT.Doom = set_combine(sets.defense.PDT, sets.Doom)
    sets.defense.Aegis.Doom = set_combine(sets.defense.Aegis, sets.Doom)
    sets.defense.MDT.Doom = set_combine(sets.defense.PDT, sets.Doom)
    sets.defense.Aegis.Doom = set_combine(sets.defense.Aegis, sets.Doom)
     
    sets.Kiting = {legs="Carmine Cuisses +1"}

 
 
    --------------------------------------
    -- Engaged sets
    --------------------------------------
     
    sets.engaged = --1124 / 1264 avec enlight up
{
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Flam. Gambieras +2",
    neck="Lissome Necklace",
    waist="Kentarch Belt +1",
    left_ear="Telos Earring",
    right_ear="Brutal Earring",
    left_ring="Regal Ring",
    right_ring="Flamma Ring",
    back="Moonbeam Cape",
}
 
    sets.engaged.Acc = --1179 / 1315 avec enlight up
{
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Flam. Gambieras +2",
    neck="Lissome Necklace",
    waist="Kentarch Belt +1",
    left_ear="Telos Earring",
    right_ear="Brutal Earring",
    left_ring="Regal Ring",
    right_ring="Flamma Ring",
    back="Moonbeam Cape",
}

	sets.engaged.Tank = {ammo="Staunch Tathlum",
    head={ name="Cab. Coronet +3", augments={'Enhances "Iron Will" effect',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet="Rev. Leggings +3",
    neck="Diemer Gorget",
    waist="Flume Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Thureous Earring",
    left_ring="Eihwaz Ring",
    right_ring="Moonlight Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Phys. dmg. taken-10%',}},
	
	}
end
------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------Job-specific hooks that are called to process player actions at specific points in time-----------
------------------------------------------------------------------------------------------------------------------------------------------
 

 
-- Modify the default idle set after it was constructed.

	
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
     if player.hpp < 100 then
		add_to_chat(123,"Get ready "..player.name.." is less than 50%, PREPAIR HEALS!")
	end
	
    return idleSet
end
 
 
 
function customize_defense_set(defenseSet)
    if state.ExtraDefenseMode.value ~= 'None' then
        defenseSet = set_combine(defenseSet, sets[state.ExtraDefenseMode.value])
    end
     
    if state.EquipShield.value == true then
        defenseSet = set_combine(defenseSet, sets[state.DefenseMode.current .. 'Shield'])
    end
     
    return defenseSet
end
 
-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-- General hooks for change events.
-------------------------------------------------------------------------------------------------------------------
 
-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)
 refine_various_spells(spell, action, spellMap, eventArgs)
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
Enmity = S{'Geist Wall', 'Sheep Song', 'Soporific', "Jettatura", "Blank Gaze"}
	if Enmity:contains (spell.english) and state.CastingMode == 'SIRD' then
		equip(sets.SID)
	end
	if spell.english == "Cure" and state.CastingModes == 'SIRD' then
		equip(sets.SID)
	end
 
end
-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
 
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if state.Buff[spell.english] ~= nil then
        state.Buff[spell.english] = not spell.interrupted or buffactive[spell.english]
    end
end
-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
	
 
    return idleSet
end
-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    return meleeSet
end
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
 
        --print( buff )
        --print( state.Buff[buff] )
 
-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_defense_mode()
end
-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
    if field == 'HybridDefenseMode' then
        classes.CustomDefenseGroups:clear()
        classes.CustomDefenseGroups:append(new_value)
    end
end
-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
	
 
end
function update_defense_mode()
    if player.equipment.main == 'Burtgang' and not classes.CustomDefenseGroups:contains('Burtgang') then
        classes.CustomDefenseGroups:append('Burtgang')
    end
     
    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
        if player.equipment.sub and not player.equipment.sub:endswith('Shield') and
        player.equipment.sub ~= 'Aegis' and player.equipment.sub ~= 'Ochain' then
        state.CombatForm = 'DW'
        else
        state.CombatForm = nil
        end
    end
end
function linebreak()
add_to_chat(167, '!!!!****___...---~~~"""~~~---...___****!!!!')
end
function job_buff_change(buff, gain)
		if buff == 'Phalanx' and not gain then
			linebreak()
			add_to_chat(167, '-------Phalanx just Expired!!-------')
			linebreak()
			if state.autobuff == true and not player.engaged then
				send_command('input /ma "Phalanx" <me>')
			end
		
		end
		if buff == 'Majesty' and not gain then
			send_command('input /ja "Majesty" <me>')
		end
		
		if buff == 'Enmity Boost' and not gain then
			send_command('input /ma "Crusade" <me>')
		end
		
		
			
        
		if buff == "Cover" then
                if gain then
                        equip (sets.Cover)
                        disable('Body','Head')
                else
                        enable('Body','Head')
                        handle_equipping_gear(player.status)
                end
		elseif buff == "doom" then
                if gain then           
                        equip(sets.Doom)
                        send_command('@input /p Doomed, please Cursna.')
                        send_command('@input /item "Holy Water" <me>')					
                        disable('legs','ring1','ring2','waist')
                elseif not gain and not player.status == "Dead" and not player.status == "Engaged Dead" then
                        enable('legs','ring1','ring2','waist')
                        send_command('input /p Doom removed, Thank you.')
                        handle_equipping_gear(player.status)
                else
                        enable('legs','ring1','ring2','waist')
                        send_command('input /p '..player.name..' is no longer Doom Thank you !')
                end
		--[[elseif buff == "petrification" then
            if gain then    
				equip(sets.Petri)
                disable('back')				
                send_command('@input /p Petrification, please Stona.')		
			else
                enable('back')
                send_command('input /p '..player.name..' is no longer Petrify Thank you !')
			end]]
		elseif buff == "Charm" then
			if gain then  			
                send_command('@input /p Charmd, please Sleep me.')		
			else	
                send_command('input /p '..player.name..' is no longer Charmed, please wake me up!')
			end
		
				
				
				
				
				--[[elseif buff == "paralysis" then
                 if gain then
                        
                        send_command('@input /p '..player.name..' Paralysed, please Paralyna.')
						send_command('@input /item "Remedy" <me>')	
                else                        
                        send_command('input /p '..player.name..' is no longer Paralysed Thank you !')
                    end]]	

        end
	for index,value in pairs(buffWatcher.watchList) do
		if index==buff then
			buffWatch()
			break
		end
	end
	--]]
	
end




-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 7)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 7)
    elseif player.sub_job == 'RDM' then
        set_macro_page(9, 7)
    elseif player.sub_job == 'RUN' then
        set_macro_page(8, 7)
	elseif player.sub_job == 'WAR' then
        set_macro_page(1, 7)	
	elseif player.sub_job == 'BLU' then
        set_macro_page(2, 10)	
    else
        set_macro_page(1, 7)
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
  if spellMap == 'Cure' and spell.target.type == 'SELF' then
    if options.CastingModes.value == 'DT' then
      equip(sets.self_healing.DT)
    else
      equip(sets.self_healing)
  end
end
  end


function job_self_command(cmdParams, eventArgs)
if cmdParams[1] == 'buffWatcher' then
      buffWatch(cmdParams[2],cmdParams[3])
  end
  if cmdParams[1] == 'stopBuffWatcher' then
      stopBuffWatcher()
  end
end

function check_moving()
    if state.DefenseMode.value == 'None'  and state.Kiting.value == false then
        if state.Auto_Kite.value == false and moving then
            state.Auto_Kite:set(true)
        elseif state.Auto_Kite.value == true and moving == false then
            state.Auto_Kite:set(false)
        end
    end
end

-- Curing rules
function refine_various_spells(spell,action,spell_map,event_args)
 
  cures = S{'Cure','Cure II','Cure III','Cure IV'}
  banish = S{'Banish','Banish II'}
      if not cures:contains(spell.english) and not banish:contains(spell.english) then
        return
    end 

    local newSpell = spell.english
    local spell_recasts = windower.ffxi.get_spell_recasts()
    local cancelling = 'All '..spell.english..' spells are on cooldown. Cancelling spell casting.'

    if spell_recasts[spell.recast_id] > 0 then
        if cures:contains(spell.english) then
			if cures:contains(spell.english) and state.CastingMode == 'SIRD' then
			equip(sets.SID)
			end
            if spell.english == 'Cure' then
                eventArgs.cancel = true
            return
            elseif spell.english == 'Cure IV' then
                newSpell = 'Cure III'
            elseif spell.english == 'Cure III' then
                newSpell = 'Cure II'
            elseif spell.english == 'Cure II' then
                newSpell = 'Cure'
            end 
        elseif banish:contains(spell.english) then
            if spell.english == 'Banish' then
                add_to_chat(122,cancelling)
                eventArgs.cancel = true
            return
            elseif spell.english == 'Banish II' then
                newSpell = 'Banish'
            end
        end
    end
        if newSpell ~= spell.english then
            send_command('@input /ma "'..newSpell..'" '..tostring(spell.target.raw))
            return
        end
    end

function gearinfo(cmdParams, eventArgs)
if state.GI == true then
    if cmdParams[1] == 'gearinfo' then
        if type(tonumber(cmdParams[2])) == 'number' then
            if tonumber(cmdParams[2]) ~= DW_needed then
            DW_needed = tonumber(cmdParams[2])
            DW = true
            end
        elseif type(cmdParams[2]) == 'string' then
            if cmdParams[2] == 'false' then
                DW_needed = 0
                DW = false
            end
        end
        if type(tonumber(cmdParams[3])) == 'number' then
            if tonumber(cmdParams[3]) ~= Haste then
                Haste = tonumber(cmdParams[3])
            end
        end
        if type(cmdParams[4]) == 'string' then
            if cmdParams[4] == 'true' then
                moving = true
            elseif cmdParams[4] == 'false' then
                moving = false
            end
        end
        if not midaction() then
            job_update()
        end
    end
end
end
-- -------------------------------------Aspir,Sleep/ga Nuke's refine rules (thanks Asura.Vafruvant for this code)-----------------------------------
-- function refine_various_spells(spell, action, spellMap, eventArgs)

	-- Enmity = S{'Geist Wall', 'Sheep Song', 'Soporific'}
 
    -- if not Enmitys:contains(spell.english) then
        -- return
    -- end
 
    -- local newSpell = spell.english
    -- local spell_recasts = windower.ffxi.get_spell_recasts()
    -- local cancelling = 'All '..spell.english..' spells are on cooldown. Cancelling spell casting.'
  
    -- if spell_recasts[spell.recast_id] > 0 then
        -- if aspirs:contains(spell.english) then
            -- if spell.english == 'Geist Wall' then
                -- add_to_chat(122,cancelling)
                -- eventArgs.cancel = true
                -- return
				-- elseif spell.english == 'Geist Wall' then
                -- newSpell = 'Sheep Song'
				-- elseif spell.english == 'Sheep Song' then
                -- newSpell = 'Soporific'

            -- end         
 
        -- end
    -- end
  
    -- if newSpell ~= spell.english then
        -- send_command('@input /ma "'..newSpell..'" '..tostring(spell.target.raw))
        -- eventArgs.cancel = true
        -- return
    -- end
-- end