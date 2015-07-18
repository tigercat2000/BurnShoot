/obj/item
	icon = 'icons/obj/item.dmi'

	var/hitsound = null
	var/force = 0
	var/list/attack_verb = list()

/obj/item/attack_hand(var/mob/user)
	if(user && !user.stat)
		user.equip(src)

/obj/item/weapon/buzzgun
	name = "buzzgun"

	icon_state = "buzzgun"
	hitsound = 'sounds/bikehorn.ogg'
	force = 5

/obj/item/weapon/buzzgun/attack_self(var/mob/user)
	user.visible_message("blou")