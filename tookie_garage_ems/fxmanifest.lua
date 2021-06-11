fx_version 'adamant'
game 'gta5'
desc 'Garage EMS by tookie '


client_scripts {
    "src/client/RMenu.lua",
    "src/client/menu/RageUI.lua",
    "src/client/menu/Menu.lua",
    "src/client/menu/MenuController.lua",
    "src/client/components/*.lua",
    "src/client/menu/elements/*.lua",
    "src/client/menu/items/*.lua",
    "src/client/menu/panels/*.lua",
    "src/client/menu/windows/*.lua",
    
    'config.lua',
    'client.lua'

}

server_script {
    "server.lua"
}