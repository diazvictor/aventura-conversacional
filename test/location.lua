--[[
 @package
 @filename  location.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      23.06.2020 12:20:10 -04
]]--
location = {}
location.streetold = {
	descripcion = ([[
		Esta parece la zona más vieja del pueblo. Varias casas antiguas
		aparecen a lo largo de la calle, y sus puertas, cerradas.
		Algunas grandes macetas adornan la estancia.
		Un poste de madera sujeta un cartel.
	]]):gsub('\t',''),
	direcciones = {
		sur = 'tavern',
		oeste = 'hospitaloutside',
		este = 'prisonext'
	},
	mirar = {
		casas = "El aspecto de las casas es muy anticuado. La mayoría de las puertas están cerradas a cal y canto.",
		suelo = "El suelo deteriorado y lleno de baches, le da a la calle un aspecto ideal para atraer turistas... Lástima que esté tan deshabitado...",
		cartel = "Dice -La mansión de Caloire",
		casas_antiguas = "Las casas parecen abandonadas o cerradas por alguna extraña razón... Es sobrecogedor...",
		pared = "Las paredes de las casas tienen surcos y parecen estar inacabadas.",
		puertas = "Las puertas de las casas están cerradas.",
		macetas = "Algunos arbustos y plantas en las diferentes macetas.",
		poste = "Un alto poste de madera que sujeta un cartel frente a lo que parece una taberna.",
		arbustos = "Plantas que adornan la fachada de los distintos lugares de la calle.",
		banco = "Un banco de madera, tiene una pintada...",
		pintada = {
			message = "Tiene un graffiti que pone: —Croatoan",
		},
		ventanas = "Ventanas cerradas. Como cuando en el oeste llega el temible forajido y todos es esconden... No veo a nadie..."
	}
}

function getLocation(location)
	location = location
	for k,v in pairs(location) do
		print(v)
	end
end
getLocation(location.streetold)
-- game_running=true
-- while game_running do
	-- print(streetold.descripcion)
	-- choice = io.read()
	-- if choice == streetold.mirar then
		-- print('Que quieres mirar ?')
	-- end
-- end