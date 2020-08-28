require "util"

local file = fs.ydwe_path() / "bin" / "EverConfig.cfg"
local tbl = nil
local tbl_index = {
	MapSave = {
		Option = "0"
	},
	War3Patch = {
		Option = "0"
	},
	MapTest = {
		LaunchRenderingEngine = "Direct3D 8",
		LaunchWindowed = "1",
		LaunchFullWindowed = "0",
		LaunchLockingMouse = "0",
		LaunchFixedRatioWindowed = "1",
		LaunchDisableSecurityAccess = "0",
	},
	ScriptCompiler = {
		EnableJassHelper = "1",
		EnableJassHelperDebug = "0",
		EnableJassHelperScriptOnly = "0",
		EnableJassHelperOptimization = "1",
		EnableCJass = "0",
	},
	ScriptInjection = {
		Option = "0"
	},
	ThirdPartyPlugin = {
		EnableDotNetSupport = "0",
		EnableTesh = "1",
		EnableYDTrigger = "1",
	},
	FeatureToggle = {
		EnableManualNewId = "0",
		EnableTriggerCopyEncodingAutoConversion = "1",
		EnableShowInternalAttributeId = "0",
	},
	Font = {
		FontEnable = "0",
		FontName = "",
		FontSize = "12",
	},
}

function global_config_reload()
	tbl = sys.ini_load(file)
	if not tbl then
		tbl = {}
	end
	tbl = setmetatable(tbl, {__index = tbl_index})
end
global_config_reload()

global_config = tbl
