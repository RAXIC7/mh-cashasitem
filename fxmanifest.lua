--[[ ===================================================== ]]--
--[[           MH Cash As Item Script by MaDHouSe          ]]--
--[[ ===================================================== ]]--

fx_version 'cerulean'
game 'gta5'

author 'MaDHouSe79'
description 'MH CashAsItem - use cash as item.'
version '1.0'

client_scripts {
    'client/main.lua',
}

server_scripts {
    'server/main.lua',
    'server/update.lua',
}

dependencies {
    'qb-core',
}

lua54 'yes'
