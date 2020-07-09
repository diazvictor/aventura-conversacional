--[[
 @package
 @filename  main.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      10.06.2020 14:07:45 -04
]]--
require 'classes.text'
require 'classes.player'
require 'classes.excuses'

require 'rooms.streetold'
require 'rooms.tavern'
require 'rooms.hospitaloutside'
require 'rooms.prisonext'
require 'rooms.oldtown'

game = {}
game.running = true
game.state = "intro"
game.verbs = {
	'beber','caminar','coger','comer','dejar','examinar',
	'examiname','hablar','ayuda','inventario',
	'ir','mirar','mover','oir','oler','probar','salir',
	'salidas','saltar','soltar','tocar','tomar'
}

function game.entry()
	entry = {}
	entry.text = io.read()
	entry.params = {}
	for s in entry.text:gmatch("%a+") do
		table.insert(entry.params, string.lower(s))
	end
end

function game.showAllCommands()
	print('Lista de comandos:')
	for i, v in pairs(game.verbs) do
		print(i ..'. ' .. v)
	end
end

function game.confirm(title, question)
	text.parser(title)
	question = question or {}
	while true do
		input = io.read()
		if input == question[1] then
			return true
		elseif input == question[2] then
			return false
		end
	end
end

function game.exits(self)
	if self then
		print('Las salidas posibles son:')
		for exit,_ in pairs(self.exits) do
			print(exit)
		end
	end
end

while (game.running == true) do
	if game.state == 'intro' then
		print('Bienvenido a Innocent Hill')
		print('Presione la tecla [ENTER] para continuar.')
		io.read()
		text.parser('<b>Innocent Hill</b>\n')
		text.parser(player.getLocation() .. '\n')
		game.state = 'play'
	elseif game.state == 'play' then
		location = player.getLocation()
		game.entry()
		if (entry.text ~= '') then
			print()
			for _, v in pairs(game.verbs) do
				if (v == entry.params[1]) then
					-- text.parser('Has usado el comando <b>' .. v .. '</b>')
					if (entry.params[1] == 'coger' or entry.params[1] == 'tomar') then
						if player.location == 'tavern' then
							tavern:take_in()
						elseif player.location == 'hospitaloutside' then
							hospitaloutside:take_in()
						end
					elseif (entry.params[1] == 'ir') then
						if player.location == 'streetold' then
							streetold:goto_in()
						elseif player.location == 'tavern' then
							tavern:goto_in()
						elseif player.location == 'hospitaloutside' then
							hospitaloutside:goto_in()
						elseif player.location == 'prisonext' then
							prisonext:goto_in()
						elseif player.location == 'oldtown' then
							oldtown:goto_in()
						end
					elseif (entry.params[1] == 'inventario') then
						player.getItems()
					elseif (entry.params[1] == 'dejar') then
						if entry.params[2] ~= nil then
							player.removeItem(entry.params[2])
							print('He dejado ese objeto aquí.')
						else
							print('No puedo soltar algo que no tengo')
						end
					elseif (entry.params[1] == 'soltar') then
						if entry.params[2] ~= nil then
							player.removeItem(entry.params[2])
							print('He dejado ese objeto aquí.')
						else
							print('No puedo soltar algo que no tengo')
						end
					elseif (entry.params[1] == 'mirar') then
						if entry.params[2] ~= nil then
							if player.location == 'streetold' then
								streetold:look_in()
							elseif player.location == 'tavern' then
								tavern:look_in()
							elseif player.location == 'hospitaloutside' then
								hospitaloutside:look_in()
							elseif player.location == 'prisonext' then
								prisonext:look_in()
							end
						else
							text.parser(location)
						end
					elseif (entry.params[1] == 'ayuda') then
						game:showAllCommands()
					elseif (entry.params[1] == 'salir') then
						ok = game.confirm(
							'Seguro que deseas salir ? [si/no]',
							{'si','no'}
						)
						if ok == true then
							game.running = false
							print('Goodbye!')
						else
							print('Entiendo.')
						end
					elseif (entry.params[1] == 'salidas') then
						if player.location == 'streetold' then
							game.exits(streetold)
						elseif player.location == 'tavern' then
							game.exits(tavern)
						elseif player.location == 'hospitaloutside' then
							game.exits(hospitaloutside)
						elseif player.location == 'prisonext' then
							game.exits(prisonext)
						elseif player.location == 'oldtown' then
							game.exits(oldtown)
						end
					end
				end
			end
		end
	end
end
