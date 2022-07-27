local typedefs = require "kong.db.schema.typedefs"

return {
    no_consumer = true, -- This means our plugin will not apply to specific service consumers
    fields = {
		{ validate_token_url = typedefs.url({ required = true }) },
		
		{ uri_param_names = {
          type = "set",
          elements = { type = "string" },
          default = { "access_token" },
        }, },
		
        status_code = {
            type     = "number",
            required = true,
            default  = 301
        },
        redirect_url = {
            type     = "string",
            required = true,
            default  = "https://google.com"
        }
    }
}