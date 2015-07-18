/mob/living
	name = "player"

	var/health = 100
	var/max_health = 100

	var/regen = 0
	var/regen_rate = 1

	var/lying = 0
	var/lying_prev = 0

	icon_state = "living"

/mob/living/Life()
	check_health()

	if(lying && stat != STAT_DEAD)
		lying = 0

	..()

/mob/living/Death()
	lying = 1
	update_lying()
	..()

/mob/living/proc/check_health()
	if(health >= max_health)
		return 0

	if(health < max_health)
		attempt_regen()

	if(health <= 0)
		stat = STAT_DEAD

/mob/living/proc/attempt_regen()
	if(regen && regen_rate)
		if(health < max_health)
			health = min(max_health, health + regen_rate)

/mob/living/proc/get_standard_pixel_y_offset()
	if(lying)
		return -6
	else
		return initial(pixel_y)

/mob/living/proc/update_lying()
	var/matrix/M = matrix()
	var/final_pixel_y = get_standard_pixel_y_offset()
	if(lying)
		M.Turn(90)

	lying_prev = lying
	animate(src, transform = M, time = 2, pixel_y = final_pixel_y)