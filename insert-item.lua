player = {}

player.inventory = {
    {obj = 'linterna', desc = "una linterna de plata"},
    {obj = 'espada élfica', desc = "una espada élfica"}
}

function player:getInventory()
    print('Llevas :')
    for i,v in ipairs(player.inventory) do
        print('   ' .. v.desc)
    end
end

msg = 'Estas es una habitación un poco pequeña, la cual pertenecia a un periodista.' .. '\n' .. 'En el centro de la habitación hay una mesa, sobre ella se encuentra un periódico y una camara.'
print(msg)

cmd = io.read()

if (cmd == 'coger camara') or (cmd == 'tomar camara') then
    -- @TODO: Luego añadire una funcion que facilitara la cosas, leyendo la tabla player.inventory añadira el valor que queramos.
    table.insert(player.inventory, 3, {obj = 'camara', desc = 'una camara'})
    print('Cogida')
elseif (cmd == 'inventario') then
    player:getInventory()
end

cmd = io.read()

if (cmd == 'coger periodico') or (cmd == 'tomar periodico') or (cmd == 'coger periódico') or (cmd == 'tomar periódico') then
    table.insert(player.inventory, 4, {obj = 'periódico', desc = 'un periódico'})
    print('Cogido')
elseif (cmd == 'inventario') then
    player:getInventory()
end

cmd = io.read()

if (cmd == 'inventario') then
    player:getInventory()
end