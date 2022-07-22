local BasePlugin = require "kong.plugins.base_plugin"

local RedirectHandler = BasePlugin:extend()

RedirectHandler.PRIORITY = 999
RedirectHandler.VERSION = "0.1.0"

function RedirectHandler:init_worker()

  kong.log.debug("saying hi from the 'init_worker' handler")

end



function RedirectHandler:new()
    RedirectHandler.super.new(self, "kong-plugin-redirect")
end

function RedirectHandler:access(conf)
    RedirectHandler.super.access(self)
    local status_code = conf.status_code
    local redirect_url = conf.redirect_url
	ngx.log("access log")
	
    return ngx.redirect("https://google.com", status_code)
end

return RedirectHandler
