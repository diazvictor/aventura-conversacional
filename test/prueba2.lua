--[[
 @package
 @filename  prueba2.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      22.06.2020 16:36:44 -04
]]--


--[[
  N
W * E
  S
--]]

verbos = {
	'beber','caminar','coger','comer','examinar',
	'examiname','hablar','ayuda','inventario',
	'ir','mover','oir','oler','probar','salir',
	'soltar','tocar','tomar'
}
direcciones = {
	"norte", "sur", "este", "oeste"
}
houseFront = {
	description = [[
		<b>House Front</b>

		Lorem ipsum dolor sit amet, consectetur adipisicing elit,
		sed doeiusmod tempor incididunt ut labore et dolore
		magna aliqua. Ut enimad minim veniam, quis nostrud
		exercitation ullamco laboris nisi utaliquip ex ea commodo
		consequat. Duis aute irure dolor inreprehenderit in voluptate
		velit esse cillum dolore eu fugiat nullapariatur.
	]],
	exits = {
		north = 'door1',
		west = 'door2',
	},
	items = {
		'keyDoor1'
	}
}
-- if houseFront.items[1] == 'keyDoor1' then
	-- print('True')
-- else
	-- print('False')
-- end
door1 = {
	description = [[
		<b>Door 1</b>

		Lorem ipsum dolor sit amet, consectetur adipisicing elit,
		sed doeiusmod tempor incididunt ut labore et dolore
		magna aliqua. Ut enimad minim veniam, quis nostrud
		exercitation ullamco laboris nisi utaliquip ex ea commodo
		consequat. Duis aute irure dolor inreprehenderit in voluptate
		velit esse cillum dolore eu fugiat nullapariatur.
	]],
	required = 'keyDoor1'
}