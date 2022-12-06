LIST ch0_evidence = e1,e2
=== tutorial ===
= part1
~ INTERACTABLE = false
~ BG = CH00_EXP_BLACK
# NARRATOR
# LOAD CODEX
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
Now, you don't need to be a genius supernatural detective like me to figure out that this is a clear sign a' gang activity.
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
To jump, press spacebar.
To interact with objects in a domain, stand next to the object and press E.
Try moving towards the box on your right and interacting with it!

~ temp examined_box = false
~ temp examined_tall_box = false

- (area1)
~ INTERACTABLE = true
# AMY
What should I do now?
+ [Examine box]
    ~ INTERACTABLE = false
    {inventory ? key:
        # AMY
        !?
        Alright, let's open up this bad boy.
        
        # NARRATOR
        You opened the crate with the key you found and examine the contents.
        Inside there is a bunch of black and white spray cans, a note, and a set of clothes that have been cut into two.
        You read the note.
        
        # NOTE
        heyy hattie, here are the goods like u asked.
        u better have my money ready 4 this!!
        anyway tty tom, <3
        ps. i put da key in the usual place ;)
        pps. so u need 2 stop breaking my boxes fr!!
        these. are. expensive!!
        
        # AMY
        Hattie? Could this person be the leader of this gang?
        With that and this box of black and white paint...
        And the pieces of clothes here that have been cut into two pieces...
        
        IMPRESSION FOUND  # NARRATOR
        ~ ch0_evidence += ch0_evidence.e1
        
        # TUTORIAL
        Upon finding an impression, your undercity codex will react and turn that impression into evidence.
        Your undercity codex is the book that you can see on the lower-right side of your screen.
        Click on the undercity codex to access it any time and review the evidence you just discovered.
        It is important to examine the evidence you find before fighting a boss in order to know how to defeat them.
        Speaking of which...
        -> part2
    }
    {stopping:
    -   # AMY
        Well, this is supposed to be the package.
        # TUTORIAL
        Sometimes, examining something multiple times can yield different results.
        Try inspecting this box again.
    -   # AMY
        Looks like they tried to hide it in this dark corner, but they didn't do a very good job at it.
        # TUTORIAL
        Try inspecting this box one more time.
    -   ~ examined_box = true
        # TUTORIAL
        Good job!
        You will also encounter choices.
        Use the up and down arrow keys to select between different choices.
        Then, click on the Enter key to confirm your selection.
    -   What should I do now?
    }
    {not examined_box: -> area1}
    + + [Examine slip of paper.]
        # AMY
        There's a piece of paper that got caught on the lid of the box.
        It looks like a note?
        
        # NARRATOR
        You try pulling out the note.
        You manage to get more of it out, but you are unable to fully take it.
        
        # AMY
        Ah no good, the lids too tight.
        It'll tear if I force it.
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
    + + [Examine lock.]
        {stopping:
        -   # AMY
            Must not have wanted anyone taking a look inside.
            I wonder if I could force it open.
        -   # AMY
            No, forcing it would be a terrible idea.
            If I broke the lock, then whoever is expecting this package will know for sure that somebody is watching them.
        -   # AMY
            I wonder if the key to this is somewhere around here...
        }
    - - # TUTORIAL
        Seems like you need to find a key to open that box.
        Try exploring the area to the right to look for a key.
        Go left until you find a tall box and interact with it.
        -> area1
+ [Examine tall box]
    ~ INTERACTABLE = false
    {
    -   examined_box and not examined_tall_box:
        ~ examined_tall_box = true
        # AMY
        I wonder if the key to that box is around here somewhere...
        Ah there!
        
        # NARRATOR
        Out of the corner of your eye, you spot something twinkling suspended way above a tall box
        
        # TUTORIAL
        As you know space bar is used to jump.
        Sometime you will need to jump on multiple items to get to certain places.
        Try jumping on top of this box to reach the key
    -   examined_box and examined_tall_box and inventory !? key:
        # AMY
        I have to stand on something to reach the key up there.
    -   examined_box and examined_tall_box and inventory ? key:
        # AMY
        It's a tall box.
    -   else:
        # TUTORIAL
        Try examining the box near where you first started before anything else.
    }
+ [Get key]
    ~ INTERACTABLE = false
    {not examined_box:
        # TUTORIAL
        Woah slow down!
        Try examining the box near where you first started before anything else.
        Otherwise you might be better off skipping the tutorial.
        -> area1
    }
    {
    -   inventory !? key:
        ~ inventory += key
        # TUTORIAL
        Sometimes, interacting with an object will result in you picking up that object.
        You can see the objects that you have picked up so far on the lower-left side of your screen.
        
        # AMY
        Nice! Now let's see what's inside that crate.
    -   inventory ? key:
        # AMY
        I don't think I need anything else from here.
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