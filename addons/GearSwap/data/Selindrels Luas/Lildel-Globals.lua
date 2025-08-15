include ('MoveGear.lua')

--Place for settings and custom functions to work across one characters, all jobs.
latency = .75

--If this is set to true it will prevent you from casting shadows when you have more up than that spell would generate.
conserveshadows = false

--Display related settings.
state.DisplayMode = M(true, 'Display Mode') --Set this to false if you don't want to display modes at the bottom of your screen.
--Uncomment the settings below and change the values to edit the display's look.
--displayx = 3
--displayy = 1062
--displayfont = 'Arial'
--displaysize = 12
--displaybold = true
--displaybg = 0
--displaystroke = 2
--displaytransparancy = 192
--state.DisplayColors = {
    -- h='\\cs(255, 0, 0)', -- Red for active booleans and non-default modals
    -- w='\\cs(255,255,255)', -- White for labels and default modals
    -- n='\\cs(192,192,192)', -- White for labels and default modals
    -- s='\\cs(96,96,96)' -- Gray for inactive booleans
--}

--Options for automation.
state.ReEquip 		  		= M(true, 'ReEquip Mode')		 --Set this to false if you don't want to equip your current Weapon set when you aren't wearing any weapons.
state.AutoArts 		  		= M(true, 'AutoArts') 		 --Set this to false if you don't want to automatically try to keep up Solace/Arts.
state.AutoLockstyle	 	    = M(true, 'AutoLockstyle Mode') --Set this to false if you don't want gearswap to automatically lockstyle on load and weapon change.
state.CancelStoneskin 		= M(true, 'Cancel Stone Skin') --Set this to false if you don't want to automatically cancel stoneskin when you're slept.
state.SkipProcWeapons 		= M(true, 'Skip Proc Weapons') --Set this to false if you want to display weapon sets fulltime rather than just Aby/Voidwatch.
state.NotifyBuffs	  		= M(false, 'Notify Buffs') 	 --Set this to true if you want to notify your party when you recieve a specific buff/debuff. (List Below)

--[[Binds you may want to change.
	Bind special characters.
	@ = Windows Key
	% = Works only when text bar not up.
	$ = Works only when text bar is up.
	^ = Control Key
	! = Alt Key
	~ = Shift Key
	# = Apps Key
]]

send_command('bind !@^f7 gs c toggle AutoWSMode') --Turns auto-ws mode on and off.
send_command('bind !^f7 gs c toggle AutoFoodMode') --Turns auto-ws mode on and off.
send_command('bind f7 gs c cycle Weapons') --Cycle through weapons sets.
send_command('bind @f8 gs c toggle AutoNukeMode') --Turns auto-nuke mode on and off.
send_command('bind ^f8 gs c toggle AutoStunMode') --Turns auto-stun mode off and on.
send_command('bind !f8 gs c toggle AutoDefenseMode') --Turns auto-defense mode off and on.
send_command('bind ^@!f8 gs c toggle AutoTrustMode') --Summons trusts automatically.
send_command('bind @pause gs c cycle AutoBuffMode') --Automatically keeps certain buffs up, job-dependant.
send_command('bind @scrolllock gs c cycle Passive') --Changes offense settings such as accuracy.
send_command('bind f9 gs c cycle OffenseMode') --Changes offense settings such as accuracy.
send_command('bind ^f9 gs c cycle HybridMode') --Changes defense settings for melee such as PDT.
send_command('bind @f9 gs c cycle RangedMode') --Changes ranged offense settings such as accuracy.
send_command('bind !f9 gs c cycle WeaponskillMode') --Allows automatic weaponskilling if the job is setup to handle it.
send_command('bind f10 gs c set DefenseMode Physical') --Turns your physical defense set on.
send_command('bind ^f10 gs c cycle PhysicalDefenseMode') --Changes your physical defense set.
send_command('bind !f10 gs c toggle Kiting') --Keeps your kiting gear on..
send_command('bind f11 gs c set DefenseMode Magical') --Turns your magical defense set on.
send_command('bind ^f11 gs c cycle MagicalDefenseMode') --Changes your magical defense set.
send_command('bind @f11 gs c cycle CastingMode') --Changes your castingmode options such as magic accuracy.
send_command('bind !f11 gs c cycle ExtraMeleeMode') --Adds another set layered on top of your engaged set.
send_command('bind ^f12 gs c cycle ResistDefenseMode') --Changes your resist defense set.
send_command('bind f12 gs c set DefenseMode Resist') --Turns your resist defense set on.
send_command('bind @f12 gs c cycle IdleMode') --Changes your idle mode options such as refresh.
send_command('bind !f12 gs c reset DefenseMode') --Turns your defensive mode off.
send_command('bind ^@!f12 gs reload') --Reloads gearswap.
send_command('bind pause gs c update user') --Runs a quick check to make sure you have the right gear on and checks variables.
send_command('bind ^@!pause gs org') --Runs organizer.
send_command('bind ^@!backspace gs c buffup') --Buffup macro because buffs are love.
send_command('bind ^r gs c weapons Default') --Requips weapons and gear.
send_command('bind ^z gs c toggle Capacity') --Keeps capacity mantle on and uses capacity rings.
send_command('bind ^y gs c toggle AutoCleanupMode') --Uses certain items and tries to clean up inventory.
send_command('bind ^t gs c cycle treasuremode') --Toggles hitting htings with your treasure hunter set.
send_command('bind !t input /target <bt>') --Targets the battle target.
send_command('bind ^o fillmode') --Lets you see through walls.
send_command('bind !^@s gs c autoshadowmode') --Auto shadow mode.
send_command('bind ^a gs c toggle MaintainAftermath') -- Maintain Aftermaith gear. 
send_command('bind @m gs c mount Omega')

send_command('input //lua load porterpacker')
send_command('alias getslips send Lildel "\/\/ exec getslip.txt"')
send_command('alias putslips send Lildel "\/\/ exec putslip.txt"')
send_command('bind ^numpad1 send Picodelgallo "\/\/ exec PicoGeo/bogmalaise.txt"')
send_command('bind ^numpad2 send Picodelgallo "\/\/ exec PicoGeo/malaise.txt"')
send_command('bind ^numpad3 send Picodelgallo /ma "Cure" Phelt')
send_command('bind ^numpad4 send Picodelgallo /ma "cure" Deemaltau')
send_command('bind ^delete send Picodelgallo /ma "Cure IV" Lildel')
send_command('bind ^end send Picodelgallo /ma "Cure IV" Picodelgallo')
send_command('alias getnintools send Lildel "\/\/ exec getnintools.txt')
send_command('alias putnintools send Lildel "\/\/ exec putnintools.txt')
send_command('alias fisherman send Lildel "\/\/ exec Crafting/fisherman.txt"')
send_command('alias tite send Lildel "\/\/ exec tite.txt"; wait 1; send Lildel "\/\/ exec tite.txt"')
send_command('bind  input /item "Smouldering lamp" <stnpc>')
send_command('alias cc input /target <stal>; con sta go Picogelgallo cure')
send_command('alias cme input //send Picodelgallo /ma "Cure VI" <p1>')
send_command('bind ^numpad1 //send Picodelgallo /ma "Curaga III" <p1>')
send_command('alias pstona //send Picodelgallo /ma "Stona" <p1>')
send_command('alias ppara //send Picodelgallo /ma "Paralyna" <p1>')

--send_command('lua equipviewer position 1500 900')

send_command('alias all //send @all')


send_command('alias packmnk input //po pack export_Lildel_mnk')
send_command('alias packrdm input //po pack export_lildel_rdm')
send_command('alias packnin input //po pack export_lildel_nin')
send_command('alias packblu input //po pack export_lildel_blu')
send_command('alias packcor input //po pack export_lildel_cor')
send_command('alias packdrg input //po pack export_lildel_drg')
send_command('alias packgeo input //po pack export_lildel_geo')
send_command('alias packblu input //po pack export_lildel_blu')
send_command('alias packpld input //po pack export_lildel_pld')
send_command('alias packrun input //po pack export_lildel_run')
send_command('alias packsam input //po pack export_lildel_sam')
send_command('alias packsmn input //po pack export_lildel_smn')
send_command('alias packthf input //po pack export_lildel_thf')
send_command('alias packdnc input //po pack export_lildel_dnc')
send_command('alias packbrd input //po pack export_lildel_brd')
send_command('alias packbst input //po pack export_lildel_bst')
send_command('alias packproc input //po pack export_lildel_proc')
send_command('alias packpup input //po pack export_lildel_pup')
send_command('alias packwar input //po pack export_Lildel_war')

send_command('alias unpackmnk input //po unpack export_Lildel_mnk')
send_command('alias unpackrdm input //po unpack export_lildel_rdm')
send_command('alias unpacknin input //po unpack export_lildel_nin')
send_command('alias unpackblu input //po unpack export_lildel_blu')
send_command('alias unpackcor input //po unpack export_lildel_cor')
send_command('alias unpackdrg input //po unpack export_lildel_drg')
send_command('alias unpackgeo input //po unpack export_lildel_geo')
send_command('alias unpackblu input //po unpack export_lildel_blu')
send_command('alias unpackpld input //po unpack export_lildel_pld')
send_command('alias unpackrun input //po unpack export_lildel_run')
send_command('alias unpacksam input //po unpack export_lildel_sam')
send_command('alias unpacksmn input //po unpack export_lildel_smn')
send_command('alias unpackthf input //po unpack export_lildel_thf')
send_command('alias unpackdnc input //po unpack export_lildel_dnc')
send_command('alias unpackbrd input //po unpack export_lildel_brd')
send_command('alias unpackbst input //po unpack export_lildel_bst')
send_command('alias unpackproc input //po unpack export_lildel_proc')
send_command('alias unpackpup input //po unpack export_lildel_pup')
send_command('alias unpackwar input //po unpack export_Lildel_war')
send_command('alias getpops send Lildel "\/\/ exec ShoalCNMs.txt"')

send_command('bind %f send Picodelgallo hb follow Lildel')
send_command('bind !f send Picodelgallo hb follow off')
send_command('bind ^f send Lildel input /follow Picodelgallo')
send_command('bind ^m send Picodelgallo input /mount golden bomb')
send_command('bind %m send Lildel input /mount byakko')
send_command('alias macro /item "Macrocosmic Orb" <stnpc>')
send_command('bind %d send @all input /dismount')
send_command('alias warp send @everyone /warp')

    send_command('bind %numpad1 input //fillmode 1')
	send_command('bind %numpad2 input //fillmode 0')
	send_command('alias return input //sw po all return')
	send_command('alias assault input //sw po all assault')
	send_command('alias bolters input //send Picodelgallo /ja "Bolter\'s Roll" <me>')
	
	send_command('bind %f send @others input //hb follow Lildel')
    send_command('bind !f send @others input //hb follow off')

--Teleport Binds and alias'
send_command('alias aqufim //send @all //hp qufim')
send_command('alias amis //send @all //hp misareaux Coast')
send_command('alias ruah //send Lildel //hp Ru\'Lude Gardens ah')


send_command('alias ww4 //send Lildel //hp Windurst Waters 4')
send_command('alias ea2 //send Lildel //hp Eastern Adoulin 2')
send_command('alias todo //send Lildel "\/\/ exec todo.txt"')
send_command('alias cure //send Picodelgallo /ma "Cure" <Lildel>')
include ('PicoGeoBinds.lua')

NotifyBuffs = S{'doom','petrification'}

bayld_items = {'Tlalpoloani','Macoquetza','Camatlatia','Icoyoca','Tlamini','Suijingiri Kanemitsu',
'Zoquittihuitz','Quauhpilli Helm','Chocaliztli Mask','Xux Hat','Quauhpilli Gloves','Xux Trousers',
'Chocaliztli Boots','Maochinoli','Xiutleato','Hatxiik','Kuakuakait','Azukinagamitsu','Atetepeyorg',
'Kaquljaan','Ajjub Bow','Baqil Staff','Ixtab','Tamaxchi','Otomi Helm','Otomi Gloves','Kaabnax Hat',
'Kaabnax Trousers','Ejekamal Mask','Ejekamal Boots','Quiahuiz Helm','Quiahuiz Trousers','Uk\'uxkaj Cap'}

--[[ List of all Bayld Items.
bayld_items = {'Tlalpoloani','Macoquetza','Camatlatia','Icoyoca','Tlamini','Suijingiri Kanemitsu','Zoquittihuitz',
'Quauhpilli Helm','Chocaliztli Mask','Xux Hat','Quauhpilli Gloves','Xux Trousers','Chocaliztli Boots','Maochinoli',
'Hatxiik','Kuakuakait','Azukinagamitsu','Atetepeyorg','Kaquljaan','Ajjub Bow','Baqil Staff','Ixtab','Otomi Helm',
'Otomi Gloves','Kaabnax Hat','Kaabnax Trousers','Ejekamal Mask','Ejekamal Boots','Quiahuiz Helm','Quiahuiz Trousers',
'Uk\'uxkaj Cap'}
]]




