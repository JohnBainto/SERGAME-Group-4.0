=== ch2_battle ===
# NARRATOR BATTLE_PHASE
It feels like you're going to be sleeping with the fishes soon.

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
- turn == 0 || turn == 1 || turn == 3 || turn == 4 || turn == 5:
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
- turn == 6:
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
        -   Don't bother trying to distract me, I already know what you're up to. # MC
        -   Think you're the first monster I've taken down? I know your tricks # MC
        -   That's wrong! I can see through your magic! # MC
        -   I can see trhough your illusions Koi! # MC
        }
    - performance > -2:
        {shuffle:
        -   N-no that's not true! # MC
        -   Ngh, I won't let you under my skin. # MC
        -   I w-won't give in! # MC
        -   Mmph! I uhh... t-that's wrong! # MC
        }
    - else >= -2:
        {shuffle:
        -   Ugh! I don't think that was right # MC
        -   Kyah!! # MC
        -   Hrngg! # MC
        -   Ouch!
        }
        {fallacy == "RED HERRING":
            I should look for words that are unrelated to what he is saying.
            I can't be fooled by his distractions.
        }
    }
+ [Skip]
    {shuffle:
    -   You're not worth my time! # MC
    -   Trying to be tricky eh? # MC
    -   As if!
    -   You won't fool me with that!
    }
~ turn++
- -> battle_phase

- (bad_end)
# MC
Urk!
I can't go on!
Is this the end?

# KOI
"That will teach you to meddle in my affairs."

# NARRATOR
Continue?
+ [Yes] -> ch1_battle
+ [No] -> main

- (end)
# KOI
"Aaarrghh!!"
"How dare you, y-you gutter trash!"

# MC
"You're no match for me Koi!"

# KOI
"That's Mr. Ignacio to you!"

# MC
"It's over!"
"You little reign of terror over the pier is going to be exposed."

# KIT
"This... can't... be..."
"hapening!!!"

-> chapter2.end