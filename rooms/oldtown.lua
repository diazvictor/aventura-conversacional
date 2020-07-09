--[[
 @package   textAdventure
 @filename  oldtown.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      24.06.2020 17:02:46 -04
]]--

oldtown = {}

oldtown.exits = {
	sur = 'hospitaloutside',
	-- oeste = 'bosque'
}

function oldtown:look_in()
	if entry.params[2] == 'descampado' then
		text.parser([[
			Un lugar ampliamente deshabitado. A lo lejos puedes ver
			varios <b>coches</b> y alguna <b>casa</b> con las <b>luces</b> encendidas,
			sin embargo, por esta zona, la <b>actividad</b> es nula.
		]], 'allTrim')
	elseif entry.params[2] == 'casa' then
		text.parser([[
			Construcciones normales... Nada demasiado destacable.
			Parecen estar en un punto medio entre la construcción de
			ciudad tradicional y las <b>casas</b> de pueblo.
		]], 'allTrim')
	elseif entry.params[2] == 'coche' then
		text.parser([[
			Veo varios vehículos aparcados a lo <b>lejos</b>, cerca de las <b>casas</b>.
			Supongo que serán de sus habitantes. No veo a nadie dentro.
		]], 'allTrim')
	elseif entry.params[2] == 'lejos' then
		text.parser('¿Tan lejos? No alcanzo a ver...')
	elseif entry.params[2] == 'luz' then
		text.parser('Pocas, pero alguna casa tiene luz encendida.')
	elseif entry.params[2] == 'actividad' then
		text.parser('Pues eso, nula.')
	elseif entry.params[2] == 'ruedas' then
		text.parser('Marca <b>ACME</b>... Tengo buena vista, ¿verdad?')
	else
		excuses:look_excuses()
	end
end

function oldtown:goto_in()
	if entry.params[2] ~= nil then
		for k,v in pairs(oldtown.exits) do
			if entry.params[2] == k then
				player.location = entry.params[2]
			end
			text.parser(player.getLocation())
		end
	else
		excuses:goto_excuses()
	end
end

return oldtown
