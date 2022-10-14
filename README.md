# ImprovedDiscordPEDPerms

## What is it?
ImprovedDiscordPEDPerms is a Discord based PED restriction script. It is a fork of [JaredScar's original DiscordPedPerms](https://github.com/JaredScar/DiscordPedPerms) - I have updated the script to use fxmanifest, added inheritances for roles and also added t-notify integration.

## Requirement
https://forum.cfx.re/t/release-badger-discord-api/1698464

## Configuration
* It should be noted that for `Config.Inheritances`, the roleNames and roleIDs should match up with the ones specified in `Config.PEDRestrictions`.

* Also, inheritance only inherits the role groups listed. Inheriting `RoleName2` which inherits `RoleName1` would not be inherited for `RoleName3`.
```lua
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
	['Test1'] = {}
}
```
## Download
https://github.com/IC-Technologies/ImprovedDiscordPEDPerms
