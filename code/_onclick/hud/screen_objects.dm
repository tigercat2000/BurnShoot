/obj/screen
	name = ""
	icon = 'icons/mob/screen1.dmi'
	layer = 20.0
	var/obj/master = null

/obj/screen/equipped
	icon_state = "equipped"

/obj/screen/equipped/Click(location, control, params)
	if(world.time <= usr.next_move)
		return 1
	if(usr.stat)
		return 1
	if(master)
		var/obj/item/I = usr.get_equipped_item()
		if(I)
			master.attackby(I, usr, params)
	return 1

/obj/screen/Click(location, control, params)
	if(!usr)	return 1

	if(usr.stat)	return 1

	switch(name)
		if("drop item")
			usr.unequip()