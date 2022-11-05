=== function sum(list)
{list:
    ~ return sum(list - LIST_MIN(list)) + LIST_VALUE(LIST_MIN(list))
- else:
    ~ return 0
}

=== ch1_battle ===
# NARRATOR BATTLE_PHASE
It feels like you're going to be sleeping with the fishes soon.

~ temp life = 20
~ temp performance = 0
~ temp turn = 0
~ temp cur_question = 0

// These are the scores corresponding to each sentence
LIST q1 = p1=-2, p2=0, p3=1, p4=2, p5=0, p6=0, p=0, p8=2, p9=3
LIST q2 = p1=-1, p2=-1, p3=-1, p4=-1, p5=-1, p6=-1, p=-1, p8=-1, p9=-1

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
        ~ cur_question = q1
    -   Only # KIT QSTART
        one thing
        matters
        in this city:
        MONEY.
        My gang and I
        will survive
        no matter
        what! # QEND
        ~ cur_question = q2
    }
- turn == 2:
    I'm # KIT QSTART
    going
    to send
    you
    to the bottom
    of this
    harbor
    you
    weakling # QEND
    ~ cur_question = q1
- turn == 5:
    Only # KIT QSTART
    one thing
    matters
    in this city:
    MONEY.
    My gang and I
    will survive
    no matter
    what! # QEND
    ~ cur_question = q2
- else:
    -> end
}
// Unity will use the tag of the question to select the right list.
// the player will select words using unity and activate the corresponding values in the list.

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

# KIT
"Huff, toss his body into the bay."

# NARRATOR
Continue?
+ [Yes] -> ch1_battle
+ [No] -> main

- (end)
# KIT
"Hrngg!"
"This.."
"How is this possible!?"

# MC
"It's over Kit!"
"You're done for."
"I'm puttin' you and your entire posse on the front page of every paper in Wetro Wanila."

# KIT
"Defeated..."
"by a weak human."
"Hurmph"

-> chapter1.end