--[[
 @package
 @filename  main.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      10.06.2020 14:07:45 -04
]]--

require 'player'

game = {}
game.running = true
game.state = "primera_parte"
game.commands = {
	'beber',
	'coger',
	'comer',
	'examinar',
	'hablar',
	'ayuda',
	'inventario',
	'mover',
	'oir',
	'oler',
	'probar',
	'salir',
	'soltar',
	'tocar',
	'tomar'
}

function game:showAllCommands()
	print('Lista de comandos:')
	for i, v in pairs(game.commands) do
		print(i ..'. ' .. v)
	end
end

print('Usar el comando "ayuda" para más información.')
while game.running == true do
	local cmd = io.read()
	if (cmd ~= '') then
		for _, v in pairs(game.commands) do
			if (cmd == v) then
				print('Has usado el comando "' .. v .. '"')
				if (v == 'ayuda') then
					game:showAllCommands()
				elseif (v == 'salir') then
					game.running = false
					print('Goodbye!')
				end
			end
		end
	end
end
