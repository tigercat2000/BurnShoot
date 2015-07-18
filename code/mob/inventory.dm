/mob
	var/obj/item/equipped_item
	var/obj/screen/health_display
	var/obj/screen/equipped_display

/mob/proc/get_equipped_item()
	if(equipped_item)	return equipped_item
	else	return null

/mob/proc/equip(var/obj/item/I)
	if(I && client)
		I.loc = src
		equipped_item = I
		client.screen |= I
		update_equipped_item()

/mob/proc/update_equipped_item()
	if(equipped_item)
		equipped_item.screen_loc = "WEST:6,SOUTH:5"
		equipped_item.layer = 20

/mob/proc/unequip()
	if(equipped_item)
		equipped_item.loc = get_turf(src)
		client.screen -= equipped_item
		equipped_item.layer = initial(equipped_item.layer)
		equipped_item = null
		update_equipped_item()

/mob/verb/drop_item()
	set name = "Drop equipped item"
	set desc = "Drops your currently equipped item."
	set category = "Object"

	if(!stat)
		src.unequip()