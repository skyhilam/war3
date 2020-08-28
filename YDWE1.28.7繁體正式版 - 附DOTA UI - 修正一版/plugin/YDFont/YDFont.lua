require "localization"
local ffi = require "ffi"

local loader = {}
	
loader.load = function(path)
	if global_config["Font"]["Enable"] ~= "1" then
		log.warn('failed: enable font')
		return false
	end
	
	local s, r = pcall(ffi.load, __(path:string()))
			
	if not s then
		log.error('failed: ' .. r)
		return false
	end
	loader.dll = r

	ffi.cdef[[
		bool SetFontByName(const char* name, size_t size);
	]]

	local name = global_config["Font"]["Name"]
	local size = global_config["Font"]["Size"]
	if name == '' then name = 'system' end
	if size == '' then size = '12' end
	if not loader.dll.SetFontByName(name, tonumber(size)) then
		log.error('failed: in YDFont.dll!SetFontByName')
		return  false
	end
	return true
end

loader.unload = function()
end

return loader
