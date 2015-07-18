/client
	perspective = EYE_PERSPECTIVE


	var/hotkeytype = "QWERTY" //what set of hotkeys is in use(defaulting to QWERTY because I can't be bothered to ake this save on SQL)
	var/hotkeyon = 0 //is the hotkey on?

	var/hotkeylist = list( //list defining hotkey types, look at lists in place for structure if adding any if the future
		"QWERTY" = list(
			"on" = "hotkeymode",
			"off" = "macro"),
	)