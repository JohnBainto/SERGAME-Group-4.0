=== chapter1 ===
= part1
# NARRATOR
CHAPTER 1: FALLING RAIN AND FRYING MEAT
JULY 8, 20XX \| 6:25 PM
The sounds of sizzling tapa on the grill blends with pitter patter of rain on the pavement outside.
The stench of grease permeates through the humid monsoon season air in the nearly empty restaurant.
# MC
Looks like that dame was right about this shady restaurant. it's nearly dinner rush and this place is more deserted than the sahara at noon.
Last week I had a Jane Doe come to me with a hot tip about some strange happenings in a local pares shop.
Said that she and her beau ate at a strange diner they've never seen before and claims the food there made her husband sick.
Now, food poisoning is hardly anything I'd consider investigation worthy but the thing is her hubby didn't just get any old case of the big BM.
No, she says he started actin' crazy, crazed blood shot eyes, feral hungry stare, mouth dripping with saliva, the works.
The night before they were gonna head out to a hospital... Bam! He vanishes.
Snuck out in the middle of the night and still missing.
I asked her why she didn't get any of the same symptoms and she claims that the waiter of restuarant convinced her husband to order from a special <color=red>NIGHT MENU</color> after they finished dinner.
Thinkin' that it was just some desert menu she tried to order something too, but apparently they didn't let her and just made up an excuse. Something about her not being chosen?
Now, all this was getting too fishy and so I decided to follow her lead and investigate.
Other locals I've talked to in the area say they've seen a restaurant popping up in and out in random locations.
An empty stall the night before, suddenly turning into a fully furnished pares house the next day.
The location changes every night but everyone I've talked has said the same thing: it only appears around night time.
After searching a while, I've finally managed to track it down, and well... here I am.

- (restuarant)
+ [Look at walls]
    {stopping:
        - The walls here are so bare, not a lick 'a paint or even any posters.
        - This place is giving me the heeby jeeebies.
        // get new evidence
    }
+ [Look at kitchen door]
    {stopping:
        - Seems like that's the door to the kitchen. It has a sign that says staff only. I wonder if I could sneak in there.
        - Nah, I don't think they'd just let any rando waltz right through their kitchen like that.
    }
+ [Inspect booth 1]
    {stopping:
        - Huh, that's strange, the booth's empty.
        - You'd expect that there'd be more diners here for dinner.
            Heh. dinner diners.
    }
+ [Inspect booth 2]
    {stopping:
        - My gut's really tellin' me there's something off about this place.
        - There's nobody there.
    }
+ [Inspect booth 3]
    # NARRATOR
    You take a look at the seats at a booth near the back.
    The booths are cushioned with blood red upholstery and the table is clean if not a little greasy.
    Sit here? (You will no longer be able to investigate this area further)
    * * [Yes.]
        You take a seat in the booth.
        -> make_order
    * * [No.]
+ [Inspect counter]
    # NARRATOR
    There are some stools lined along the counter.
    Behind it, a large menu lists down food items and their prices. All the food here seem pretty cheap.
    Sit here? (You will no longer be able to investigate this area further)
    * * [Yes.]
        You decided to sit at the counter.
        You plop yourself on top of the circular steel and place your elbows on the cold stainless steel surface of the counter. -> make_order
        -> make_order
    * * [No.]
- -> restuarant

- (make_order) The waiter approaches you. His eyes are vacant as he hands you a laminated menu. The edges of it are frayed where the two pieces of plastic are starting to unbind.
# NARRATOR
The waiter stares at you blankly.
You think about what to order.
# MC
"Hmm... "
~ temp order = "none"
+ "I'll have some buttered chicken"
    ~ order = "buttered chicken"
+ "I'll have some pares"
    ~ order = "pares"
+ "Can I order from the <color=red>night menu?</color>" -> part2
# NARRATOR
The waiter hots down your order and unceremoniously heads towards the kitchen.
# MC
Man, no wonder nobody's here the service is terrible.
# NARRATOR
You take a moment to examine your surroundings looking for anything suspicious.
A few moments later, the waiter returns with your order
# WAITER
"One piece {order} for dine in."
# NARRATOR
You stop the waiter as he turns to leave
# MC
"Ah wait a minute, I actually wanted to ask you about something."
+ [Ask about the food.]
    "I just wanted to ask about the food I got."
    # NARRATOR
    You quickly glance at your food trying to make up an excuse to stop the waiter from leaving, but even upon closer inspection the food looks completely normal.
    + + [\(Lie) The food is strange.]
        # MC
        Doesn't the food seem strange to you? 
    + + \(Lie) [I'm a food blogger.]
        # MC
        See, I'm a foodie blogger and I just wanted to know more about... 
+ [Ask about the owner.]
    # MC
    "I just wanted to ask about the guy who runs this place"
    "'Cause uhh... this place is real nice... and uhhh..."
+ [Ask about the restaurant location.]
    # MC
    "I just wanted to ask about this joint, it's new right?"
    "I'm just kind of surprised 'cause I live around the area and I've never seen it before"
    "Though it is sorta familiar, do you guys have any other franchises maybe?"
- -> part2

-> part2

= part2
# NARRATOR
The waiter eyes you suspiciously. Suddenly, a stern looking woman loudly comes out of the kitchen door interrupting you.
She and the waiter exchange a nearly imperceptible nod.
# MAYA # UNKNOWN_NAME
"Excuse me sir, but I think you need to leave."
"You're disrupting the other customers."
# MC
"Sorry doll, but I think ya need to get yer glasses checked cause I'm the only one he-"
# NARRATOR
You turn to gesture to the rest of the restaurant but you notice it's now full of people.
Nearly every chair has a person sitting on it looking directly at you with the same thousand-yard stare the waiter has.
# MC
"Ahem, apologies, it's my mistake."
"I'll just be heading on out now."
# NARRATOR
As you are about to leave the restaurant into the rain, you feel a hand tap on your shoulders. You turn to see the same woman behind you holding out a brown bag.
# MAYA
"Sir, your takeout."
# MC
Cheezy crepes! She's certainly light on her foot.
I didn't even hear anyone coming up behind me.
"Ah, thank you... for that."

# NARRATOR
You head outside to the sidewalk with the overhang of the building above keeping you dry for the most part.
You think about your next move.

# MC
Well this is turnin' out to be a total creep show. 
Seems like that dame's the head honcho seeing as everybody else there can pass as an extra in a zombie movie.
Hmmm... I need to collect more evidence.
What should I do now?
+ [Go to the back of the building.]
- Surely tere has to be something I can find around here.

- (outside)
+ [Inspect back door]
+ [Inspect garbage pile 1]
* [Inspect garbage pile 2]
    * * (moved_garbage) Move the garbage pile
* {moved_garbage} [Inspect grate.]
- -> outside

-> end

= end
+ [Return]
-> main