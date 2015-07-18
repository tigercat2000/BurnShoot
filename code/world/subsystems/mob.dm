/datum/controller/mob
	name = "Mob"
	execTime = 20

/datum/controller/mob/doProcess()
	if(living_mob_list.len)
		for(var/mob/M in living_mob_list)
			spawn(1)
				M.Life()
	scheck()