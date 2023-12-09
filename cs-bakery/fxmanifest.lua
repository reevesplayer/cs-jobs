fx_version 'cerulean'
game 'gta5'

author 'Cryptic'
description 'Bakery Job'
version '1.0.0'

client_scripts {
    'client/client.lua',
    'config.lua',
}

server_scripts {
    'server/server.lua',
    'config.lua',
}

shared_scripts {
    'config.lua'
}

dependecies {
    'qb-menu',
    'qb-target',
}
