




TppPadOperatorUtility = {













































Init = function()

	

	
	TppPadOperatorUtility.RegisterPlayerMaskSettings{
		registerName = "MB_TopMenu",
		masks = {
			exceptSetting	= true,
			buttonNames		= { "MB_DEVICE", "PL_DASH", "PL_SQUAT" },
			stickNames		= { "PL_STICK_L", "PL_STICK_R", },
		},
	}

	
	TppPadOperatorUtility.RegisterPlayerMaskSettings{
		registerName = "MB_MenuOperation",
		masks = {
			exceptSetting	= true,
			buttonNames		= { "MB_DEVICE", },
			
		},
	}

	
	TppPadOperatorUtility.RegisterPlayerMaskSettings{
		registerName = "MB_OnlyMode",
		masks = {
			exceptSetting	= true,
			buttonNames		= { "MB_DEVICE", },
		},
	}

	
	TppPadOperatorUtility.RegisterPlayerMaskSettings{
		registerName = "MB_Disable",
		masks = {
			exceptSetting	= false,
			buttonNames		= { "MB_DEVICE", },
		},
	}

	
	TppPadOperatorUtility.RegisterPlayerMaskSettings {
		registerName = "All",
		masks = {
			exceptSetting = true,
			buttonNames		= {},
			stickNames		= {},
		},
	}


	
	
	TppPadOperatorUtility.RegisterPlayerMaskSettings{
		registerName = "Hospital_Wait",
		masks = {
			exceptSetting	= false,
			buttonNames		= { "PL_HOLD" },
			stickNames		= { "PL_STICK_L", },
		},
	}

	
	TppPadOperatorUtility.RegisterPlayerMaskSettings{
		registerName = "Hospital_DisableLStick_DEMO",
		masks = {
			exceptSetting	= false,
			stickNames		= { "PL_STICK_L", },
		},
	}

	
	TppPadOperatorUtility.RegisterPlayerMaskSettings{
		registerName = "Hospital_DisableRStick",
		masks = {
			exceptSetting	= false,
			stickNames		= { "PL_STICK_R", },
		},
	}














	
	TppPadOperatorUtility.RegisterPlayerMaskSettings {
		registerName = "CannotSubjectiveCamera",
		masks = {
			exceptSetting = false,
			buttonNames = { "PL_SUB_CAMERA" },
		},
	}

	
	TppPadOperatorUtility.RegisterPlayerMaskSettings{
		registerName = "ConstCamera",
		masks = {
			exceptSetting	= true,
			buttonNames		= {},
			stickNames		= {},
		},
	}

	
	TppPadOperatorUtility.RegisterPlayerMaskSettings {
		registerName = "ScopeTutorial",
		masks = {
			exceptSetting	= true,
			buttonNames		= { "PL_SUB_CAMERA", "PL_CALL", "PL_ZOOM_CHANGE",
								"PL_ZOOM_IN", "PL_ZOOM_OUT" },
			stickNames		= { "PL_STICK_R", },
		},
	}

	
	TppPadOperatorUtility.RegisterPlayerMaskSettings{
		registerName = "OpenPresetRadio",
		masks = {
			exceptSetting	= false,
			
			buttonNames		= { "PL_SQUAT",
								"PL_ACTION",
								"PL_RELOAD",
								"PL_PICKUP_WEAPON"
							},
		},
	}

	
	TppPadOperatorUtility.RegisterPlayerMaskSettings{
		registerName = "CameraOnly",
		masks = {
			exceptSetting	= true,
			buttonNames		= {},
			stickNames		= {"PL_STICK_R"},
		},
	}
end,

SetStickMapping = function( leftRate, rightRate )
	local players = Ch.FindCharacters("Player")
	local player = players.array[1]
	local playerPadOperator = player:FindPluginByName( "PadOperator" )
	playerPadOperator.leftStickMappingRate = leftRate
	playerPadOperator.rightStickMappingRate = rightRate



end,
SetLeftStickMapping = function( leftRate )
	local players = Ch.FindCharacters("Player")
	local player = players.array[1]
	local playerPadOperator = player:FindPluginByName( "PadOperator" )
	playerPadOperator.leftStickMappingRate = leftRate



end,

} 

