Config = {
	RestrictedMessage = "~r~This PED model is restricted.",
	InheritanceEnabled = true,
	-- Set to true if you use the t-notify plugin for notifications.
	usingTnotify = false,
	defaultPED = "a_m_y_skater_01",
	-- How often the script checks for restricted PEDs (in milliseconds)
	updateTime = 2000
}

-- This Script uses the nicknames for roles listed in Badger_Discord_API. 
Config.PEDRestrictions = {
	--['RoleName or ID'] = {
	--	"PED1",
	--	"PED2",
	--	"PED3",
	--	"PED4"
	--},

	['RoleName1'] = {
		""
	},
	['RoleName2'] = {
		""
	},
	['RoleName3'] = {
		"a_m_m_acult_01",
	},
	['RoleName4'] = {
		""
	}
}

-- Requires Config.InheritanceEnabled to be = true
Config.Inheritances = {
	--['RoleName or ID'] = {'RoleName2', 'RoleName3', 'RoleName4'},
	['RoleName1'] = {'RoleName2', 'RoleName3', 'RoleName4'},
	['RoleName2'] = {'RoleName3', 'RoleName4'},
	['RoleName3'] = {'RoleName4'},
	['RoleName4'] = {}
}