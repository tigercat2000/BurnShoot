/*
	Click system borrowed from Paradise, licensed under AGPLv3
*/
//1 decisecond click delay for everything.
/mob/var/next_click = 0

/atom/Click(location, control, params)
	usr.ClickOn(src, params)
/atom/DblClick(location, control, params)
	usr.DblClickOn(src, params)





/mob/proc/ClickOn(var/atom/A, var/params)
	if(world.time <= next_click)	return
	next_click = world.time + 1

	face_atom(A)

/mob/proc/DblClickOn(var/atom/A, var/params)
	return

/mob/proc/face_atom(var/atom/A)
	if(!A || !x || !y || !A.x || !A.y ) return

	var/dx = A.x - x
	var/dy = A.y - y
	if(!dx && !dy) return

	var/direction
	if(abs(dx) < abs(dy))
		if(dy > 0)	direction = NORTH
		else		direction = SOUTH
	else
		if(dx > 0)	direction = EAST
		else		direction = WEST

	dir = direction