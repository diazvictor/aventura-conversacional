--[[
 @package
 @filename  player.lua
 @version   1.7
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      10.06.2020 14:07:45 -04
]]--

player = {}

player.hp = 100
player.dead = false
player.location = "Main Hall"

player.inventory = {
	{obj = 'linterna', desc = 'una linterna de plata sin utilidad'},
	{obj = 'espada élfica', desc = 'una espada élfica de juguete'}
}

function player:getInventory()
	if (type(player.inventory) == 'table') then
		if (player.inventory[1]) then
			print('Llevas :')
			for _, inventory in pairs(player.inventory) do
				print('* ' .. inventory.desc)
			end
		else
			print('No llevas nada!')
		end
	end
end

function player:setInventory(name, desc)
	table.insert(player.inventory, {obj = name, desc = desc})
end
