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

function player:setInventory(name, desc)
    for i,v in ipairs(player.inventory) do
        print(i)
        id = i + 1
    end
    table.insert(player.inventory, id, {obj = name, desc = desc})
end

msg = 'Estas es una habitación un poco pequeña, la cual pertenecia a un periodista.' .. '\n' .. 'En el centro de la habitación hay una mesa, sobre ella se encuentra un periódico y una camara.'
print(msg)

cmd = io.read()

if (cmd == 'coger camara') or (cmd == 'tomar camara') then
    player:setInventory('camara', 'una camara')
    print('Cogida')
elseif (cmd == 'inventario') then
    player:getInventory()
end

cmd = io.read()

if (cmd == 'coger periodico') or (cmd == 'tomar periodico') or (cmd == 'coger periódico') or (cmd == 'tomar periódico') then
    player:setInventory('periódico', 'un periódico')
    print('Cogido')
elseif (cmd == 'inventario') then
    player:getInventory()
end

cmd = io.read()

if (cmd == 'inventario') then
    player:getInventory()
end
