--[[
 @package
 @filename  params.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      11.06.2020 15:53:54 -04
]]--

entry = {}
entry.text = io.read()

entry.params = {}
for s in entry.text:gmatch("%w+") do
	value = string.lower(s)
	table.insert(entry.params, value)
end

if entry.params[1] == 'mirar' then
	if entry.params[2] == 'casas' and entry.params[3] == 'antiguas' then
		print('Las casas parecen abandonadas o cerradas por alguna extraña razón... Es sobrecogedor...')
	else
		print('¿Qué mire QUÉ?')
	end
else
	print('No entendi eso que dijo.')
end

for k,v in pairs(entry.params) do
	print(k,v)
end