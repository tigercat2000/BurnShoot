/obj/item/proc/attack_self(var/mob/user)
	return

/atom/proc/attack_hand(var/mob/living/user)
	return

/atom/proc/attackby(var/obj/item/W, var/mob/living/user, params)
	return

/atom/movable/attackby(var/obj/item/W, var/mob/user, params)
	user.changeNext_move(CLICK_CD_MELEE)
	visible_message("<span class='danger'>[src] has been hit by [user] with [W].</span>")

/mob/living/attackby(var/obj/item/I, var/mob/user, params)
	user.changeNext_move(CLICK_CD_MELEE)
	if(istype(I) && ismob(user))
		I.attack(src, user)

/obj/item/proc/afterattack(var/atom/target, var/mob/user, var/proximity_flag, var/click_paramaters)
	return

/obj/item/proc/attack(var/mob/living/M, var/mob/living/user)
	if(!istype(M))
		return 0

	var/messagesource = M

	if(hitsound && force > 0)
		playsound(loc, hitsound, 50, 1, -1)

	var/showname = "."
	if(user)
		showname = " by [user]."
	if(!(user in viewers(M, null)))
		showname = "."

	for(var/mob/O in viewers(messagesource, null))
		if(attack_verb.len)
			O << "<span class='danger'>[M] has been [pick(attack_verb)] with [src][showname]</span>"
		else
			O << "<span class='danger'>[M] has been attacked with [src][showname]</span>"

	if(!showname && user)
		if(user.client)
			user << "<span class='danger'>You attack [M] with [src].</span>"

	return M.attacked_by(src, user)