/mob/living/proc/update_health_inv()
	if(health_display)
		health_display.maptext = text("<font size='5' color='red'>[health]</font>")
		health_display.maptext_height = world.icon_size * 2
		health_display.maptext_width = world.icon_size * 4