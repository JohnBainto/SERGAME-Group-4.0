=== ch0_battle ===
~BG = BATTLE
# TUTORIAL BATTLE_PHASE
This is the battle phase.
Each round

~ temp life = 20
~ temp performance = 0
~ temp turn = 0
~ temp cur_question = 0
~ temp fallacy = ""

// These are the scores corresponding to each sentence

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
        ~ fallacy = "AD HOMINEM"
        ~ cur_question = c1q2
     -   My gang # KIT QSTART
        will take over
        this city
        and
        we'll crush
        anyone
        who gets
        in the way. # QEND
        ~ fallacy = "AD HOMINEM"
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
        ~ fallacy = "AD HOMINEM"
        ~ cur_question = c1q5
    -   Monster hunters # KIT QSTART
        like you
        might be able
        to pick us off
        one by one
        but now
        you're
        in our domain. # QEND
        ~ fallacy = "AD HOMINEM"
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
    weakling
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
    - else >= -2:
        {shuffle:
        -   Ugh! I don't think that was right # AMY
        -   Kyah!! # AMY
        -   Hrngg! # AMY
        -   Ouch!
        }
        {fallacy == "AD HOMINEM":
            I should look for words that are attacking or insulting me directly to unravel his fallacy spell.
        }
    }
+ [Skip]
    {shuffle:
    -   You're not worth my time! # AMY
    -   Trying to be tricky eh? # AMY
    -   As if!
    -   You won't fool me with that!
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

-> tutorial.end