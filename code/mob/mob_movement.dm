/client
	var/move_delay = null

/client/Move()
	if(move_delay >= world.time)	return
	move_delay = world.time + 1
	return ..()

/mob/proc/facedir(var/ndir)
	dir = ndir
	client.move_delay = world.time + 1
	return 1


/mob/verb/eastface()
	set hidden = 1
	return facedir(EAST)


/mob/verb/westface()
	set hidden = 1
	return facedir(WEST)


/mob/verb/northface()
	set hidden = 1
	return facedir(NORTH)


/mob/verb/southface()
	set hidden = 1
	return facedir(SOUTH)