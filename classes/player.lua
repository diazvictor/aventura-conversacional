--[[
 @package	textAdventure
 @filename  player.lua
 @version   1.7
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      10.06.2020 14:07:45 -04
]]--

player = {}
player.name = ''
player.hp = 100
player.score = 0
player.dead = false
player.location = 'streetold'

player.inventory = {}

function player.getItems()
	if (#player.inventory ~= 0) then
		text.parser('Tengo los siguientes objetos en mi <b>inventario</b>:')
		for _, inventory in pairs(player.inventory) do
			text.parser('* ' .. inventory.description)
		end
	else
		print('No llevo nada encima.')
	end
end

function player.hasItem(name)
	for _, inventory in pairs(player.inventory) do
		if name == inventory.name then
			return true
		end
	end
	return false
end

function player.addItem(name, description)
	table.insert(player.inventory, {name = name, description = description})
	return #player.inventory
end

function player.removeItem(name)
	for i, inventory in pairs(player.inventory) do
		if inventory['name'] == name then
			table.remove(player.inventory, i)
			return name
		end
	end
end

function player.getLocation()
	if (player.location == 'streetold') then
		player.locationDescription = [[
			Esta parece la zona más vieja del <b>pueblo</b>.
			Varias <b>casas</b> antiguas aparecen a lo largo de la calle, y
			sus <b>puertas</b>, cerradas. Algunas grandes <b>macetas</b> adornan la estancia.
			Un <b>poste</b> de madera sujeta un <b>cartel</b>.
		]]
	elseif (player.location == 'tavern') then
		player.locationDescription = [[
			Estás en el interior de la <b>taberna</b> La mansión de Caloire.
			La <b>madera</b> predomina en el lugar. El ambiente es muy cálido.
			Sin embargo, está completamente vacío. Las <b>sillas</b> se mantienen
			ordenadas en sus respectivos sitios, sin embargo, el lugar no
			parece hacer justicia a su entorno. Varias estanterías repletas
			de <b>bebidas</b> a lo largo de la <b>barra</b>.
		]]
	elseif (player.location == 'hospitaloutside') then
		player.locationDescription = [[
			Una gran <b>edificación</b> se eleva desde el <b>suelo</b>. Se trata del
			edificio principal de lo que parece el hospital del lugar.
			El local principal parece estar cerrado, aunque al <b>sur</b> se
			puede acceder a una pequeña zona que permanece abierta.
			Varios <b>matojos</b> y <b>arbustos</b> pueblan la zona.
		]]
	elseif (player.location == 'prisonext') then
		player.locationDescription = [[
			Estás en la parte trasera de un gran <b>castillo</b>.
			Varias <b>puertas</b> gigantes y reforzadas impiden la entrada al recinto.
			Los <b>muros</b>, también muy sólidos se mantienen firmes ante
			tu presencia. Algunos <b>escombros</b> de <b>muros</b> independientes al
			<b>castillo</b> están derruidos por un lado.
		]]
	elseif (player.location == 'oldtown') then
		player.locationDescription = [[
			Estás en un <b>descampado</b>. Reina la tranquilidad y un ambiente
			lúgubre y desolado. El frio acecha en los rincones del lugar,
			mostrando un panorama inquietante.
		]]
	end
	player.locationDescription = player.locationDescription:gsub('\t', ''):gsub('%s+$','')
	return player.locationDescription
end

return player
