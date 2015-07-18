/mob/living
	name = "player"

	var/prev_health = 100
	var/health = 100
	var/max_health = 100

	var/regen = 0
	var/regen_rate = 1

	var/lying = 0
	var/lying_prev = 0

	icon_state = "living"

/mob/living/Death()
	lying = 1
	update_lying()
	..()


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

/mob/living/proc/attacked_by(var/obj/item/W, var/mob/user)
	if(W.force)
		deal_damage(W.force)
	return 1

/mob/living/proc/deal_damage(var/amount)
	if(amount <= 0)	return 0

	health -= amount
	update_health_inv()
	return 1