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
LIST c1q4 = p1=1,p2=0,p3=-1,p4=2,p5=0,p6=0,p7=-1
LIST c1q5 = p1=1,p2=1,p3=0,p4=2,p5=1,p6=1,p7=0
LIST c1q6 = p1=-1,p2=-1,p3=-1,p4=-2,p5=-2,p6=-1,p7=2,p8=-1
LIST c1q7 = p1=-1,p2=-1,p3=-1,p4=-1,p5=-1,p6=-1,p7=-1,p8=-1
LIST c1q8 = p1=1,p2=0,p3=0,p4=-1,p5=-1,p6=2
LIST c1q9 = p1=1,p2=1,p3=1,p4=-1,p5=-1,p6=1,p7=0,p8=1
LIST c1q10 = p1=2,p2=2,p3=0,p4=1,p5=-1,p6=-1,p7=-1

LIST c1s1 = p1=-3, p2=-1, p3=-1, p4=1, p5=0, p6=0, p=0, p8=1, p9=2, p10=2
LIST c1s2 = p1=0, p2=-1, p3=0, p4=-1, p5=3, p6=0, p=2, p8=0, p9=1, p10=2

- (battle_phase)
~ performance = 0
{life <= 0: -> bad_end}
{
- turn == 0 || turn == 1 || turn == 3 || turn == 4:
    {shuffle:
    	-	<link="c1q1 1">I'm</list> <> # KIT QSTART
		<link="c1q1 2">going</list> <>
		<link="c1q1 3">to send</list> <>
		<link="c1q1 4">you</list> <>
		<link="c1q1 5">to the bottom</list> <>
		<link="c1q1 6">of this</list> <>
		<link="c1q1 7">harbor</list> <>
		<link="c1q1 8">you</list> <>
		<link="c1q1 9">weakling</list> <> # QEND
		~ fallacy = "AD HOMINEM"
		~ cur_question = c1q1
	-	<link="c1q2 1">The</list> <> # KIT QSTART
		<link="c1q2 2">truth</list> <>
		<link="c1q2 3">is</list> <>
		<link="c1q2 4">only</list> <>
		<link="c1q2 5">one thing</list> <>
		<link="c1q2 6">matters</list> <>
		<link="c1q2 7">in this city,</list> <>
		<link="c1q2 8">MONEY.</list> <> # QEND
		~ fallacy = "NONE"
		~ cur_question = c1q2
	-	<link="c1q3 1">My gang</list> <> # KIT QSTART
		<link="c1q3 2">will take over</list> <>
		<link="c1q3 3">this city</list> <>
		<link="c1q3 4">and</list> <>
		<link="c1q3 5">we'll crush</list> <>
		<link="c1q3 6">anyone</list> <>
		<link="c1q3 7">who gets</list> <>
		<link="c1q3 8">in the way.</list> <> # QEND
		~ fallacy = "NONE"
		~ cur_question = c1q3
	-	<link="c1q4 1">You're</list> <> # KIT QSTART
		<link="c1q4 2">out of your depths</list> <>
		<link="c1q4 3">here</list> <>
		<link="c1q4 4">little girl.</list> <>
		<link="c1q4 5">You</list> <>
		<link="c1q4 6">can't stop</list> <>
		<link="c1q4 7">us</list> <> # QEND
		~ fallacy = "AD HOMINEM"
		~ cur_question = c1q4
	-	<link="c1q5 1">We've been</list> <> # KIT QSTART
		<link="c1q5 2">hiding</list> <>
		<link="c1q5 3">in the shadows</list> <>
		<link="c1q5 4">too long</list> <>
		<link="c1q5 5">for some</list> <>
		<link="c1q5 6">nosy brat</list> <>
		<link="c1q5 7">to expose us.</list> <> # QEND
		~ fallacy = "AD HOMINEM"
		~ cur_question = c1q5
	-	<link="c1q5 1">My gang</list> <> # KIT QSTART
		<link="c1q5 2">will take over</list> <>
		<link="c1q5 3">this city</list> <>
		<link="c1q5 4">and</list> <>
		<link="c1q5 5">we'll crush</list> <>
		<link="c1q5 6">anyone</list> <>
		<link="c1q5 7">who gets</list> <>
		<link="c1q5 8">in the way.</list> <> # QEND
		~ fallacy = "NONE"
		~ cur_question = c1q5
	-	<link="c1q7 1">Monster hunters</list> <> # KIT QSTART
		<link="c1q7 2">like you</list> <>
		<link="c1q7 3">might be able</list> <>
		<link="c1q7 4">to pick us off</list> <>
		<link="c1q7 5">one by one</list> <>
		<link="c1q7 6">but now</list> <>
		<link="c1q7 7">you're</list> <>
		<link="c1q7 8">in our domain.</list> <> # QEND
		~ fallacy = "NONE"
		~ cur_question = c1q7
	-	<link="c1q8 1">You'll</list> <> # KIT QSTART
		<link="c1q8 2">never</list> <>
		<link="c1q8 3">see</list> <>
		<link="c1q8 4">the light of day</list> <>
		<link="c1q8 5">again</list> <>
		<link="c1q8 6">pathetic human!</list> <> # QEND
		~ fallacy = "AD HOMINEM"
		~ cur_question = c1q8
	-	<link="c1q9 1">You're</list> <> # KIT QSTART
		<link="c1q9 2">only doing this</list> <>
		<link="c1q9 3">to earn a living</list> <>
		<link="c1q9 4">too</list> <>
		<link="c1q9 5">aren't you?</list> <>
		<link="c1q9 6">We're</list> <>
		<link="c1q9 7">two sides of the same coin,</list> <>
		<link="c1q9 8">human.</list> <> # QEND
		~ fallacy = "AD HOMINEM"
		~ cur_question = c1q9
	-	<link="1q10 1">Snot nosed</list> <> # KIT QSTART
		<link="1q10 2">brats</list> <>
		<link="1q10 3">like</list> <>
		<link="1q10 4">you</list> <>
		<link="1q10 5">need</list> <>
		<link="1q10 6">to be taught</list> <>
		<link="1q10 7">a lesson!</list> <> # QEND
		~ fallacy = "AD HOMINEM"
		~ cur_question = c1q10
    }
- turn == 2:
    <link="c1s1 1">Huff, huff.</list> <> # KIT QSTART
	<link="c1s1 2">Just</list> <>
	<link="c1s1 3">'cause</list> <>
	<link="c1s1 4">you've</list> <>
	<link="c1s1 5">dodged</list> <>
	<link="c1s1 6">a couple of</list> <>
	<link="c1s1 7">my attacks</list> <>
	<link="c1s1 8">doesn't mean</list> <>
	<link="c1s1 9">you're</list> <>
	<link="c1s1 10">not a weakling</list> <> # QEND
	~ fallacy = "AD HOMINEM"
	~ cur_question = c1s1
- turn == 5:
	<link="c1s2 1">I can't...</list> <> # KIT QSTART
	<link="c1s2 2">possibly</list> <>
	<link="c1s2 3">lose</list> <>
	<link="c1s2 4">to a</list> <>
	<link="c1s2 5">wimpy human</list> <>
	<link="c1s2 6">like</list> <>
	<link="c1s2 7">you!!!</list> <>
	<link="c1s2 8">I</list> <>
	<link="c1s2 9">will end</list> <>
	<link="c1s2 10">you!</list> <> # QEND
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