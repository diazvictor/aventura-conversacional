--[[--
 @package
 @filename  streetold.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex
 @date      23.06.2020 15:12:49 -04
--]]

streetold = {}

streetold.exits = {
	sur = 'tavern',
	oeste = 'hospitaloutside',
	este = 'prisonext'
}

function streetold:look_in()
	if entry.params[2] == 'casas' and entry.params[3] == 'antiguas' then
		text.parser([[
			El aspecto de las <b>casas</b> es muy anticuado. La mayoría de las
			<b>puertas</b> están cerradas a cal y canto.
		]], 'allTrim')
	elseif entry.params[2] == 'suelo' then
		text.parser([[
			El <b>suelo</b> deteriorado y lleno de baches, le da a la calle
			un aspecto ideal para atraer turistas... Lástima que esté tan deshabitado...
		]], 'allTrim')
	elseif entry.params[2] == 'cartel' then
		text.parser('Dice <i>La mansión de Caloire</i>')
	elseif entry.params[2] == 'casas' and entry.params[3] == 'antiguas' then
		text.parser([[
			Las <b>casas</b> parecen abandonadas o cerradas por alguna extraña razón... Es sobrecogedor...
		]], 'allTrim')
	elseif entry.params[2] == 'pared' then
		text.parser('Las paredes de las <b>casas</b> tienen surcos y parecen estar inacabadas.')
	elseif entry.params[2] == 'puertas' then
		text.parser('Las puertas de las <b>casas</b> están cerradas.')
	elseif entry.params[2] == 'macetas' then
		text.parser('Algunos <b>arbustos</b> y plantas en las diferentes <b>macetas</b>.')
	elseif entry.params[2] == 'poste' then
		text.parser([[
			Un alto <b>poste</b> de madera que sujeta un <b>cartel</b> frente
			a lo que parece una taberna.
		]], 'allTrim')
	elseif entry.params[2] == 'arbustos' then
		text.parser('Plantas que adornan la fachada de los distintos lugares de la calle.')
	elseif entry.params[2] == 'banco' then
		text.parser('Un <b>banco</b> de <b>madera</b>, tiene una <b>pintada</b>...')
	elseif entry.params[2] == 'pintada' then
		text.parser('Tiene un graffiti que pone: <i>Croatoan</i>')
	elseif entry.params[2] == 'ventanas' then
		text.parser([[
			<b>Ventanas</b> cerradas. Como cuando en el oeste llega el temible
			forajido y todos es esconden... No veo a nadie...
		]],'allTrim')
	else
		excuses:look_excuses()
	end
end

function streetold:goto_in()
	if entry.params[2] ~= nil then
		for k,v in pairs(streetold.exits) do
			if entry.params[2] == k then
				player.location = v
			end
		end
		text.parser(player.getLocation())
	else
		excuses:goto_excuses()
	end
end

return streetold
