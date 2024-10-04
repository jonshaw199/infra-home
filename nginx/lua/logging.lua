-- /etc/nginx/lua/logging.lua

local logging = {}

function logging.log_request_body(file_path)
    ngx.req.read_body()  -- Read the request body
        local data = ngx.req.get_body_data()  -- Get the request body data

        -- Log to error_log
        ngx.log(ngx.NOTICE, "Request body: ", data)

        -- Manually log to access log (by writing to a specific file)
        local log_file = io.open(file_path, "a")  -- Open log file in append mode
        if log_file then
            log_file:write("Contact form submitted: ", data, "\n")  -- Write the request body to the log file
            log_file:close()  -- Close the log file
        end
end

return logging