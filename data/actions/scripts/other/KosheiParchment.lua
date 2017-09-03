local config = {
        storage = 14050,
        key_id = 1987 -- Bag ID

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a bag.")
                key = doPlayerAddItem(cid, config.key_id, 1)
				local parch1 = doAddContainerItem(key, 1951, 1)
				doSetItemText(parch1, "PAGE 3\n\n...He often paid Drefia a visit which was a blooming haven during this time. Rumour has it that he has something to do with it turning into an undead city. These rumours are mainly based on his interest in the pyramid to the North, which is known to have been created by the beholder race. Needless to say that these creatures are also linked with the appearance of undead creatures. His interceders say that he was always a man of belief that he never had anything evil in mind. He was often seen in the crypts of Darashia to pray to the Gods. As quickly as he had come, as quickly he disappeared and was nevere seen again.")
				local parch2 = doAddContainerItem(key, 1951, 1)
				doSetItemText(parch2, "PAGE 2\n\nLord Koshei the Curious\n-_-_-_-_-_-_-_-_-_-_-_-\nDate of birth: unknown\nAge: unknown\nHometown: unknown\nDate of death: unknown\n\nThere are not many things known about this man. He appeared out of nowhere and lived here for nearly ten years. Even though he was communicative, he never told anything about his profession or what he did for a living. First he lived in Darashia 2, Flat 11 for about two years. During that time he was roaming around, travelling the lands of Darama and often visisting the Bath of Dreams and the minotaur pyramid in the North. Then it was discovered he had built a tower south of the mountains. It is unexplained how he managed to do that because no one has been seen to help him. Anyway, the remains of his tower are still there...")
				local parch3 = doAddContainerItem(key, 1951, 1)
				doSetItemText(parch3, "PAGE 1\n\nFamous inhabitants of Darashia\n\n<You have found this very old book that seems out of place among the other books. As you leaf through the yellowed pages you see the description of a person on each left side and the painted portrait of this person on the right side. One person catches your attention. Not only does he have aninappropriate title, also his appearance is strange - on the one hand he looks friendly, almost funny - on the otherhand, his eyes seem to look directly into your soul. Eye-catching is the amulet he is wearing. You read the following and feel very uncomfortable with the portrait staring at you. You tear out those two pages and take them with you after having made sure nobody is watching you.>")
        else
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The shelf is empty.")
        end
end