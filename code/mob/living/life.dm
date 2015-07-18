
//Life(), checks to see if the mob should be dead.
/mob/living/Life()
	check_health()

	if(lying && stat != STAT_DEAD)
		lying = 0

	..()

//proc checks health and handles what it should do- regen, nothing, set stat, or update the health counter
/mob/living/proc/check_health()
	if(health >= max_health)
		return 0

	if(health < max_health)
		attempt_regen()

	if(health <= 0)
		stat = STAT_DEAD

	if(health != prev_health)
		update_health_inv()

//checks if the mob can regenerate health, and does so if it can. Also handles prev_health.
/mob/living/proc/attempt_regen()
	if(regen && regen_rate)
		if(health < max_health)
			prev_health = health
			health = min(max_health, health + regen_rate)