=== ch2_battle ===
# NARRATOR BATTLE_PHASE
The fishes have come to meet you!

~ temp life = 20
~ temp performance = 0
~ temp turn = 0
~ temp cur_question = 0

// These are the scores corresponding to each sentence
LIST c2q1 = p1=-2, p2=0, p3=1, p4=2, p5=0, p6=0, p=0, p8=2, p9=3
LIST c2q2 = p1=-1, p2=-1, p3=-1, p4=-1, p5=-1, p6=-1, p=-1, p8=-1, p9=-1
LIST c2s1 = p1=-3, p2=-1, p3=-1, p4=1, p5=0, p6=0, p=0, p8=1, p9=2, p10=2
LIST c2s2 = p1=0, p2=-1, p3=0, p4=-1, p5=3, p6=0, p=2, p8=0, p9=1, p10=2

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
        ~ cur_question = c2q1
    -   Only # KIT QSTART
        one thing
        matters
        in this city:
        MONEY.
        My gang and I
        will survive
        no matter
        what! # QEND
        ~ cur_question = c2q2
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
    ~ cur_question = c2s1
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
    ~ cur_question = c2s2
- else:
    -> end
}
// Unity will use the tag of the question to know when the text scroll is done
// cur_question will contain the scores corressponding to each word/line

+ [Retort]
    ~ performance += sum(cur_question)
    ~ life += performance
    {
    - performance > 3:
        {shuffle:
        -   No that's wrong! # MC
        -   Chigauyo! # MC
        }
    - performance > 0:
        {shuffle:
        -   U rappin OK # MC
        -   good # MC
        }
    - else > 0:
        {shuffle:
        -   U rappin AWFUL # MC
        -   \*record scratch noise\* # MC
        }
    }
+ [Skip]
    {shuffle:
    -   no that's a scam # MC
    -   back to u # MC
    }
~ turn++
- -> battle_phase

- (bad_end)
# MC
Urk!
I can't go on!
Is this the end?

# KOI
"Heh, stuff 'em in a crate."

# NARRATOR
Continue?
+ [Yes] -> ch2_battle
+ [No] -> main

- (end)
# KOI
"Nggrrh!"
"How..."
"How am I losing to the likes of YOU!?"

# MC
"This is the end Mr. Ignacio!"
"I've exposed you for what you really are!"

# KOI
"Darn pesky journalists..."
"Hurglblgbrblr..."

-> chapter1.end