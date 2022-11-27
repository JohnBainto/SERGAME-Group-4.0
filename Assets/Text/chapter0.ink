LIST ch0_evidence = e1

=== tutorial ===
= part1
~ INTERACTABLE = false
~ BG = CH00_EXP_BLACK
# NARRATOR
CHAPTER 0: TUTORIAL
NOVEMBER 23, 20XX \| 1:02 AM
~ BG = CH00_EXP_TUTORIAL
In the late evening hours, the city's suburban area is still and quiet.
Only the occasional sounds of the distant highway interrupt the peace that has settled among the sleeping houses.
The moonless sky above is dark, save for the twinkling of a few stars and the red lights of distant cell towers.
Here, you find yourself wandering the dimly lit streets looking for your next big scoop.

# AMY
Over the past week I've been investigatin' a series of vanadalism cases in this area.
Each case has the same MO, black and white gang signs painted over the vandalized property.
Now, you don't need to be genius supernatural detective like me to figure out that this is a clear sign a' gang activity.
But what I do know as a supernatural detective is that a domain has already formed over this place.
That means this is no ordinary gang, but a gang of supernatural beings!
Since this case piqued my interest, I set up a mole in a couple of art supply chains to warn me about any large orders of spray paints and what not.
After a particularly suspicious order of black and white spray paint, I asked my guy to place a tracking device on the package.
And that leads me to here.
Who ever bought the package seems to have just left it here slightly hidden in the bushes.
Whatever's the case, its time to investigate.

# TUTORIAL
You have entered a monster's domain.
While in a domain it your job to look for impressions or weaknesses and other information about the monster that has manifested into the domain.
Impressions can be revealed by examining objects or interacting with people.
To move around a domain, use your ←/A and →/D keys.
To interact with objects in a domain, stand next to the object and press E.
Try moving towards the box on your right and interacting with it!

~ temp examined_box = false
~ temp examined_tall_box = false

- (area1)
~ INTERACTABLE = true
+ [Examine box]
    ~ INTERACTABLE = false
    {stopping:
    -   # AMY
        Well, this is supposed to be the package.
        # TUTORIAL
        Sometimes, examining something multiple times can also yield different results.
    -   # AMY
        Looks like the tried to hide it in this dark corner, but they didn;t do a very good job at it.
        # TUTORIAL
        Try inspecting this box one more time.
    -   ~ examined_box = true
        # TUTORIAL
        You will also encounter choices.
        Use the up and down arrow keys to select between different choices.
        Then, click on the Enter key to confirm your selection.
        # AMY
        Anyway, what should I do now?
        + + [Examine slip of paper.]
            # AMY
            There's a piece of paper that got caught on the lid of the box.
            It looks like a note?
            
            # NARRATOR
            You try pulling the note out.
            You manage to get more of it out, but you are unable to fully take it.
            
            # AMY
            Ah no good, the lids too tight it'll tear if I force it.
            Let's see what we can read from what's sticking out.
            
            # NOTE
            anyw....
            ps. i put da key....
            pps. so u need 2 stop breaki...
            these. are. expensive!!
            
            # AMY
            Hm... no names.
            But it did mention a key.
            Maybe they hid a key somewhere around here.
            If I can find that key, I'd be able to read the whole note.
            Then, I would know more about who I'm staking out and what to expect.
            
            # TUTORIAL
            Seems like you need to find a key to open that box.
            Try exploring the area to the left to look for a key.
            Go left until you find a tall box and interact with it.
            -> area1
        + + [Examine lock.]
            {stopping:
            -   # AMY
                Must not have wanted anyone taking a look inside.
                I wonder if I could force it open.
            -   # AMY
                No, forcing it would be a terrible idea.
                If I broke the lock then whoever is expecting this package will know for sure that somebody is watching them.
            -   # AMY
                I wonder if the key to this is somewhere around here...
            }
            # TUTORIAL
            Seems like you need to find a key to open that box.
            Try exploring the area to the left to look for a key.
            Go left until you find a tall box and interact with it.
            -> area1
    }
+ [Examine tall box]
    ~ INTERACTABLE = false
    {
    -   examined_box and not examined_tall_box:
        ~ examined_tall_box = true
        # AMY
        I wonder if the key to that box is around here somewhere...
        Ah there!
        
        # NARRATOR
        Out of the corner of your eye, you spot something twinkling on top of some boxes
        
        # AMY
        Hmm it's too tall to reach.
        I need to stand on something else to reach it.
        
        # TUTORIAL
        Press the spacebar to jump.
        Some items can be stood on.
        Try jumping on top of that box over there
    -   examined_box and examined_tall_box and inventory !? key:
        # AMY
        I have to stand on something to reach the key over there.
    -   examined_box and examined_tall_box and inventory ? key:
        # AMY
        It's a tall box.
    -   else:
        # TUTORIAL
        Try examining the box where you first started first.
    }
+ [Get key]
    {not examined_box:
        # TUTORIAL
        Woah slow down!
        Try examining the box where you first started first.
        Otherwise you might be better off skipping the tutorial.
        -> area1
    }
    {not examined_tall_box:
        ~ examined_tall_box = true
        # TUTORIAL
        Looks like you've figured out how to jump.
        To jump, press the up arrow key.
        Some items like this box can be stood on.
    }
    {
    -   inventory !? key:
        ~ inventory += key
        # TUTORIAL
        Sometimes, interacting with an object will result in you picking up that object.
        You can see the objects that you have picked up so far on the lower-right side of your screen.
        
        # AMY
        Nice! Now let's see what's inside that crate.
    -   inventory ? key:
        # AMY
        I don't think I need anything else from here.
    }
+ [Examine broken crate]
    ~ INTERACTABLE = false
    {inventory ? key:
        # AMY
        !?
        The crate has been cut in half!
        Seems I've got company.
        
        # NARRATOR
        You examine the note.
        
        # NOTE
        heyy hattie, here are the goods like u asked.
        u better have my money ready 4 this!!
        anyway tty tom, <3
        ps. i put da key in the usual place ;)
        pps. so u need 2 stop breaking my boxes fr!!
        these. are. expensive!!
        
        # AMY
        Hattie? Could this person be the leader of this gang?
        Besides, this box of black and white paint...
        And the crate that's not supposed to be seprated in two pieces being cut in half like this...
        
        IMPRESSION FOUND  # NARRATOR
        ~ ch0_evidence += ch0_evidence.e1
        
        # TUTORIAL
        Upon finding an impression, you undercity codex will react and turn that impression into evidence.
        Your undercity codex is the book that you can see on the lower-left side of your screen.
        Press the X button to access it any time and review the the evidence you just discovered.
        It is important to examine the evidence you find before fighting a boss in order to know how to defeat them.
        Speaking of which...
        -> part2
    }
- -> area1

= part2
~ INTERACTABLE = false
- # HATTIE
AHAHAHA! Looks like I've found a nosy snoop messing around with my stuff\~
Lucky for me cause I've just been itchin' to find somebody fun to play with\~

# TUTORIAL
When you encounter the boss monster of a domain, you will have to battle them using your undercity codex and the evidence you have acquired.

-> ch0_battle

= end
# AMY
"Huff, huff. Nice try, but you're no match for Amy Buscador, Babaylan Investigator."

# HATTIE
"That... sounds... totally lame..."
"Urgh."


# NARRATOR
After defeating Hattie, you were able to turn her to the police using the evidence you collected.
Apart from that, you were also lauded for the article you wrote about the gang of manananggals terrorizing the local community.
Just another typical action-packed day in the life of Amy Buscador.
CHAPTER END
+ [Return]
-> main