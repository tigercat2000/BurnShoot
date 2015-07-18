/datum/hud
	var/mob/mymob

	var/list/adding
	var/list/other

/datum/hud/New(var/mob/owner)
	mymob = owner
	initialize()
	..()

/datum/hud/proc/initialize()
	if(!ismob(mymob))
		world << "HUD INIT FAILED: [mymob] IS NOT A MOB"
		return 0
	if(!mymob.client)
		world << "HUD INIT FAILED: [mymob] HAS NO CLIENT"
		return 0

	if(istype(mymob, /mob/living))
		livinghud()
	else
		return 1

/datum/hud/proc/livinghud()
	adding = list()
	other = list()

	var/obj/screen/using
	var/obj/screen/equipped/inv_box

	inv_box = new /obj/screen/equipped
	inv_box.name = "equipped item"
	inv_box.dir = SOUTH
	inv_box.icon_state = "equipped"
	inv_box.screen_loc = "WEST:6,SOUTH:5"
	inv_box.layer = 19
	mymob.equipped_display = inv_box
	src.other += inv_box

	using = new /obj/screen
	using.name = "drop item"
	using.dir = SOUTH
	using.icon_state = "equipped_drop"
	using.screen_loc = "WEST:32,SOUTH:5"
	src.other += using

	var/mob/living/mymobl = mymob

	using = new /obj/screen
	using.name = "health"
	using.dir = SOUTH
	using.icon_state = null
	using.screen_loc = "EAST-1,SOUTH:4"
	mymobl.health_display = using
	mymobl.update_health_inv()
	adding += using

	mymob.client.screen = null

	mymob.client.screen += other
	mymob.client.screen += adding