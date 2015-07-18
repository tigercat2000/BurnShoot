/atom/proc/update_icon()
	return

/atom/proc/visible_message(var/message)
	for(var/mob/M in viewers(src))
		M << message

/mob/visible_message(var/message, var/self_message)
	for(var/mob/M in viewers(src))
		var/msg = message
		if(self_message && M == src)
			msg = self_message
		M << msg