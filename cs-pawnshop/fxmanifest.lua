fx_version 'cerulean'
game 'gta5'

author 'cStudio'
description 'Pawn Shop Job'
version '1.0.0'

server_scripts {
    'server/main.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua',
    'client/client_open.lua'
    'config.lua'
}

shared_scripts {
    '@ox_lib/init.lua'
    'config.lua'
}