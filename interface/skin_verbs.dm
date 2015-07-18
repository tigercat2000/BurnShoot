var/const/wikiurl = "https://github.com/sawu-tg/dragonroll/wiki"
var/const/giturl = "https://github.com/sawu-tg/dragonroll"
var/const/issuesurl = "https://github.com/sawu-tg/dragonroll/issues"

client/verb/github()
	set name = "github"
	set desc = "Visit the github."
	set hidden = 1
	if( giturl )
		if(alert("This will open github in your browser. Are you sure?",,"Yes","No")=="No")
			return
		src << link(giturl)
	else
		src << "\red The github URL is not set."
	return

client/verb/wiki()
	set name = "wiki"
	set desc = "Visit the wiki."
	set hidden = 1
	if( wikiurl )
		if(alert("This will open the wiki in your browser. Are you sure?",,"Yes","No")=="No")
			return
		src << link(wikiurl)
	else
		src << "\red The wiki URL is not set."
	return

client/verb/issues()
	set name = "issues"
	set desc = "Visit the issue tracker."
	set hidden = 1
	if( issuesurl )
		if(alert("This will open the issue tracker in your browser. Are you sure?",,"Yes","No")=="No")
			return
		src << link(issuesurl)
	else
		src << "\red The issue tracker URL is not set."
	return

/client/verb/hotkeys_help()
	set name = "Hotkeys Help"
	set category = "OOC"

	var/hotkey_mode = {"<font color='purple'>
Hotkey-Mode: (hotkey-mode must be on)
\tTAB = toggle hotkey-mode
\ta = left
\ts = down
\td = right
\tw = up
\tq = drop item / deselect cyborg module
\te = equip
\tr = toggle throw / unequip cyborg module
\tt = say
\tx = swap-hand
\tz = activate held object (or y)
\tf = cycle-intents-left
\tg = cycle-intents-right
\t1 = help-intent
\t2 = disarm-intent
\t3 = grab-intent
\t4 = harm-intent
</font>"}

	var/other = {"<font color='purple'>
Any-Mode: (hotkey doesn't need to be on)
\tCtrl+a = left
\tCtrl+s = down
\tCtrl+d = right
\tCtrl+w = up
\tCtrl+q = drop item / deselect cyborg module
\tCtrl+e = equip
\tCtrl+r = toggle throw / unequip cyborg module
\tCtrl+x = swap-hand
\tCtrl+z = activate held object (or Ctrl+y)
\tCtrl+f = cycle-intents-left
\tCtrl+g = cycle-intents-right
\tCtrl+1 = help-intent
\tCtrl+2 = disarm-intent
\tCtrl+3 = grab-intent
\tCtrl+4 = harm-intent
\tDEL = pull
\tINS = cycle-intents-right
\tHOME = drop item / deselect cyborg module
\tPGUP = swap-hand
\tPGDN = activate held object
\tEND = toggle throw / unequip cyborg module
</font>"}

	src << hotkey_mode
	src << other

/client/verb/hotkey_toggle()//toggles hotkey mode between on and off, respects selected type
	set name = ".Toggle Hotkey Mode"

	hotkeyon = !hotkeyon//toggle the var

	var/hotkeys = hotkeylist[hotkeytype]//get the list containing the hotkey names
	var/hotkeyname = hotkeys[hotkeyon ? "on" : "off"]//get the name of the hotkey, to not clutter winset() to much

	winset(usr, "mainwindow", "macro=[hotkeyname]")//change the hotkey
	usr << (hotkeyon ? "Hotkey mode enabled." : "Hotkey mode disabled.")//feedback to the user

	if(hotkeyon)//using an if statement because I don't want to clutter winset() with ? operators
		winset(usr, "mainwindow.hotkey_toggle", "is-checked=true")//checks the button
		winset(usr, "mapwindow.map", "focus=true")//sets mapwindow focus
	else
		winset(usr, "mainwindow.hotkey_toggle", "is-checked=false")//unchecks the button
		winset(usr, "mainwindow.input", "focus=true")//sets focus