/mob
	name = "mob"
	gender = FEMALE //for the hell of it really

	var/stat = STAT_ALIVE
	icon = 'icons/mob.dmi'

/mob/New()
	living_mob_list += src

/mob/proc/Life()
	if(stat == STAT_DEAD)
		Death()

/mob/proc/Death()
	living_mob_list -= src
	dead_mob_list += src