/world
	turf = /turf/floor
	mob = /mob/living
	view = "17x17"
	fps = 30
	icon_size = 32

/world/New()
	. = ..()

	CS = new
	CS.addControl(new /datum/controller/mob)
	CS.process()