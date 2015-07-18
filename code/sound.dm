//Borrowed from Paradise Station (NSS Cyberiad), which is licensed under AGPLv3.

/proc/playsound(var/atom/source, var/soundin, var/vol as num, var/vary, var/extrarange as num, var/falloff, var/is_global)

	if(isarea(source))
		CRASH("[source] is an area and is trying to make the sound: [soundin]")
		return

	var/frequency = get_rand_frequency()
	var/turf/turf_source = get_turf(source)

	for(var/P in player_list)
		var/mob/M = P
		if(!M || !M.client)
			continue

		var/distance = get_dist(M, turf_source)
		if(distance <= (world.view + extrarange) * 3)
			var/turf/T = get_turf(M)

			if(T && T.z == turf_source.z)
				M.playsound_local(turf_source, soundin, vol, vary, frequency, falloff, is_global)

var/const/FALLOFF_SOUNDS = 0.5

/mob/proc/playsound_local(var/turf/turf_source, var/soundin, var/vol as num, var/vary, var/frequency, var/falloff, var/is_global)
	if(!src.client)	return

	var/sound/S = sound(soundin)
	S.wait = 0 //No queue
	S.channel = 0 //Any channel
	S.volume = vol
	if(vary)
		if(frequency)
			S.frequency = frequency
		else
			S.frequency = get_rand_frequency()

	if(isturf(turf_source))
		var/turf/T = get_turf(src)

		var/distance = get_dist(T, turf_source)

		S.volume -= max(distance - world.view, 0) * 2

		if(S.volume <= 0)
			return

		var/dx = turf_source.x - T.x
		S.x = dx
		var/dz = turf_source.y - T.y
		S.z = dz
		S.y = 1
		S.falloff = (falloff ? falloff : FALLOFF_SOUNDS)
	src << S


/proc/get_rand_frequency()
	return rand(32000, 55000) //Frequency stuff only works with 45kbps oggs.