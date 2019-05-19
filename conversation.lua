conversation = true

while (conversation) do
    cmd = io.read()
    if (cmd == 'coger la linterna') then
        print('Cogida.')
        conversation = false
    elseif (cmd ~= 'coger la linterna') then
        print('No se entindio lo que dijo.')
    end
end