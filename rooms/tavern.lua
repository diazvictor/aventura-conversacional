--[[--
@package
@filename  tavern.lua
@version   1.0
@author    Díaz Urbaneja Víctor Eduardo Diex
@date      23.06.2020 16:41:45 -04
--]]

tavern = {}

tavern.exits = {
	norte = 'streetold'
}

function tavern:look_in()
	if entry.params[2] == 'taberna' then
		text.parser([[
			Lo cierto es que es un lugar agradable.
			Por primera vez me siento más descansado
			en este <b>pueblo</b>.
		]], 'allTrim')
	elseif entry.params[2] == 'suelo' then
		text.parser('El piso está hecho de tablones de <b>madera</b>.')
	elseif entry.params[2] == 'madera' then
		text.parser('Materia prima de este lugar.')
	elseif entry.params[2] == 'sillas' then
		text.parser([[
			Varias <b>sillas</b> acompañan a cada <b>mesa</b> que existe
			repartida por la <b>taberna</b>.
		]], 'allTrim')
	elseif entry.params[2] == 'mesa' then
		text.parser([[
			Las <b>mesas</b> están completamente despejadas. La <b>madera</b> brilla.
		]], 'allTrim')
	elseif entry.params[2] == 'barra' then
		if player.hasItem('llave') == false then
			text.parser([[
				La <b>barra</b> permanece limpia de objetos.
				Solo algunos ceniceros descansan por ciertos
				extremos. Aquí hay una <b>llave</b>.
			]], 'allTrim')
		else
			text.parser([[
				La <b>barra</b> permanece limpia de objetos.
				Solo algunos ceniceros descansan por ciertos
				extremos.
			]], 'allTrim')
		end
	elseif entry.params[2] == 'bebidas' then
		text.parser([[
			Hay varias <b>bebidas</b> en la estantería...
			Al parecer la que más se consume es el <b>grog</b>.
		]], 'allTrim')
	elseif entry.params[2] == 'lamparas' then
		text.parser([[
			Emiten la suficiente luz para iluminar la <b>taberna</b>.
		]], 'allTrim')
	elseif entry.params[2] == 'tablones' then
		text.parser('Tablones de <b>madera</b>. En buen estado.')
	elseif entry.params[2] == 'ceniceros' then
		text.parser([[
			Limpios, sin una colilla... Junto a uno de ellos
			hay un <b>panfleto</b>.
		]], 'allTrim')
	elseif entry.params[2] == 'grog' then
		text.parser('Jou Jou Jou... Y una botella de <b>Grog</b>...')
	elseif entry.params[2] == 'caja' then
		text.parser('Hay un billete... Pero es del <i>Monopoly</i>...')
	elseif entry.params[2] == 'panfleto' then
		text.parser('El panfleto dice: <i>Reena Laux</i>, periodista.')
	elseif entry.params[2] == 'suelo' then
		text.parser('Vino, Whiskey y Grog.')
	elseif entry.params[2] == nil then
		text.parser(location)
	else
		excuses:look_excuses()
	end
end

function tavern:take_in()
	if entry.params[2] == 'llave' then
		if player.hasItem('llave') == false then
			player.addItem('llave','Una pequeña <b>llave</b> roja.')
			text.parser('Has cogido la <b>llave</b>.')
		else
			print('Ya lo tengo.')
		end
	else
		excuses:take_excuses()
	end
end

function tavern:goto_in()
	if entry.params[2] ~= nil then
		for k,v in pairs(tavern.exits) do
			if entry.params[2] == k then
				player.location = v
			end
		end
		text.parser(player.getLocation())
	else
		excuses:goto_excuses()
	end
end

return tavern
