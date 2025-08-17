-- Summoner Binds
--------------------------------------------------------------------------

-- Global Binds

--------------------------------------------------------------------------

send_command('bind numpad. setkey escape down;wait .1;setkey escape up')
	
send_command('bind numpad7 setkey Lshift down;wait .05;setkey tab down;wait .05;setkey tab up;wait .05;setkey Lshift up')
	
send_command('bind numpad9 setkey tab down;wait .05;setkey tab up')

send_command('alias wima input /checkparam <me>')

send_command('bind @r input /item "Remedy" <me>')
send_command('alias rem input /item "Remedy" <me>')

send_command('alias phelt input /assist "Phelt"')
send_command('alias mina input /assist "Minamori"')
send_command('alias jorm input /assist "Jormundr"')
send_command('alias corrie input /assist "Salonia"')
send_command('alias whitte input /assist "Whitte"')
send_command('alias pawnee input /assist "Pawneeskidi"')
send_command('alias cherished input /assist "Cherished"')
send_command('alias lady input /assist "Ladyhaha"')
send_command('alias blood input /assist "Bloodsman"')

send_command('alias sl input /item "Smouldering Lamp" <t>')

--------------------------------------------------------------------------

-- Binds to call Avatars

--------------------------------------------------------------------------

--Ifrit
windower.send_command('alias ifrit input /ma "Ifrit" <me>')
windower.send_command('bind @i input /ma "Ifrit" <me>')
--Shiva
windower.send_command('alias shiva input /ma "Shiva" <me>')
windower.send_command('bind @s input /ma "Shiva" <me>')
--Carbuncle
windower.send_command('alias carby input /ma "Carbuncle" <me>')
windower.send_command('bind @c input /ma "Carbuncle" <me>')
--Fenrir
windower.send_command('alias fenrir input /ma "Fenrir" <me>')
windower.send_command('bind @f input /ma "Fenrir" <me>')
--Titan
windower.send_command('alias titan input /ma "Titan" <me>')
windower.send_command('bind @t input /ma "Titan" <me>')
--Leviathan
windower.send_command('alias levy input /ma "Leviathan" <me>')
windower.send_command('bind @l input /ma "Leviathan" <me>')
--Garuda
windower.send_command('alias garuda input /ma "Garuda" <me>')
windower.send_command('bind @g input /ma "Garuda" <me>')
--Ramuh
windower.send_command('alias ramuh input /ma "Ramuh" <me>')
windower.send_command('bind @r input /ma "Ramuh" <me>')
--Diabolos
windower.send_command('alias diabolos input /ma "Diabolos" <me>')
windower.send_command('bind @d /ma "Diabolos" <me>')
--Odin
windower.send_command('alias odin input /ma "Odin" <t>')
--Dismissing
windower.send_command('alias d input /pet "Release" <me>')
windower.send_command('bind @!d input /pet "Release" <me>')

--------------------------------------------------------------------------

--Blood Pact Binds defined by Avatar Present

--------------------------------------------------------------------------

windower.send_command('alias atk input /pet "Assault" <t>')
windower.send_command('bind !numpad0 input /pet "Assault" <t>')

windower.send_command('alias bo input //gs c pact buffoffense')
windower.send_command('bind !numpad9 input //gs c pact buffoffense')

windower.send_command('alias bd input //gs c pact buffdefense')
windower.send_command('bind !numpad8 input //gs c pact buffdefense')

windower.send_command('alias bs input //gs c pact buffspecial')
windower.send_command('bind !numpad7 input // gs c pact buffspecial')

windower.send_command('alias d1 input //gs c pact debuff1')
windower.send_command('bind !numpad6 //gs c pact debuff1')

windower.send_command('alias d2 input //gs c pact debuff2')
windower.send_command('bind !numpad5 input //gs c pact debuff2')

windower.send_command('alias sleep input //gs c pact sleep')
windower.send_command('bind !numpad4 input //gs c pact sleep')

windower.send_command('alias nuke2 input //gs c pact nuke2')

windower.send_command('alias nuke4 input //gs c pact nuke4')

windower.send_command('alias bp1 input //gs c pact bp70')
windower.send_command('bind !numpad3 input //gs c pact bp70')

windower.send_command('alias nuke input //gs c pact bp75')
windower.send_command('bind !numpad2 input //gs c pact bp75')

windower.send_command('alias bp2 input //gs c pact bp99')
windower.send_command('bind !numpad1 input //gs c pact bp99')

 
windower.send_command('alias ch input /pet "Crimson Howl" <me>')
windower.send_command('alias fc input /pet "Flaming Crush" <t>')
windower.send_command('alias vs input /pet "Volt Strike" <t>')
windower.send_command('alias aoe input //gs c pact debuff2')
windower.send_command('alias ts input //gs c pact bp75')


--------------------------------------------------------------------------

--Elemental Siphon Binds

--------------------------------------------------------------------------

windower.send_command('alias es input /ma "Dark Spirit" <me>;wait 4;input /ja "Elemental Siphon" <me>;wait 2;input /pet "Release" <me>')

--------------------------------------------------------------------------

--Other Job Abilities

--------------------------------------------------------------------------

windower.send_command('alias convert input /ja "Convert" <me>')
windower.send_command('bind !c input /ja "Convert" <me>')

windower.send_command('alias tp input /ja "Mana Cede" <me>')

windower.send_command('alias apogee input /ja "Apogee" <me>')
windower.send_command('bind !a input /ja "Apogee" <me>')

windower.send_command('bind !v input /pet "Avatar\'s Favor" <me>')
windower.send_command('alias av input /pet "Avatar\'s Favor" <me>')

--------------------------------------------------------------------------

--Spell Binds

--------------------------------------------------------------------------

windower.send_command('alias cc input /ma "Cure II" <t>')
windower.send_command('alias ccc input /ma "Cure III" <t>')
windower.send_command('alias s input /ma "Stoneskin" <me>')





