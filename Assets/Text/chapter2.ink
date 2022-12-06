LIST ch2_evidence = e1, e2, e3
=== chapter2 ===
~ ch0_evidence += ch0_evidence.e1
~ ch1_evidence += ch1_evidence.e1
~ ch1_evidence += ch1_evidence.e2
~ ch1_evidence += ch1_evidence.e3
~ INTERACTABLE = false
~ BG = CH02_EXP_BLACK
# NARRATOR
# LOAD CODEX
CHAPTER 2: SLEEPING WITH THE FISHES
DECEMBER 8, 20XX \| 11:02 PM
~ BG = CH02_EXP_BASEMENT
Kit's defeated body lays on the floor near you.
Just beyond you, the door to your cell has been left open.


- (area1)
~ INTERACTABLE = true
# AMY
What should I do now?
+ [Kit]
    ~ INTERACTABLE = false
    {stopping:
    -   That's right Kit said something about a boss?
        Somebody more powerful than Kit...
        Hmm... that's gotta mean..!
        IMPRESSION FOUND # NARRATOR
        # AMY
        That's right, I can still feel the presence of a monster's domain.
        If he were the only boss here, the domain should have dissolved after he was defeated.
        "Mr Ignacio..."
        "Ugh, just my luck."
        "Guess I'm in for another battle with whoever that is."
        "I really need get out of here and solve this case quick."
        ~ ch2_evidence += ch2_evidence.e1
    -   I better get out of here before he wakes up.
    }
+ [Door]
    ~ INTERACTABLE = false
    {ch2_evidence ? ch2_evidence.e1:
        Alright! Time to make like tree and leave.
        ->end_area1
    - else:
        {stopping:
        -   Hmm...
            I don't think I should leave just yet.
            I feel like I'm missing something.
        -   Something Kit said..?
        }
    }
- -> area1

- (end_area1)

~ INTERACTABLE = false
~ BG = CH02_EXP_HALLWAY
# NARRATOR
You step out into the narrow hallway.
The wall are made of exposed hollow blocks with a peeling layer of white paint.
Its quiet except for the faint buzzing of the florescent light bulbs above and the distant sounds of the pier outside.
You turn to look at the room you were brought to.

# AMY
Hmm... I ought 'ta lock 'em in there for when he comes to.

# NARRATOR
You lock the door, leaving Kit inside.

- (area2)
~ INTERACTABLE = true
# AMY
Okay what should I do now?
+ [Door 1]
    ~ INTERACTABLE = false
    {stopping:
    -   You rattle the door knob. # NARRATOR
        # AMY
        Nope, there's no way he's getting out of there.
    -   Gotta make sure he's really locked in there.
    }
+ [Door 2]
    ~ INTERACTABLE = false
    {stopping:
    -   You rattle the door knob. # NARRATOR
        # AMY
        Mmph, it not openin'.
    -   Open sesame!
        ...
        It was worth a shot.
    }
+ [Exposed electrical wiring]
    ~ INTERACTABLE = false
    # NARRATOR
    A couple of exposed wires dangle from the wall.
    The frayed ends crackle and pop with little bolts of lightning.

    {stopping:
    -   # AMY
        Jeepers! I almost shocked myself.
        These really have no business being exposed like this.
        Although... maybe I could use this for my escape somehow.
    -   # AMY
        Hmm..> I don't have the right tools to open it up and I'm not really too keen on sticking my fingers in there.
    }
    {
    -   inventory ? detector:
        If this weren't dangerous before, it certainly is now that its wet!
    -   inventory ? newspaper:
        Wait, if I use those newspapers I got to connect these two wires...

        # NARRATOR
        You put the newspapers you collected up to the exposed wires.
        Nothing seems to happen at first.
        Then slowly, the parts of the paper touching the wires start turning into darker shades of brown until smoke starts emanating from the newspaper,
        You hold it there until it fully catches on fire.

        ~ inventory -= newspaper
        ~ inventory += fire

        # AMY
        Eureka!
        Now I just need to get this closer to the fire alarm.
    }
+ [Newspapers on the floor]
    ~ INTERACTABLE = false
    {stopping:
    -   More news papers on the floor, it really breaks my heart to see a journalist's hardwork taken for granted like this.
        I guess I'll take some of it anyway in case I need it.
    -   I hope somebody at least read these...
    }
    {inventory !? newspaper:
        ~ inventory += newspaper
    }
+ [Smoke detector]
    ~ INTERACTABLE = false
    {stopping:
    -   It looks like one 'a those smoke detectors.
    -   It supposed to trigger a fire alarm if it detects smoke.
        I wonder if I can use that for my escape.
    }
    {inventory ? fire:
        # NARRATOR
        You reach up to get the flaming newspaper as close to the fire alarm as possible.

        # AMY
        C'moon...

        # NARRATOR
        The fire alarm starts beeping out a steady high pitched tune.
        All along the ceiling, water sprinklers start coming to life.
        You let the burning piece of newpaper you are holding fall onto the wet floor where it is quickly extinguished.

        # AMY
        Nice! This should distract those goons outside.
        ~ inventory -= fire
        ~ inventory += detector
    }
+ [Stairs]
    ~ INTERACTABLE = false
    {inventory !? detector:
        {stopping:
        -   You ascend the stairs stopping just before a door that leads outside. # NARRATOR
            You can hear faint voices coming from the other side.

            # AMY
            Rats! Those goons must be guarding outside.
            I can't let them know I'm out and about.
        -   I don't think I can take 'em on in a fight.
            My eye's still achin' from that one punch.
            I need to find a way to get out without being noticed
        }
    - else:
        # NARRATOR
        You put your ear to the door to see if the guards outside have left.

        # GOON1
        Ach! everything's wet!

        # GOON2
        Ngrrhh!
        Go check what made the fire alarm go off and see if Kit's okay down stairs.
        I'll go out and get help.

        # GOON1
        Alright.

        # AMY
        Corn nab it!
        They're comin' here!
        I need to hide.

        # NARRATOR
        You quicly hid yourself underneath the stairs just in time before the door swung open.
        You recognize the kapre running down the stairs from when you were attacked earlier.
        In the monster's rush to get downstairs, he did not even notice you holding your breath under the staircase.
        You quickly slip out the door after he is some distance away.
        -> end_area2
    }
- -> area2

- (end_area2)
~ inventory = ()
-> part2

= part2
~ BG = CH02_EXP_BLACK
# NARRATOR
You exit into the main area of shipping office.
The door leading outside of the building is wide open exposing the interior of the building to heavy rain.
In combination with the sprinklers, there is a good inch of water pooling on the ground.

# AMY
Mmph!
All this water... serving as a distraction.
It feels like a...
IMPRESSION FOUND # NARRATOR
# AMY
"Who would 'a thought all that water would have contained an impression."
"Phew! It's good that I found that, but I really need get out of here."
~ ch2_evidence += ch2_evidence.e2

# NARRATOR
You run out of the shipping office into the pier area.

~ BG = CH02_EXP_PIER_WET
Heavy torrents of rain fall all around you reducing visibility.
Whatever parts that you managed to keep dry from the water sprinklers are now thoroughly drenched as well.

# AMY
Just my luck.
I need to find a way to get out of here despite the rain.

# NARRATOR
As you began to move forward, a strong wave suddenly crashed into the pier.
You managed to hold on to the walls of the shipping office to avoid getting swept away completely.
Once you reoriented yourself, you notice that the way you came from has now been blocked by a flipped over shipping container.

# AMY
Ugh! Just perfect.
I need to find a way around to get out.

- (area3)
~ INTERACTABLE = true
What should I do now?
+ [Shipping container 1]
    ~ INTERACTABLE = false
    {stopping:
    -   Can't anything ever be easy!
        That wave pushed these shipping containers over here and now the exit's blocked.
    -   I need to find a way around to get out.
        Or maybe over?
    }
+ [Shipping container 2]
    ~ INTERACTABLE = false
    {stopping:
    -   Looks like I can't get passed beyond this point.
        There's too much debris in the way.
    -   I wonder if there's another way out.
    }
+ [Washed up fish]
    ~ INTERACTABLE = false
    # NARRATOR
    There are a couple of fish flopping around the ground of the docks.

    # AMY
    That wave must have washed these fish over here.
    This is honestly a pretty perfect metaphor for my situation.
    {ch2_evidence !? ch2_evidence.e3:
        Wait these fish remind me of something...
        IMPRESSION FOUND # NARRATOR
        # AMY
        "That's right!"
        "These fish must somehow be connected to whoever is behind this whole thing."
        ~ ch2_evidence += ch2_evidence.e3
    }
+ [Crane]
    ~ INTERACTABLE = false
    {inventory ? key:
        {inventory !? crane:
            Alright!
            Let's see what this baby can do!
            Wooaahh!
            Okay I guess I don't exactly know how to operate this thing.
            But I think I can move some of these steel girders around enough so I can make a platform to escape.
            ~ inventory += crane
            ~ BG = CH02_EXP_PIER_MOVED
            Yes!
            I did it!
        - else:
            I think I got it stuck.
            Besides, I really don't feel like getting back on that thing.
        }
    - else:
        {stopping:
        -   Looks like this crane's still workin'.
            Maybe I can use this to escape somehow?

        -   You tried opening the cabin. # NARRATOR

            # AMY
            Dang, locked.
            Maybe the key for it is around somewhere.
        -   It's locked, I need to look for the key to open it if I want to use it.
        }
    }
+ [Key]
    ~ INTERACTABLE = false
    {inventory !? key:
        A key!
        Maybe the one of the dock workers dropped this while trying to get away from the wave.
        With any luck I might just be able to use that crane.
        ~ inventory += key
    }
+ [Leave]
    ~ INTERACTABLE = false
    {inventory ? crane:
        Alright, big jump coming.
        I just need to get a running start and...!
        -> part3
    }
- -> area3

= part3

~ inventory = ()
~ INTERACTABLE = false
# KOI
"So you're the one whose been making a mess of my business."

# AMY
"Huh, who the devil are you?"
And how'd you get up here??

# KOI
"Oh, where are my manners?"
"You can call me Mr. Ignacio. That's Mr. Ignacio, Koi."
"The shipping business is my business."
"And furthermore, it is none of your business."
"So, let me make you a deal."
"Give me that book you have and I'll let you go."
"I'll forgive all the mess you've done on my dock so long as you promise to never return or speak a word of anything you've seen."
"Seem like a pretty good deal, no?"

# AMY
What? Give him the undercity codex?
No way!
+ [Pretend to toss the book]
    Here catch!

    # NARRATOR
    You toss a spare notepad you have into the air.

    # KOI
    "Hiss! Do you think that I am some sort of fool?"

    # AMY
    Ngh!
    It didn't work.
+ ["Never!"]
    I'll never give you this book!
    I'm getting out of here and exposing your entire gang!

    # KOI
    "Hiss, fine!"
    "Have it your way."
+ [Ignore him and jump]
    # NARRATOR
    You think about his proposition for a moment.

    # AMY
    Ah to heck with it.
    I'm getting outta here!

    # NARRATOR
    You break out into a sprint ready to leap from the shaky platform you put together.

    # KOI
    "Hiss! You fool!"
    "Do you think you can get away?"

    # NARRATOR
    Mr. Ignacio moved swiftly like a stream of water.
    Before you know it, he is gripping your arm with a webbed hand topped with sharp claws.
- "If you refuse to cooperate, then the only way you're getting out of here is in a box!" # KO1
-> ch2_battle

= end
# AMY
"Huff, huff"
"I'm more tired than a snail after a funeral. But it seems like the domain over this place has finally unravelled."

# KOI
"...and I would have gotten away with it too..."
"if it weren't hrhgblurblblrbl..."

# AMY
"Yeah..."
"Anyway, I'm going to go home an take a nice long hot bath."

# NARRATOR
After defeating Mr. Ignacio's gang you returned home for a well-deserved rest.
The next morning, the papers are painted with retellings of your exploits.
Wetro Wanila is that much more safer thanks to you.
CHAPTER END
+ [Return]
-> main
