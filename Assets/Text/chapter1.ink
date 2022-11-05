LIST ch1_evidence = e1, e2, e3

=== chapter1 ===

= part0
# NARRATOR
In the cool early morning air of the Wanila harbor,
the quiet of the night is disturbed by the sounds of the port.
There, workers pile crates into the back of an idling truck in the dead of night.

# UNKNOWN HIDDEN KIT
"Hrngf"
"Humph"
"That the last of it?"

# UNKNOWN HIDDEN GOON_1
"Huff"
"'s right boss."

# UNKNOWN HIDDEN KIT
"Good. You're getting on the truck too."
"Watch the hand-off, make sure there's no funny bussiness."

# UNKNOWN HIDDEN GOON_1
"On it boss."

-> part1

= part1
# NARRATOR
CHAPTER 1: LEAD A HORSE TO WATER
DECEMBER 8, 20XX \| 3:45 PM
The light of the setting afternoon sun bathes the shanty houses beside the port in bright orange.
Even here, the holiday season greets the locals with cooler air and shorter days.
You gaze at the address you have written in your investigave notebook and look back at 3 story house made of cinderblocks and corrugated steel.

# MC
I recently got a tip on the phone 'bout some shady dealins 'round the port area.
The witness didn't give me a name, but told me to meet him at this address as soon as I could.

# NARRATOR
You knock on the front door.
A moment later, a nervous looking man opens the door.
He scouts the area behind you and then quickly pulls you inside.

# UNKNOWN WITNESS
D-did you see any of them outside?

# MC
Them?

# UNKNOWN WITNESS
I'm being stalked.
Ever since I saw *that*, everywhere I go I feel like I'm being watched.
Not just by ordinary people either, I suspect a gang of halimaws are watching me.

# MC
That? Listen, its pretty clear that you're being spooked by somethin',
but I'm going to need ya to be a bit more clear, alright?
Why don't 'cha start of from the start?

# UNKNOWN WITNESS
"Right, sorry."
"It all began a couple of days ago."
"I work the night shift at a 24 hour convinience store, so I can come home pretty late at night."
"Around 3 in the morning, I was on my way home from work."
"I usually pass by this alley as a shortcut to get home faster, but that night there were two guys near a parked truck blocking the way."
"It looked like they had an accident and some of the stuff they were carrying spilled out."
"They were arguing, I think it had something to do about messing up their delivery."
"Anyway, it's a rough area and I didn't want to get involved."
"But suddenly their fight escalated."
"They were threatening each other and I saw a flash of something metallic coming from one of the guy's hand."
"I thought it was a gun, so I got scared and tried to hide behind some trash."
"I was so scared."
"I just wanted to get away without getting noticed, so I tried to sneak away."
"But as I was about to pass around their truck, I slipped on some of the stuff that spilled out of their truck."
"It was a crate that was partially opened."
"Slime covered its exterior and I first thought that it was a large fish."
"But then it started moving and a human hand came out."
"It was a person attached to a fish!"

# MC
!?
A mermaid?
They're likely involved in some halimaw smuggling and traficking ring.

"I screamed. And that was when I caught their attention."
"They turned to me, and it became clear that the two guys weren't human."
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

# MC
"Right, okay."
"I believe you."
"I'll see what I can do, but remember..."
"I'm a journalist, not a cop."
"Maybe if I can get enough evidence to unravel their whole operation, you'd be safe."
"But, I can't promise anything."

# UNKNOWN WITNESS
"Oh, thank you! Thank you!"
"Please, do your best!"
"I'm counting on you."

# MC
Sheesh looks like this is goiong to be more trouble than a can of sardines in a feral cat's cage.
But big trouble can also mean big story...
"Alright!"
"Let's take this smuggler gang out!"

-> part2

= part2
# NARRATOR
You leave the house and step outside.
Its dusk now and shadows loom over everything abated only by the lights on the street and the pier.

~temp first_select = ""
- (area1)
# MC
Where should I had off to now?
+ [Pier area]
    { first_select == "":
        I'll begin in the pier area. 
        ~ first_select = "pier"
    - else:
        Maybe the pier next?
    }
    If they're smugglin' illegal items, the pier's the perfect place to do it.
    Boats 'll make transportin' goods a breeze.
    But to take over a whole pier?
    Must be one tough gang.
    
    # NARRATOR
    You make your way to the pier area.
    Flood lights fill the area with icy light that seems fitting with the chilly coastal air.
    The pungent smell of the harbor is almost overwhelming.
    In the distance, large cranes with dangling hooks litter the port.
    All around you, there are various shipping containers in shades of maroon, green, and the occasional blue.
    Strangely, there are not as many dock wokers as you'd expect.
    
    # MC
    Geez, everybody clock out early or somethin'?
    Still, this place is likely a halimaw's domain.
    I oughtta blend in to avoid any untoward suspicion to myself.
    
    - - (area1_1)
    What should I investigate?
    + + [Shipping crate 1]
        {stopping:
            - It's just an empty shipping crate.
            - It's actually quite nice in 'ere.
                You could put a sofa over here, maybe an end table over there?
                What am I talking about, I need to focus.
        }
    + + [Shipping crate 2]
        {stopping:
            - Looks like this one's locked.
            - Hrrmpph, it's not use. I can't force it open.
            - As sealed shut as the vaults of Bangko Sentral.
        }
    + + [Shipping crate 3]
        {stopping:
            - It's mostly empty.
                Wait, what's this on the floor!
            - Oh it's just a wet plastic bag.
                I feel like I've got an omelette's worth of egg on my face just now.
        }
    + + [Dock worker]
        # DOCK_WORKER
        "What're you gawkin' at me fer?"
        
        # MC
        "Oh sorry, I uhh."
        
        # DOCK_WORKER
        "Waait a minute, who are ya?"
        "Why're ya snoopin' 'round the dock fer?"
        "You with the popo?"
        
        # NARRATOR
        The dock work crosses his arms and narrows his eyes at you.
        
        # MC
        I can't let him know the truth.
        + + + ["I'm researching for my thesis."]
            "I'm uhh doing field work for my uhh thesis."
            "Yeah, its about the logistics of shipping and transportation."
            
            # DOCK_WORKER
            "Ehh, college boy huh?"
            "Where do you go? What're you takin'?"
            
            # MC
            "I'm taking my masters in civil engineering at DLSU"
            
            # DOCK_WORKER
            "Scoff, listen fancy pants, you can't just go around here stickin' your nose where ever ya want."
        + + + ["My motorcycle was stolen here"]
            "My uhh my motorcycle got stolen around here."
            "Yeah, im just lookin' around to see maybe if I could uhh..."
            "If there 're any witnesses or CCTV cameras 'round here that could've."
            
            # DOCK_WORKER
            "Stolen eh?"
            "Well that's too bad, but you can't just go around here stickin' your nose where ever ya want."
            
        - - - "This place is dangerous, and its a serious work place."
            "So, if ya don't have propa' business to conduct here then scram!"
            
            # MC
            "Aww please, I just need to ask a few questions 's all."
            "Just a few questions so I can come back with the proper requirements and protocols and whatnot."
            
            # DOCK_WORKER
            "Sigh... alright, whaddya need?"
            
        - - - (area1_1_1)
        + + + "What hours is the dock open?" # MC
        
            # DOCK_WORKER
            "Well, technically the dock is always open."
            "But, its operatin' hours 's the usual 5 to 9"
            "Outside of that, the dock isn't too active."
            
            # MC
            "5 to 9? You mean 9 to 5."
            
            # DOCK_WORKER
            "9 to 5? Whaddya think this is? Some kinda day spa?"
            "This is a pier, genious. It works 'round the clock to get ya the food you eat and junk you buy."
            "If we work hours were that short, heh, the city'd probably collapse buy now."
        + + + "Who runs this place?" # MC
            
            # DOCK_WORKER
            "Mm, I ain't really supposed to say."
            
            # MC 
            "Aww, c'mon. How am I supposed to ask permission if I don't know who to ask permission from?"
            
            # DOCK_WORKER
            "Sigh, alright. His name's Kit, that's all I'll say."
            "If you really want to meet him, the shipping office's number's in the yellow pages."
            
            # MC 
            Hmm... Kit?
            That name... it seems like...
            {ch1_evidence !? e1:
                IMPRESSION FOUND # UNLOCK CH1_E2
                "Nice!"
                That should help unravel this whole mystery.
                ~ ch1_evidence += e1
            
            
                # DOCK_WORKER
                "What?"
            
                # MC 
                "Oh it's sorry it's nothing."
            
            
                {LIST_COUNT(ch1_evidence) == 2:
                    "Anyway, I have to go now"
                    
                    # NARRATOR
                    "You turn to leave the pier area and walk back to the main road."
                    -> end_area1
                }
            }
        + + + "What do you mean by 'dangerous'?" # MC
            
            # DOCK_WORKER
            "I mean IT'S DANGEROUS"
            "I ain't just wearin' this hard hat to attract ladies ya know."
            "Besides, there's other things..."
            "Or ahem other people from 'round these parts that could be dangerous too."
            "These streets ain't like they used to tuts."
            "Gotta be careful now, ya never know what creepin' for ya just right 'round the corner."
            
            # MC
            "Thanks, I'll be careful."
        + + + "Nothing else." # MC
            # DOCK_WORKER
            "Alright, now stop botherin' me."
            -> area1_1
        
        - - - -> area1_1_1
    + + [Go further in]
        {stopping:
            - # DOCK_WORKER
            "Ayo! Alice in wonderland."
            "Ya think this place is some sorta theme park or somethin'?"
            "Authorized personnel only."
            
            #MC
            "Oh uh, sorry my bad."
            Hmm look like I gotta find some other way to get in.
            - # DOCK_WORKER
            "How many times do I gotta says to you, AUTHORIZED PERSONNEL ONLY!"
            
            #MC
            !
            "Sorry!"
        }
    + + [Leave]
        { ch1_evidence ? e1:
            # NARRATOR
            You left the dock area.
            -> area1
         - else:
            # MC
            I can't leave yet.
            My gut's tellin' me there's somethin' I need to find here.
        }
        
    - - -> area1_1
+ [Alley where cargo spilled]
    { first_select == "":
        I'll start investigatin' that alley that the truck spilled over in. 
        ~ first_select = "alley"
    - else:
        Maybe I should investigate that alley that the truck spilled over in next.
    }
    They made quite the kerfuffle there and if that feller's bein' honest then they must have left in a jiffy.
    There's bound to be some leftover clues there.
    
    # NARRATOR
    You head towards the dimly lit alley where the truck had spilled over.
    The alley is narrow, it would barely be able to fit two cars side by side.
    With the debris and garbage around, it can barely fit one.
    
    # MC
    Fooey, this place 's more rank than a rotting fish's locker room.
    But... my gut's tellin' me there's somethin' important to find here.
    
    - - (area1_2)
    What should I investigate?
    + + [Skid marks]
        {stopping:
            - Someone was in a rush.
            - If they were goin' fast enough to leave skid marks, they were bound to get into an accident.
                Especially with how slick the road is from the rain.
        }
    + + [Mark on the wall]
        {stopping:
            - Looks like that kid was right.
            - This spot must've been where the truck got caught.
                With how narrow this alley is, I don't think I can really blame 'em.
        }
    + + [The ground]
        {stopping:
            - Eugh, the ground is covered in slime.
                If that store clerk's story is right, this is mermaid slime.
            - I wonder what they're doing transportin' a mermaid around in a crate for.
                You can bet they're probably transporting all sorts a illegal magical items too.
        }
    + + [Garbage pile 1]
        Huff, the things I do for this job.
        Wait a sec, there's something here?
        !
        A car air freshener?
        If this belongs to the truck then it could contain an...
        {ch1_evidence !? e2:
            IMPRESSION FOUND # UNLOCK CH1_E2
            "All right! That should be it for this area."
            ~ ch1_evidence += e2
            {LIST_COUNT(ch1_evidence) == 2: -> end_area1}
        }
    + + [Garbage pile 2]
        {stopping:
            - Nasty, it looks like a trash full of rotten food.
            - I'd rather not dig in there again.
        }
    + + [The poster]
        {stopping:
            - 'We will all rise from poverty,' tch. What a joke.
            - I've faced a lot of monsters, but nothin' scares me as much as local politics.
        }
    + + [Leave]
        { ch1_evidence ? e2:
            # NARRATOR
            You head back to where you were before.
            -> area1
         - else:
            # MC
            As happy as I'd be to leave this dank alleyway, my gut's telling me I need to find eomthing here first.
        }
    
    - - -> area1_2
    
- (end_area1) -> part3

= part3
# NARRATOR
You suddenly feel a hand on your shoulder.
You turn around to see a hissing aswang winding up to punch you.
The aswang lands its blow right on your left eye.
It's supernatural strength leaving you substantially shaken.
You dazedly raise you fists to defend yourself.
The aswang tries to hit you again, but you block it this time.
It's time for a counter attack.
* [Go for the head.]
    You swing for the monster's head.
* [Go for the body.]
    You swing right for the monster's body.
* [Go for the legs.]
    You try to sweep the monster's legs.
- It dodges your attack with inhuman speed.
Before you can recover, it knocks you back.
But instead of falling, a kapre catches you and stifles you with a rag.
Everything becomes hazy as you feel yourself fall unto the floor.
You wake up to find yourself in a cell.
There aren't any windows but judging from the smell it still seems that you're still in the docking area.

#MC
Urgh, my head.
Where am I?
Looks like I've been captured.
I need to look for a way out before anyone comes back.
- (area2)
What should I investigate?
+ [Locked door]
+ [Crack on the floor] // have the player look for something to dig the wall out
    {stopping:
        - Well this place is certainly no 5 star hotel.
        - Wait a second...
            There something in this crack.
            I just need to...
        - Dig a little deeper and...
            Hair?
            IMPRESSION FOUND # UNLOCK CH1_E3
            "Looks like an impression manifested itself in that crack."
            "It's a good thing I spotted it."
            ~ ch1_evidence += e3
            -> end_area1
    }
+ [Floor]
+ [Lightbulb]
- -> area2

-> end

= end
+ [Return]
-> main