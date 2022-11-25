=== ch2_battle ===
# NARRATOR BATTLE_PHASE
The wind is howling and the rain is falling in torrents.
Are you ready?

~ temp life = 20
~ temp performance = 0
~ temp turn = 0
~ temp cur_question = 0
~ temp fallacy = ""

// These are the scores corresponding to each sentence
LIST c2q1 = p1=-1,p2=0,p3=1,p4=1,p5=-1,p6=1,p7=0,p8=1
LIST c2q2 = p1=-1,p2=-1,p3=-1,p4=1,p5=0,p6=0,p7=0,p8=1,p9=1
LIST c2q3 = p1=0,p2=1,p3=-1,p4=0,p5=-1,p6=1,p7=1,p8=1
LIST c2q4 = p1=-1,p2=-1,p3=-1,p4=-1,p5=1,p6=0,p7=1,p8=1
LIST c2q5 = p1=-1,p2=1,p3=-1,p4=0,p5=1,p6=1,p7=0
LIST c2q6 = p1=-1,p2=-1,p3=-1,p4=-1,p5=1,p6=1
LIST c2q7 = p1=-1,p2=-1,p3=-1,p4=-1,p5=-1,p6=1,p7=0,p8=1
LIST c2q8 = p1=-1,p2=-1,p3=-1,p4=-1,p5=-1,p6=-1,p7=-1,p8=-1
LIST c2q9 = p1=-1,p2=-1,p3=-1,p4=-1,p5=-1,p6=-1,p7=-1,p8=-1
LIST c2q10 = p1=-1,p2=-1,p3=-1,p4=-1,p5=-1,p6=-1,p7=-1
LIST c2q11 = p1=-1,p2=-1,p3=-1,p4=-1,p5=-1,p6=-1,p7=-1
LIST c2q12 = p1=-1,p2=-1,p3=-1,p4=-1,p5=-1,p6=-1,p7=-1

LIST c2s1 = p1=-2,p2=1,p3=-1,p4=1,p5=1,p6=0,p7=0
LIST c2s2 = p1=-2,p2=-1,p3=-1,p4=-1,p5=-1,p6=1,p7=0,p8=1

- (battle_phase)
~ performance = 0
{life <= 0: -> bad_end}
{
- turn == 0 || turn == 1 || turn == 3 || turn == 4 || turn == 5:
    {shuffle:
    -   Why # KOI QSTART
        don't you
        just leave
        my operation alone?
        There are
        plenty of other fish
        in the sea
        doing crime. # QEND
        ~ fallacy = "RED HERRING"
        ~ cur_question = c2q1
    -   I # KOI QSTART
        have
        an idea,
        there is a lovely new cafe
        that opened
        on Dapitan
        that you
        could write about
        instead. # QEND
        ~ fallacy = "RED HERRING"
        ~ cur_question = c2q2
    -   Exposing us # KOI QSTART
        won't remove demand
        you know.
        Cut the problem
        at the root
        by writing a story
        about our clients
        instead. # QEND
        ~ fallacy = "RED HERRING"
        ~ cur_question = c2q3
    -   You're # KOI QSTART
        so keen
        on exposing
        us
        but you're soaking wet!
        You'll
        get sick
        if you don't dry up. # QEND
        ~ fallacy = "RED HERRING"
        ~ cur_question = c2q4
    -   Of course # KOI QSTART
        it's alright
        for my business
        to be fishy,
        I am
        a fish
        after all. # QEND
        ~ fallacy = "RED HERRING"
        ~ cur_question = c2q5
    -   I'll # KOI QSTART
        let you leave
        if you give me
        that book,
        that's what you want right?
        To leave? # QEND
        ~ fallacy = "RED HERRING"
        ~ cur_question = c2q6
    -   Why # KOI QSTART
        are you
        disrupting
        my business
        so much.
        Don't
        you
        have anything better to do? # QEND
        ~ fallacy = "RED HERRING"
        ~ cur_question = c2q7
    -   Hand me # KOI QSTART
        that cursed book
        already!
        You're
        messing
        with powers
        greater than
        you could even understand. # QEND
        ~ fallacy = "RED HERRING"
        ~ cur_question = c2q8
    -   I # KOI QSTART
        won't let
        you
        tear down
        my operation!
        I'll have you
        sleeping with the fishes
        before that happens. # QEND
        ~ fallacy = "RED HERRING"
        ~ cur_question = c2q9
    -   How dare you # KOI QSTART
        attack me
        like this.
        I
        am
        a renowned businessman
        with many connections # QEND
        ~ fallacy = "RED HERRING"
        ~ cur_question = c2q10
    -   The water # KOI QSTART
        is rising faster
        now.
        My business
        will stay afloat
        but I don't think
        you will. # QEND
        ~ fallacy = "RED HERRING"
        ~ cur_question = c2q11
    -   I'm going to # KOI QSTART
        wash you away
        and
        all the evidence
        you've collected
        with one
        big wave. # QEND
        ~ fallacy = "RED HERRING"
        ~ cur_question = c2q12
    }
- turn == 2:
    Ngah! # KIT QSTART
    Enough of this,
    allow me
    to make you an offer.
    A hundred thousand pesos
    for that book,
    final offer. # QEND
    ~ fallacy = "AD HOMINEM"
    ~ cur_question = c1s1
- turn == 6:
    Huff, huff. # KIT QSTART
    Alright
    you've proven
    your salt.
    Let's call it
    a tie
    and forget
    all about this.
    Water under the bridge, huh? # QEND
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
        -   Don't bother trying to distract me, I already know what you're up to. # AMY
        -   Think you're the first monster I've taken down? I know your tricks # AMY
        -   That's wrong! I can see through your magic! # AMY
        -   I can see trhough your illusions Koi! # AMY
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
        {fallacy == "RED HERRING":
            I should look for words that are unrelated to what he is saying.
            I can't be fooled by his distractions.
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

# AMY
"You're no match for me Koi!"

# KOI
"That's Mr. Ignacio to you!"

# AMY
"It's over!"
"You little reign of terror over the pier is going to be exposed."

# KIT
"This... can't... be..."
"hapening!!!"

-> chapter2.end