--[[
 @package   textAdventure
 @filename  prisonext.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      24.06.2020 13:24:37 -04
]]--

prisonext = {}

prisonext.exits = {
	oeste = 'streetold'
}

function prisonext:look_in()
	if entry.params[2] == 'parte' and entry.params[3] == 'trasera' then
		text.parser([[
			Algunos fragmentos de un <b>muro</b> independiente al <b>castillo</b>
			descansan a lo <b>lejos</b>. El <b>castillo</b> sin embargo, parece sólido.
		]],'allTrim')
	elseif entry.params[2] == 'suelo' then
		text.parser([[
			Hay una zona, pegada al <b>muro</b> en la que la tierra parece blanda.
		]],'allTrim')
	elseif entry.params[2] == 'puerta' then
		text.parser([[
			Las <b>puertas</b> son grandes y sólidas. Imposibles de abrir o derribar sin sus llaves.
		]],'allTrim')
	elseif entry.params[2] == 'muro' then
		text.parser([[
			Los <b>muros</b> caídos se extienden a lo <b>lejos</b> en un montón de <b>escombros</b>.
			De poca importancia tuvo que ser el <b>muro</b>, ya que no parece del
			mismo material que el <b>castillo</b>.
		]],'allTrim')
	elseif entry.params[2] == 'escombro' then
		text.parser([[
			Los <b>escombros</b> formados de bloque y <b>restos</b> de piedra.
		]],'allTrim')
	elseif entry.params[2] == 'castillo' then
		text.parser([[
			El <b>castillo</b> impresiona, aunque quizás desde otro lugar se pueda
			ver mejor y entrar a él.
		]],'allTrim')
	elseif entry.params[2] == 'tierra' then
		text.parser([[
			La <b>tierra</b> parece bastante blanda. Si le echo algo de <b>agua</b> será más manipulable...
		]],'allTrim')
	elseif entry.params[2] == 'restos' then
		text.parser([[
			Trozos de piedra inservible. Una buena limpieza
			haría falta por aquí... Lástima que no me traje la <b>escoba</b>...
		]],'allTrim')
	elseif entry.params[2] == 'escoba' then
		text.parser([[
			He dicho que no me traje la <b>escoba</b>... ¡A qué te pongo a barrer a ti!
		]],'allTrim')
	else
		excuses:look_excuses()
	end
end

function prisonext:goto_in()
	if entry.params[2] ~= nil then
		for k,v in pairs(prisonext.exits) do
			if entry.params[2] == k then
				player.location = v
			end
		end
		text.parser(player.getLocation())
	else
		excuses:goto_excuses()
	end
end

return prisonext
