=== ch1_battle ===
~BG = BATTLE
# NARRATOR BATTLE_PHASE
It feels like you're going to be sleeping with the fishes soon.

~ temp life = 20
~ temp performance = 0
~ temp turn = 0
~ temp cur_question = 0
~ temp fallacy = ""

// These are the scores corresponding to each sentence
LIST c1q1 = p1=-1,p2=-2,p3=-1,p4=1,p5=-1,p6=-1,p7=-1,p8=1,p9=2
LIST c1q2 = p1=-1,p2=-2,p3=-1,p4=-1,p5=-1,p6=-1,p7=-1,p8=-2
LIST c1q3 = p1=-1,p2=-2,p3=-1,p4=-2,p5=0,p6=0,p7=-1,p8=-1
LIST c1q4 = p1=1,p2=0,p3=1,p4=2,p5=0,p6=0,p7=1,p8=1,p9=0,p10=1
LIST c1q5 = p1=1,p2=1,p3=0,p4=2,p5=1,p6=1,p7=0
LIST c1q6 = p1=-1,p2=-1,p3=-1,p4=-2,p5=-2,p6=-1,p7=2,p8=-1
LIST c1q7 = p1=-1,p2=-1,p3=-1,p4=-1,p5=-1,p6=-1,p7=-1,p8=-1
LIST c1q8 = p1=1,p2=0,p3=0,p4=-1,p5=-1,p6=2
LIST c1q9 = p1=1,p2=1,p3=1,p4=-1,p5=-1,p6=1,p7=0
LIST c1q10 = p1=2,p2=2,p3=0,p4=1,p5=-1,p6=-1,p7=-1

LIST c1s1 = p1=-3, p2=-1, p3=-1, p4=1, p5=0, p6=0, p=0, p8=1, p9=2, p10=2
LIST c1s2 = p1=0, p2=-1, p3=0, p4=-1, p5=3, p6=0, p=2, p8=0, p9=1, p10=2

- (battle_phase)
~ performance = 0
{life <= 0: -> bad_end}
{
- turn == 0 || turn == 1 || turn == 3 || turn == 4:
    {shuffle:
    -   I'm # KIT QSTART
        going
        to send
        you
        to the bottom
        of this
        harbor
        you
        weakling # QEND
         ~ fallacy = "AD HOMINEM"
        ~ cur_question = c1q1
    -   The # KIT QSTART
        truth 
        is
        only
        one thing
        matters
        in this city,
        MONEY. # QEND
        ~ fallacy = "NONE"
        ~ cur_question = c1q2
     -   My gang # KIT QSTART
        will take over
        this city
        and
        we'll crush
        anyone
        who gets
        in the way. # QEND
        ~ fallacy = "NONE"
        ~ cur_question = c1q3
    -   You're # KIT QSTART
        out of your depths
        here
        little girl.
        You
        can't stop
        us.# QEND
        ~ fallacy = "AD HOMINEM"
        ~ cur_question = c1q4
    -   We've been # KIT QSTART
        hiding
        in the shadows
        too long
        for some
        nosy brat
        to expose us. # QEND
        ~ fallacy = "AD HOMINEM"
        ~ cur_question = c1q5
    -   My gang # KIT QSTART
        will take over
        this city
        and
        we'll crush
        anyone
        who gets
        in the way. # QEND
        ~ fallacy = "NONE"
        ~ cur_question = c1q5
    -   Monster hunters # KIT QSTART
        like you
        might be able
        to pick us off
        one by one
        but now
        you're
        in our domain. # QEND
        ~ fallacy = "NONE"
        ~ cur_question = c1q7
    -   You'll # KIT QSTART
        never
        see
        the light of day
        again
        pathetic human! # QEND
        ~ fallacy = "AD HOMINEM"
        ~ cur_question = c1q8
    -   You're # KIT QSTART
        only doing this
        to earn a living
        too
        aren't you?
        We're
        two sides of the same coin,
        human. # QEND
        ~ fallacy = "AD HOMINEM"
        ~ cur_question = c1q9
    -   Snot-nosed # KIT QSTART
        brats
        like
        you
        need
        to be taught
        a lesson! # QEND
        ~ fallacy = "AD HOMINEM"
        ~ cur_question = c1q10
    }
- turn == 2:
    Huff, huff. # KIT QSTART
    Just
    'cause
    you've
    dodged
    a couple of
    my attacks
    doesn't mean
    you're
    not a weakling # QEND
    ~ fallacy = "AD HOMINEM"
    ~ cur_question = c1s1
- turn == 5:
    I can't... # KIT QSTART
    possibly
    lose
    to a
    wimpy human
    like
    you!!!
    I
    will end
    you! # QEND
    ~ fallacy = "AD HOMINEM"
    ~ cur_question = c1s2
- else:
    -> end
}

+ [Retort]
    ~ performance += sum(cur_question)
    ~ life += performance
    {
    - performance > 0:
        {shuffle:
        -   Tch, intimidation? That ain't gonna work on me. # AMY
        -   Think you're the first monster I've taken down? I know your tricks # AMY
        -   That's wrong! I can see through your magic! # AMY
        -   I'm not afraid of you! # AMY
        }
    - performance > -2:
        {shuffle:
        -   N-no that's not true! # AMY
        -   Ngh, I won't let you under my skin. # AMY
        -   I w-won't give in! # AMY
        -   Mmph! I uhh... t-that's wrong! # AMY
        }
    - else:
        {shuffle:
        -   Ugh! I don't think that was right # AMY
        -   Kyah!! # AMY
        -   Hrngg! # AMY
        -   Ouch! # AMY
        }
        {fallacy == "AD HOMINEM":
            I should look for words that are attacking or insulting me directly to unravel his fallacy spell.
        -   else:
            I don't think that one even had a fallacy.
            I should ne more careful next time.
        }
    }
+ [Skip]
    {fallacy == "NONE":
        {shuffle:
        -   You're not worth my time! # AMY
        -   Trying to be tricky eh? # AMY
        -   As if! # AMY
        -   You won't fool me with that! # AMY
        }
    -   else:
        {shuffle:
        -   Uhh, pass! # AMY
        -   That's... # AMY
        -   Ah! Wait no, hmm... # AMY
        -   ??? # AMY
        }
        ~ life -= skip_penalty(cur_question)
    }
~ turn++
- -> battle_phase

- (bad_end)
# AMY
Urk!
I can't go on!
Is this the end?

# KIT
"Huff, toss 'em into the bay."

# NARRATOR
Continue?
+ [Yes] -> ch1_battle
+ [No] -> main

- (end)
# KIT
"Hrngg!"
"This.."
"How is this possible!?"

# AMY
"It's over Kit!"
"You're done for."
"I'm puttin' you and your entire posse on the front page of every paper in Wetro Wanila."

# KIT
"Defeated..."
"by a weak human."
"Hurmph"

-> chapter1.end