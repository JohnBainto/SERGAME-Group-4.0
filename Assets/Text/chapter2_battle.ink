=== ch2_battle ===
~BG = BATTLE
# NARRATOR BATTLE_PHASE
The wind is howling and the rain is falling in torrents.
Are you ready?

~ temp life = 30
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
LIST c2s2 = p1=-2,p2=-1,p3=-1,p4=-1,p5=-1,p6=1,p7=1,p8=-1

- (battle_phase)
~ performance = 0
{life <= 0: -> bad_end}
{
- turn == 0 || turn == 1 || turn == 3 || turn == 4 || turn == 5:
    {shuffle:
    -	<link="c2q1 1">Why</list> <> # KOI QSTART
		<link="c2q1 2">don't you</list> <>
		<link="c2q1 3">just leave</list> <>
		<link="c2q1 4">my operation alone?</list> <>
		<link="c2q1 5">There are</list> <>
		<link="c2q1 6">plenty of other fish</list> <>
		<link="c2q1 7">in the sea</list> <>
		<link="c2q1 8">doing crime.</list> <> # QEND
		~ fallacy = "RED HERRING"
		~ cur_question = c2q1
	-	<link="c2q2 1">I</list> <> # KOI QSTART
		<link="c2q2 2">have</list> <>
		<link="c2q2 3">an idea,</list> <>
		<link="c2q2 4">there is a lovely new cafe</list> <>
		<link="c2q2 5">that opened</list> <>
		<link="c2q2 6">on Dapitan</list> <>
		<link="c2q2 7">that you</list> <>
		<link="c2q2 8">could write about</list> <>
		<link="c2q2 9">instead.</list> <> # QEND
		~ fallacy = "RED HERRING"
		~ cur_question = c2q2
	-	<link="c2q3 1">Exposing us</list> <> # KOI QSTART
		<link="c2q3 2">won't remove demand</list> <>
		<link="c2q3 3">you know.</list> <>
		<link="c2q3 4">Cut the problem</list> <>
		<link="c2q3 5">at the root</list> <>
		<link="c2q3 6">by writing a story</list> <>
		<link="c2q3 7">about our clients</list> <>
		<link="c2q3 8">instead.</list> <> # QEND
		~ fallacy = "RED HERRING"
		~ cur_question = c2q3
	-	<link="c2q4 1">You're</list> <> # KOI QSTART
		<link="c2q4 2">so keen</list> <>
		<link="c2q4 3">on exposing</list> <>
		<link="c2q4 4">us</list> <>
		<link="c2q4 5">but you're soaking wet!</list> <>
		<link="c2q4 6">You'll</list> <>
		<link="c2q4 7">get sick</list> <>
		<link="c2q4 8">if you don't dry up.</list> <> # QEND
		~ fallacy = "RED HERRING"
		~ cur_question = c2q4
	-	<link="c2q5 1">Of course</list> <> # KOI QSTART
		<link="c2q5 2">it's alright</list> <>
		<link="c2q5 3">for my business</list> <>
		<link="c2q5 4">to be fishy,</list> <>
		<link="c2q5 5">I am</list> <>
		<link="c2q5 6">a fish</list> <>
		<link="c2q5 7">after all.</list> <> # QEND
		~ fallacy = "RED HERRING"
		~ cur_question = c2q5
	-	<link="c2q6 1">I'll</list> # KOI QSTART
		<link="c2q6 2">let you leave</list> <>
		<link="c2q6 3">if you give me</list> <>
		<link="c2q6 4">that book,</list> <>
		<link="c2q6 5">that's what you want right?</list> <>
		<link="c2q6 6">To leave?</list> <> # QEND
		~ fallacy = "RED HERRING"
		~ cur_question = c2q6
	-	<link="c2q7 1">Why</list> <> # KOI QSTART
		<link="c2q7 2">are you</list> <>
		<link="c2q7 3">disrupting</list> <>
		<link="c2q7 4">my business</list> <>
		<link="c2q7 5">so much.</list> <>
		<link="c2q7 6">Don't</list> <>
		<link="c2q7 7">you</list> <>
		<link="c2q7 8">have anything better to do?</list> <> # QEND
		~ fallacy = "RED HERRING"
		~ cur_question = c2q7
	-	<link="c2q8 1">Hand me</list> <> # KOI QSTART
		<link="c2q8 2">that cursed book</list> <>
		<link="c2q8 3">already!</list> <>
		<link="c2q8 4">You're</list> <>
		<link="c2q8 5">messing</list> <>
		<link="c2q8 6">with powers</list> <>
		<link="c2q8 7">greater than</list> <>
		<link="c2q8 8">you could even understand.</list> <> # QEND
		~ fallacy = "NONE"
		~ cur_question = c2q8
	-	<link="c2q9 1">I</list> <> # KOI QSTART
		<link="c2q9 2">won't let</list> <>
		<link="c2q9 3">you</list> <>
		<link="c2q9 4">tear down</list> <>
		<link="c2q9 5">my operation!</list> <>
		<link="c2q9 6">I'll have you</list> <>
		<link="c2q9 7">sleeping with the fishes</list> <>
		<link="c2q9 8">before that happens.</list> <> # QEND
		~ fallacy = "NONE"
		~ cur_question = c2q9
	-	<link="c2q10 1">How dare you</list> <> # KOI QSTART
		<link="c2q10 2">attack me</list> <>
		<link="c2q10 3">like this.</list> <>
		<link="c2q10 4">I</list> <>
		<link="c2q10 5">am</list> <>
		<link="c2q10 6">a renowned businessman</list> <>
		<link="c2q10 7">with many connections</list> <> # QEND
		~ fallacy = "NONE"
		~ cur_question = c2q10
	-	<link="c2q11 1">The water</list> <> # KOI QSTART
		<link="c2q11 2">is rising faster</list> <>
		<link="c2q11 3">now.</list> <>
		<link="c2q11 4">My business</list> <>
		<link="c2q11 5">will stay afloat</list> <>
		<link="c2q11 6">but I don't think</list> <>
		<link="c2q11 7">you will.</list> <> # QEND
		~ fallacy = "NONE"
		~ cur_question = c2q11
	-	<link="c2q12 1">I'm going to</list> <> # KOI QSTART
		<link="c2q12 2">wash you away</list> <>
		<link="c2q12 3">and</list> <>
		<link="c2q12 4">all the evidence</list> <>
		<link="c2q12 5">you've collected</list> <>
		<link="c2q12 6">with one</list> <>
		<link="c2q12 7">big wave.</list> <> # QEND
		~ fallacy = "NONE"
		~ cur_question = c2q12
    }
- turn == 2:
	<link="c2s1 1">Ngah!</list> <> # KOI QSTART
	<link="c2s1 2">Enough of this,</list> <>
	<link="c2s1 3">allow me</list> <>
	<link="c2s1 4">to make you an offer.</list> <>
	<link="c2s1 5">A hundred thousand pesos</list> <>
	<link="c2s1 6">for that book,</list> <>
	<link="c2s1 7">final offer.</list> <> # QEND
	~ fallacy = "RED HERRING"
	~ cur_question = c2s1
- turn == 6:
	<link="c2s2 1">Huff, huff.</list> <> # KOI QSTART
	<link="c2s2 2">Alright</list> <>
	<link="c2s2 3">you've proven</list> <>
	<link="c2s2 4">your salt.</list> <>
	<link="c2s2 5">Let's call it</list> <>
	<link="c2s2 6">a tie</list> <>
	<link="c2s2 7">and forget all about this.</list> <>
	<link="c2s2 8">Water under the bridge, huh?</list> <> # QEND
	~ fallacy = "RED HERRING"
	~ cur_question = c2s2
- else:
    -> end
}
~ life -= 10

+ [Retort]
    ~ performance += sum(cur_question)
    {
    - performance > 0:
        {shuffle:
        -   Don't bother trying to distract me, I already know what you're up to. # AMY
        -   Think you're the first monster I've taken down? I know your tricks # AMY
        -   That's wrong! I can see through your magic! # AMY
        -   I can see trhough your illusions Koi! # AMY
        }
        ~ life += 13
    - performance > -2:
        {shuffle:
        -   N-no that's not true! # AMY
        -   Ngh, I won't let you under my skin. # AMY
        -   I w-won't give in! # AMY
        -   Mmph! I uhh... t-that's wrong! # AMY
        }
        ~ life += 6
    - else:
        {shuffle:
        -   Ugh! I don't think that was right # AMY
        -   Kyah!! # AMY
        -   Hrngg! # AMY
        -   Ouch! # AMY
        }
        {fallacy == "RED HERRING":
            I should look for words that are unrelated to what he is saying.
            I can't be fooled by his distractions.
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
        ~ life += 10
    -   else:
        {shuffle:
        -   Uhh, pass! # AMY
        -   That's... # AMY
        -   Ah! Wait no, hmm... # AMY
        -   ??? # AMY
        }
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
+ [Yes] -> ch2_battle
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