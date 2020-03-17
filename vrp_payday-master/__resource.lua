
description "vrp_payday"

dependency "vrp"

client_scripts{ 
  "lib/Tunnel.lua",
  "lib/Proxy.lua",
  "client.lua",
  "cfg.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}
