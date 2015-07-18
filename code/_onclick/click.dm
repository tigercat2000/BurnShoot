/*
	Click system borrowed from Paradise, licensed under AGPLv3
*/
//1 decisecond click delay for everything.
/mob/var/next_click = 0
/mob/var/next_move

/atom/Click(location, control, params)
	usr.ClickOn(src, params)
/atom/DblClick(location, control, params)
	usr.DblClickOn(src, params)





/mob/proc/ClickOn(var/atom/A, var/params)
	if(world.time <= next_click)	return
	next_click = world.time + 1

	if(stat)	return

	face_atom(A)

	if(next_move > world.time)
		return

	var/obj/item/W = get_equipped_item()

	if(W == A)
		W.attack_self(src)

	if(A.Adjacent(src))
		if(W)
			var/resolved = A.attackby(W,src)
			if(!resolved && A && W)
				W.afterattack(A,src,1,params)
		else
			if(ismob(A))
				changeNext_move(CLICK_CD_MELEE)
			UnarmedAttack(A)

	else // non-adjacent click
		if(W)
			W.afterattack(A, src, 0, params) // 0: not Adjacent
		else
			RangedAttack(A, params)




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

/mob/proc/changeNext_move(var/num)
	next_move = world.time + num

/mob/proc/UnarmedAttack(var/atom/A)
	if(ismob(A))
		changeNext_move(CLICK_CD_MELEE)
	return

/mob/living/UnarmedAttack(var/atom/A)
	..()
	A.attack_hand(src)

/mob/proc/RangedAttack(var/atom/A, var/params)
	return