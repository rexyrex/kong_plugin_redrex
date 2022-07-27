local BasePlugin = require "kong.plugins.base_plugin"
local http = require "socket.http"
local ltn12 = require "ltn12"

local RedirectHandler = BasePlugin:extend()

local RedirectHandler = {
	VERSION = "1.0.0",
	PRIORITY = 2000
}


--[=====[ 
local function retrieve_token(conf)
  local authorization_header = kong.request.get_header("authorization")
  if authorization_header then
    local iterator, iter_err = re_gmatch(
          authorization_header, "\\\\s*[Bb]earer\\\\s+(.+)")
    return access_token
  end
end
--]=====]

function RedirectHandler:init_worker()

  kong.log.debug("saying hi from the 'init_worker' handler")

end



function RedirectHandler:new()
kong.log.debug("NEW HANDLER")
    -- RedirectHandler.super.new(self, "redrex")
end


function RedirectHandler:access(conf)
	kong.log.debug("saying hi from access handler!!")
    -- RedirectHandler.super.access(self)
    local status_code = conf.status_code
    local redirect_url = conf.redirect_url
	
	local host = kong.request.get_host()
	local path = kong.request.get_path()
	
	ngx.log("ngx.log test")
	
	kong.log.debug("host: "..host)
	kong.log.debug("path: "..path)
	
	res = post("http://3.35.4.190:80/url")
	
	kong.log.debug("res: "..res)
	
	-- token = retrieve_token(conf)
	kong.log.debug("token : "..token)
	kong.log.debug(status_code)
	kong.log.debug(redirect_url)
	
    return ngx.redirect("https://naver.com", status_code)
end

function post(url)


	local body = {}

	local res, code, headers, status = http.request {
		method = "POST",
		url = url,
		source = ltn12.source.string('var=123'),
		headers = {
			["content-type"] = "text/plain",
			["content-length"] = '7'
		},
		sink = ltn12.sink.table(body)
	}

	response = table.concat(body)
	
	return response

end

function RedirectHandler:header_filter(plugin_conf)

  -- kong.response.set_header(plugin_conf.response_header, "this is on the response")
  kong.log.debug("saying hi from the 'rewrite' handler")
end

function RedirectHandler:rewrite(plugin_conf)
  kong.log.debug("saying hi from the 'rewrite' handler")
end

function RedirectHandler:body_filter(plugin_conf)
  kong.log.debug("saying hi from the 'body_filter' handler")
end

function RedirectHandler:log(plugin_conf)
  kong.log.debug("saying hi from the 'log' handler")
end

function RedirectHandler:certificate(plugin_conf)
  kong.log.debug("saying hi from the 'certificate' handler")
end



return RedirectHandler
