LIST ch1_evidence = e1, e2, e3

=== chapter1 ===

= part1
~ INTERACTABLE = false
~ BG = CH01_EXP_BLACK
# NARRATOR
CHAPTER 1: LEAD A HORSE TO WATER
DECEMBER 8, 20XX \| 3:45 PM
~ BG = CH01_EXP_OUTSIDE
The light of the setting afternoon sun bathes the shanty houses beside the port in bright orange.
Even here, the holiday season greets the locals with cooler air and shorter days.
You gaze at the address you have written in your investigave notebook and look back at 3 story house made of cinderblocks and corrugated steel.

# AMY
I recently got a tip on the phone 'bout some shady dealins 'round the port area.
The witness didn't give me a name, but told me to meet him at this address as soon as I could.

~ INTERACTABLE = true
What should I do now?:
+ [Enter the house]
-
~ INTERACTABLE = false
# NARRATOR
You knock on the front door.
A moment later, a nervous looking man opens the door.
He scouts the area behind you and then quickly pulls you inside.
~ BG = CH01_EXP_INSIDE
# WITNESS
D-did you see any of them outside?

# AMY
Them?

# WITNESS
I'm being stalked.
Ever since I saw *that*, everywhere I go I feel like I'm being watched.
Not just by ordinary people either, I suspect a gang of monsters are watching me.

# AMY
That? Listen, its pretty clear that you're being spooked by somethin',
but I'm going to need ya to be a bit more clear, alright?
Why don't 'cha start of from the beginning?

# WITNESS
"Right, sorry."
"It all began a couple of days ago."
"I was coming home at 3 in the morning from my shift at a convinience store."
"I usually pass by this alley as a shortcut to get home faster, but that night there were two guys near a parked truck blocking the way."
"It looked like they had an accident and some of the stuff they were carrying spilled out."
"They were arguing, I think it had something to do about messing up their delivery."
"Anyway, it's a rough area and I didn't want to get involved."
"But suddenly their fight escalated."
"They were threatening each other and I think saw a flash of something metallic coming from one of the guy's hand."
"I thought it was a gun, so I got scared and tried to hide behind some trash."
"I was so scared."
"I just wanted to get away without getting noticed, so I tried to sneak away."
"But as I was about to pass around their truck, I slipped on some of the stuff that spilled out of their truck."
"It was a crate that was partially opened."
"Slime covered its exterior and I first thought that it was a large fish."
"But then it started moving and a human hand came out."
"It was a person attached to a fish!"

# AMY
Select an option:
+ "Attached to a fish?"
    # WITNESS
    "I honestly don't know what I saw."
    "It was dark, but there was for sure a person in that crate and it seemed like they were hiding inside a giant fish?"
+ "Were they alive?"
    # WITNESS
    "It was hard to tell. I was pretty scared already and didn't get a good look"
    "It was dark but I could swear I saw the person blinking, so they were probably still alive."

- A mermaid? # AMY
Whoever these people are, they're involved in some monster smuggling and traficking ring.

"Anyway, after seeing the person in the crate, I screamed."
"And that was when I caught those two guy's attention."
"They turned to me, and it became clear that they weren't human."
"One guy had claws several inches long while the other had a long sharp tongue."
"That was when I started running."
"I ducked in and out of random alleys but they kept chasing me."
"Then, as I rounded a corner, I hid in a large trashcan."
"I managed to lose them then."
"But ever since, I feel like I'm being watched."
"I've told the police but I'm not sure if they believe me."
"Since nothing really happened yet and I can't prove anything they told me to just wait."
"I don't have anybody I'm close to that can help either."
"But I saw your article on the paper. You took down that manananggal girl that was terrorizing that suburb."
"Please, you have to help me. I think that my life is in danger, and you may be the only one who can help."

# AMY
"Right, okay."
"I believe you."
"I'll see what I can do, but remember..."
"I'm a journalist, not a cop."
"Maybe if I can get enough evidence to get them arrested, you'd be safe."
"But, I can't promise anything."

# WITNESS
"Oh, thank you! Thank you!"
"Please, do your best!"
"I'm counting on you."

# AMY
Sheesh looks like this is going to be more trouble than a can of sardines in a feral cat's cage.
But big trouble can also mean big story...
"Alright!"
"Let's take this smuggler gang out!"

-> part2

= part2
# NARRATOR
You leave the house and step outside.
Its dusk now and shadows loom over everything abated only by the lights on the street and the pier.

~ BG = CH01_EXP_OUTSIDE

~temp first_select = ""
# AMY
I should head to the pier area to investigate.
If they're smugglin' illegal items, the pier's the perfect place to do it.
Boats 'll make transportin' goods a breeze.
But to take over a whole pier?
They must be a hardy bunch 'a criminals.

~ BG = CH01_EXP_PIER
# NARRATOR
You make your way to the pier area.
Flood lights fill the area with icy light that seems fitting with the chilly coastal air.
The pungent smell of the harbor is almost overwhelming.
In the distance, large cranes with dangling hooks litter the port.
All around you, there are various shipping containers in shades of maroon, green, and the occasional blue.
Strangely, there are not as many dock wokers as you'd expect.

# AMY
Geez, this place is a ghost town.
Still, could be trouble here.
I ought 'ta blend in to avoid any suspicion to myself.

- (area1)
~ INTERACTABLE = true
What should I investigate?
+ [Shipping crate 1]
    ~ INTERACTABLE = false
    {stopping:
    -   The inside is full of discarded packaging. Wait what's this on the floor?
    -   It's a crowbar!
        Not unusual to see in a dock, but...
        There! It looks to have some dried blood on it.
        {ch1_evidence !? ch1_evidence.e2:
            IMPRESSION FOUND  # NARRATOR
            # AMY
            "Okay!"
            I feel like I'm really getting to the bottom of this.
            ~ ch1_evidence += ch1_evidence.e2
        
            {LIST_COUNT(ch1_evidence) == 2:
                "I think I've investigated enough of the dock for now."
                
                # NARRATOR
                "You turn to leave the pier area."
                -> end_area1
            }
        }
    }
+ [Shipping crate 2]
    ~ INTERACTABLE = false
    {stopping:
    -   Looks like this one's locked.
    -   Hrrmpph, it's not use. I can't force it open.
    -   Sealed tight as the vaults of Bangko Sentral.
    }
+ [Shipping crate 3]
    ~ INTERACTABLE = false
    {stopping:
    -   It's mostly empty.
        Wait, what's this on the floor!
    -   Oh it's just a wet plastic bag.
    -   I feel... kind of silly.
    }
+ [Dock worker]
    ~ INTERACTABLE = false
    # DOCK_WORKER
    "What're you gawkin' at me fer?"
    
    # AMY
    "Oh sorry, I uhh."
    
    # DOCK_WORKER
    "Waait a minute, who are ya?"
    "Why're ya snoopin' 'round the dock fer?"
    "You with the popo?"
    
    # NARRATOR
    The dock work crosses his arms and narrows his eyes at you.
    
    # AMY
    I can't let him know the truth.
    + + ["I'm researching for my thesis."]
        "I'm uhh doing field work for my uhh thesis."
        "Yeah, its about the logistics of shipping and transportation."
        
        # DOCK_WORKER
        "Ehh, college boy huh?"
        "Where do you go? What're you takin'?"
        
        # AMY
        "I'm taking my masters in civil engineering at DLSU"
        
        # DOCK_WORKER
        "Scoff, listen fancy pants, you can't just go around here stickin' your nose where ever ya want."
    + + ["My motorcycle was stolen here"]
        "My uhh my motorcycle got stolen around here."
        "Yeah, im just lookin' around to see maybe if I could uhh..."
        "If there 're any witnesses or CCTV cameras 'round here that could've."
        
        # DOCK_WORKER
        "Stolen eh?"
        "Well that's too bad, but you can't just go around here stickin' your nose where ever ya want."
        
    - - "This place is dangerous, and its a serious work place."
        "So, if ya don't have propa' business to conduct here then scram!"
        
        # AMY
        "Aww please, I just need to ask a few questions 's all."
        "Just a few questions so I can come back with the proper requirements and protocols and whatnot."
        
        # DOCK_WORKER
        "Sigh... alright, whaddya need?"
        
    - - (area1_1)
    + + "What hours is the dock open?" # AMY
    
        # DOCK_WORKER
        "Well, technically the dock is always open."
        "But, its operatin' hours 's the usual 5 to 9"
        "Outside of that, the dock isn't too active."
        
        # AMY
        "5 to 9? You mean 9 to 5."
        
        # DOCK_WORKER
        "9 to 5? Hah! Whaddya think this is? Some kinda day spa?"
        "This is a pier, genius. It works 'round the clock to get ya the food you eat and junk you buy."
        "If we work hours were that short, heh, the city'd probably collapse by now."
    + + "Who runs this place?" # AMY
        
        # DOCK_WORKER
        "Mm, I ain't really supposed to say."
        
        # AMY 
        "Aww, c'mon. How am I supposed to ask permission if I don't know who to ask permission from?"
        
        # DOCK_WORKER
        "Sigh, alright. His name's Kit Balang, that's all I'll say."
        "If you really want to meet him, the shipping office's number's in the yellow pages."
        
        # AMY 
        Hmm... Kit... Balang?
        That name... it seems like...
        {ch1_evidence !? ch1_evidence.e1:
            IMPRESSION FOUND  # NARRATOR
            # AMY
            "Nice!"
            That should help unravel this whole mystery.
            ~ ch1_evidence += ch1_evidence.e1
        
        
            # DOCK_WORKER
            "What?"
        
            # AMY 
            "Oh it's sorry it's nothing."
        
        
            {LIST_COUNT(ch1_evidence) == 2:
                "Anyway, I have to go now"
                
                # NARRATOR
                "You turn to leave the pier area and walk back to the main road."
                -> end_area1
            }
        }
    + + "What do you mean by 'dangerous'?" # AMY
        
        # DOCK_WORKER
        "I mean IT'S DANGEROUS"
        "I ain't just wearin' this hard hat just to attract ladies ya know."
        "Besides, there's other things..."
        "Or ahem other people from 'round these parts that could be dangerous too."
        "These streets ain't like they used to tuts."
        "Gotta be careful now, ya never know what creepin' for ya just right 'round the corner."
        
        # AMY
        "Thanks, I'll be careful."
    + + "Nothing else." # AMY
        # DOCK_WORKER
        "Alright, now stop botherin' me."
        ~ INTERACTABLE = true
        -> area1
    
    - - - -> area1_1
+ [Go further in]
    ~ INTERACTABLE = false
    {stopping:
        - # DOCK_WORKER
        "Hey, you! Alice in wonderland."
        "Do yous think this place is some sorta theme park or somethin'?"
        "Authorized personnel only."
        
        #MC
        "Oh uh, sorry my bad."
        Hmm looks like I gotta find some other way to get in.
        - # DOCK_WORKER
        "How many times do I gotta says to you, AUTHORIZED PERSONNEL ONLY!"
        
        #MC
        !
        "Sorry!"
    }
    
- -> area1
    
- (end_area1) -> part3

= part3
~ INTERACTABLE = false
# NARRATOR
Before you could do anything, you suddenly feel a hand on your shoulder.
You turn around to see a hissing aswang winding up to punch you.
The aswang lands its blow right on your left eye.
It's supernatural strength leaving you substantially shaken.
You dazedly raise your fists to defend yourself.
The aswang tries to hit you again, but you block it this time.
It's time for a counter attack.
+ [Go for the head.]
    You swing for the monster's head.
+ [Go for the body.]
    You swing right for the monster's body.
+ [Go for the legs.]
    You try to sweep the monster's legs.
- It dodges your attack with inhuman speed.
Before you can recover, it knocks you back.
But instead of falling, a kapre catches you and stifles your mouth and nose with a rag.
~ BG = CH01_EXP_BLACK
Everything becomes hazy as you feel yourself fall unto the floor.
~ BG = CH01_EXP_BASEMENT
You wake up to find yourself in a cell.
There aren't any windows but judging from the smell it seems that you're still in the docking area.

#MC
Urgh, my head.
Where am I?
Looks like I'm in hotter water than a hotdog in a carnival concession stand.
I need to look for a way out before those grunts come back to finish the job.


- (area2)
~ INTERACTABLE = true
What should I investigate?
+ [Locked door]
    ~ INTERACTABLE = false
    # NARRATOR
    You rattle the door.
    
    # AMY
    Yeah, didn't expect it to be that easy.
    
    {inventory !? clip:
        Wait what's this?
        
        # NARRATOR
        You peer under the door and see something on the floor.
    
        # AMY
        A paper clip?
        Hmm... that could be useful for somethin'.
        But I'd need something slim to reach it through the door.
        {inventory ? newspaper:
            Oh! I can slip these newspapers under the door to reach that paper clip.
            I just need to...
            Got it!
            ~ inventory += clip
        }
    }
+ [Crack on the floor]
    ~ INTERACTABLE = false
    {stopping:
    -   Well this place is certainly no 5 star hotel.
    -   Wait a second...
        There something in this crack.
        I just need to something pointy to dig it out.
    }
    {inventory ? clip:
    -   This clip is the perfect tool for that.
        
        # NARRATOR
        You dig something out of crack.
        
        ~ inventory -= clip
    
        # AMY
        Hair?
        Gasp! Tikbalang hair!
        IMPRESSION FOUND # NARRATOR
         # AMY
        "Looks like that hair was a manifestation of an impression."
        "It's a good thing I spotted it."
        ~ ch1_evidence += ch1_evidence.e3
        Though... I'm not sure how useful that'll be seeing as how I'm still stuck in this room...
        -> part4
    }
+ [Papers on the floor]
    ~ INTERACTABLE = false
    Just some newspapers on the floor.
    Gotta say, I don't feel to good seein' the fruit of all my hardwork as a journalist bein' used as a glorified rag.
    {inventory !? newspaper:
        Although... This might prove to be useful.
        Might as well take it to be safe.
        ~ inventory += newspaper
    }
+ [Wet spot on the floor]
    ~ INTERACTABLE = false
    {stopping:
    -   There's a wet spot here...
        Gross.
        These guys need to get a better contractor to fix their roofing.
    -   At least I hope that's rain water.
        \*shivers\*
    }
+ [Lightbulb]
    ~ INTERACTABLE = false
    {stopping:
    -   It's an incandescent lightbulb.
    -   It's too high up to reach,
        but maybe if I had something to stand on...
    -   But even if I did reach it, I'm not too sure what use I'd have for a lightbulb.
    }
- -> area2

= part4
~ inventory = ()
~ INTERACTABLE = false
# NARRATOR
Your line of thought is interrupted by heavy footsteps followed by the clinking of keys on the door.

# AMY
Drats! I wasn't fast enough.
Whatever comes next, I have to face it head on.

# NARRATOR
From the door emerged a huge inhuman man with the head of a horse.
His eyes are glowing bright red as he snorts steam out of his flared nostrils.
He enters the room, suffocating the limited space you had in your enclosure.
You back up against the wall and ready yourself for a fight.

# KIT
NEIGHH
So you're the rat whose been snooping around my docks.
I'd ask you who you're working for but after we're done with you,
I'm sure the message will be very clear that the our gang is DEAD serious!

-> ch1_battle

= end
# AMY
"Alright, I can already feel this domain weakening."
"If I'm right then, the other goons of this place should be feeling it too."
"I must just be able to get out of this alive."

# KIT
"Heh."
"You really think it'll be that easy to defeat our gang."
"Mr. Ignacio will make sure you'll never live to tell anybody what you saw here today."

# AMY
Mr... what? I thought he was the head honcho here?
Darn it! I need to get out of here or all I've done so far will be for nothing!

# NARRATOR
You've defeated Kit, but you're still trapped in the shipping office's main building.
You  find a way out and discover more about this mysterious person Kit is alluding to.
CHAPTER END
+ [Return]
-> main