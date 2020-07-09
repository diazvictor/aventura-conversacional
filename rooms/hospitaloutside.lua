--[[
 @package   textAdventure
 @filename  hospitaloutside.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      24.06.2020 13:17:13 -04
]]--

hospitaloutside = {}

hospitaloutside.exits = {
	norte = 'oldtown',
	-- sur = 'hospitalcorridor',
	este = 'streetold'
}

function hospitaloutside:look_in()
	if entry.params[2] == 'descampado' then
		text.parser([[
			Un árido <b>descampado</b> que parece pertenecer a las inmediaciones
			del <b>hospital</b>. La vegetación crece por estas zonas e incluso
			se adhiere a la <b>pared</b> del <b>hospital</b>.
		]], 'allTrim')
	elseif entry.params[2] == 'edificacion' then
		text.parser([[
			El <b>edificio</b> es alto y parece antiguo. No obstante, y como otras
			partes del pueblo, parece no coincidir con la época.
		]], 'allTrim')
	elseif entry.params[2] == 'suelo' then
		if player:getItem('nota') == false then
			text.parser([[
				El <b>suelo</b> está lleno de <b>arbustos</b> y <b>matojos</b>. Aquí hay una pequeña <b>nota</b>.
			]], 'allTrim')
		else
			text.parser('El <b>suelo</b> está lleno de <b>arbustos</b> y <b>matojos</b>.')
		end
	elseif entry.params[2] == 'matojos' then
		text.parser([[
			Grandes extensiones de <b>hierbas</b>, probablemente de crecimiento
			acelerado debido a las lluvias.
		]], 'allTrim')
	elseif entry.params[2] == 'hierba' then
		text.parser('No... No es de ese tipo...')
	elseif entry.params[2] == 'ventana' then
		text.parser([[
			Varias ventanas y balcones, idénticas entre sí, se apilan una
			consecutiva a la otra...
		]], 'allTrim')
	elseif entry.params[2] == 'pared' then
		text.parser([[
			La <b>pared</b> tiene una <b>hoja</b> pegada. Es una noticia sobre un accidente.
		]], 'allTrim')
	elseif entry.params[2] == 'hoja' then
		text.parser([[
			Accidente en el bosque de <b>Innocent Hill</b> y unas imagenes. Falta el resto de la noticia, sólo veo el titular y poco más...
		]], 'allTrim')
	else
		excuses:look_excuses()
	end
end

function hospitaloutside:take_in()
	if entry.params[2] == 'nota' then
		if player:getItem('nota') == false then
			player:grabItem('nota','Una pequeña <b>nota</b>.')
			text.parser('He recogido la pequeña <b>nota</b>. Parece un pedazo recortado de la prensa.')
		else
			print('Ya lo tengo.')
		end
	else
		excuses:take_excuses()
	end
end

function hospitaloutside:goto_in()
	if entry.params[2] ~= nil then
		for k,v in pairs(hospitaloutside.exits) do
			if entry.params[2] == k then
				player.location = v
			end
		end
		text.parser(player.getLocation())
	else
		excuses:goto_excuses()
	end
end

return hospitaloutside
