package = "redrex"
version = "0.1.0-1"
source = {
   url = "git+https://github.com/rexyrex/kong_plugin_redrex"
}
description = {
   homepage = "Kong API Gateway middleware plugin for redirect purposes.",
   license = "Apache License 2.0"
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.redrex.handler"] = "kong/plugins/redrex/handler.lua",
      ["kong.plugins.redrex.schema"] = "kong/plugins/redrex/schema.lua"
   }
}