LIST ch2_evidence = e1, e2, e3

=== chapter2 ===
# NARRATOR
CHAPTER 2: BUT YOU CAN'T MAKE HIM DROWN
DECEMBER 8, 20XX \| 11:02 PM
Kit's defeated body lays on the floor in front you.
Just beyond him the door to your cell has been left open.

# MC
Alright! Need to make like tree and leave this place.

# NARRATOR
You step out into the narrow hallway.
The wall are made of exposed hollow blocks with a peeling layer of white paint.
Its quiet except for the faint buzzing of the florescent light bulbs above and the distant sounds of the pier outside.
You turn to look at the room you were brought to.

# MC
Hmm... I ought to lock 'em in there for when he comes to.

# NARRATOR
You lock the door, leaving Kit inside.

LIST ch2_area1_inv = newspaper, fire, detector

# MC
Okay what should I do know?
- (area1)
+ [Door 1]
    {stopping:
    -   You rattle the door knob. # NARRATOR
        # MC
        Sigh, it's locked.
    -   I should really learn how to pick a lock one of these days.
    }
+ [Door 2]
    {stopping:
    -   You rattle the door knob. # NARRATOR
        # MC
        Mmph, it not openin'.
    -   Open sesame!
        ...
        It was worth a shot.
    }
+ [Exposed electrical wiring]
    # NARRATOR
    A couple of exposed wires dangle from the wall. 
    They crackle and pop little bolts of lightning.
    
    # MC
    Jeepers! I almost shocked myself.
    These really have no business being exposed like this.
    Although...
    {ch2_area1_inv ? newspaper:
        If I use those newspapers I got to connect these two wires...
        
        # NARRATOR
        You put the newspapers you collected up to the exposed wires.
        Nothing seemed to happen at first.
        Then suddenly, the parts of the paper touching the wires start turning into a darker shade.
        Slowly, smoke start to emmanate from the newspaper until it fully catches on fire.
        
        # MC
        Eureka!
        Now I just need to get this closer to the fire alarm.
    }
+ [Newspapers on the floor]
    {stopping:
    -   More news papers on the floor, it really breaks my heart to see a journalist's hardwork taken for granted like this.
        I guess I'll take it anyway in case I need it.
    -   I hope somebody at least read these...
    }
    {ch2_area1_inv !? newspaper: 
        ~ ch2_area1_inv += newspaper
    }
+ [Smoke detector]
    {stopping:
    -   It looks like one 'a those smoke detectors.
    -   It supposed to trigger a fire alarm if it detects smoke.
        I wonder if I can use that for my escape.
    }
    {ch2_area1_inv ? fire:
        # NARRATOR
        You reach up to get the flaming newspaper as close to the fire alarm as possible.
        
        # MC
        C'moon...
        
        # NARRATOR
        The fire alarm starts beeping out a steady high pitched tune.
        All along the ceiling, water sprinklers start coming to life.
        
        # MC
        Nice! This should distract those goons outside.
        ~ ch2_area1_inv += detector
    }
+ [Stairs]
    {ch2_area1_inv !? detector:
        {stopping:
        -   You stop before the door. # NARRATOR
            You can hear faint voices coming from the other side.
            
            # MC
            Drats! Those goons must be guarding outside.
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
        
        # MC
        Corn nab it!
        They're comin' here!
        I need to hide.
        
        # NARRATOR
        You positioned yourself behind the door just in time before it swung open.
        You recognize the kapre running down the stair from when you were attacked earlier.
        In the monster's rush to get downstairs, he did not even notice you holding your breath behin the door.
        You quickly slip out the door after he is some distance away.
        -> part2
    }
- -> area1

= part2
# NARRATOR
You exit in the main area of shipping office.
The door leading outside is wide open exposing the interior of the building to heavy rain from the outside.
In combination with the sprinklers, there is a good inch of water pooling on the ground.

# MC
Mmph!
All this water... serving as a distraction.
It feels like a...
IMPRESSION FOUND # UNLOCK CH2_E1
"Looks like that hair was a manifestation of an impression."
"Phew! ALright, it's good that I found that but I really need get out of here."
~ ch2_evidence += ch2_evidence.e1

# NARRATOR
You run out of the shipping office and enter the pier area.
Heavy torrents of rain fall all around you reducing visibility.
Whatever parts that you managed to keep dry from the water sprinklers are now thoroughly drenched as well.

# MC
Just my luck.
I need to find a way to get out of here despite the rain.

# NARRATOR
As you began to move forward, a strong wave suddenly crashed into the pier.
You managed to hold on to the walls of the shipping office to avoid getting swept away completely.
Once you reoriented yourself, you notice that the way you cam from has now been blocked by a flipped over shipping container.

# MC
Ugh! Just perfect.
I need to find a way around to get out.

- (area2)
+   [Shipping container]
+   [Washed up fish]
+   [U]
-

-> end

= end
+ [Return]
-> main