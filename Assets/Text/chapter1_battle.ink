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
    -   <link="c1q1 1">I'm</link> <> # KIT QSTART
		<link="c1q1 2">going</link> <>
		<link="c1q1 3">to send</link> <>
		<link="c1q1 4">you</link> <>
		<link="c1q1 5">to the bottom</link> <>
		<link="c1q1 6">of this</link> <>
		<link="c1q1 7">harbor</link> <>
		<link="c1q1 8">you</link> <>
		<link="c1q1 9">weakling</link> # QEND
		~ fallacy = "AD HOMINEM"
		~ cur_question = c1q1
	-	<link="c1q2 1">The</link> <> # KIT QSTART
		<link="c1q2 2">truth</link> <>
		<link="c1q2 3">is</link> <>
		<link="c1q2 4">only</link> <>
		<link="c1q2 5">one thing</link> <>
		<link="c1q2 6">matters</link> <>
		<link="c1q2 7">in this city,</link> <>
		<link="c1q2 8">MONEY.</link> # QEND
		~ fallacy = "NONE"
		~ cur_question = c1q2
	-	<link="c1q3 1">My gang</link> <> # KIT QSTART
		<link="c1q3 2">will take over</link> <>
		<link="c1q3 3">this city</link> <>
		<link="c1q3 4">and</link> <>
		<link="c1q3 5">we'll crush</link> <>
		<link="c1q3 6">anyone</link> <>
		<link="c1q3 7">who gets</link> <>
		<link="c1q3 8">in the way.</link> # QEND
		~ fallacy = "NONE"
		~ cur_question = c1q3
	-	<link="c1q4 1">You're</link> <> # KIT QSTART
		<link="c1q4 2">out of your depths</link> <>
		<link="c1q4 3">here</link> <>
		<link="c1q4 4">little girl.</link> <>
		<link="c1q4 5">You</link> <>
		<link="c1q4 6">can't stop</link> <>
		<link="c1q4 7">us</link>. <> # QEND
		~ fallacy = "AD HOMINEM"
		~ cur_question = c1q4
	-	<link="c1q5 1">We've been</link> <> # KIT QSTART
		<link="c1q5 2">hiding</link> <>
		<link="c1q5 3">in the shadows</link> <>
		<link="c1q5 4">too long</link> <>
		<link="c1q5 5">for some</link> <>
		<link="c1q5 6">nosy brat</link> <>
		<link="c1q5 7">to expose us.</link> <> # QEND
		~ fallacy = "AD HOMINEM"
		~ cur_question = c1q5
	-	<link="c1q5 1">My gang</link> <> # KIT QSTART
		<link="c1q5 2">will take over</link> <>
		<link="c1q5 3">this city</link> <>
		<link="c1q5 4">and</link> <>
		<link="c1q5 5">we'll crush</link> <>
		<link="c1q5 6">anyone</link> <>
		<link="c1q5 7">who gets</link> <>
		<link="c1q5 8">in the way.</link> <> # QEND
		~ fallacy = "NONE"
		~ cur_question = c1q5
	-	<link="c1q7 1">Monster hunters</link> <> # KIT QSTART
		<link="c1q7 2">like you</link> <>
		<link="c1q7 3">might be able</link> <>
		<link="c1q7 4">to pick us off</link> <>
		<link="c1q7 5">one by one</link> <>
		<link="c1q7 6">but now</link> <>
		<link="c1q7 7">you're</link> <>
		<link="c1q7 8">in our domain.</link> <> # QEND
		~ fallacy = "NONE"
		~ cur_question = c1q7
	-	<link="c1q8 1">You'll</link> <> # KIT QSTART
		<link="c1q8 2">never</link> <>
		<link="c1q8 3">see</link> <>
		<link="c1q8 4">the light of day</link> <>
		<link="c1q8 5">again</link> <>
		<link="c1q8 6">pathetic human!</link> <> # QEND
		~ fallacy = "AD HOMINEM"
		~ cur_question = c1q8
	-	<link="c1q9 1">You're</link> <> # KIT QSTART
		<link="c1q9 2">only doing this</link> <>
		<link="c1q9 3">to earn a living</link> <>
		<link="c1q9 4">too</link> <>
		<link="c1q9 5">aren't you?</link> <>
		<link="c1q9 6">We're</link> <>
		<link="c1q9 7">two sides of the same coin,</link> <>
		<link="c1q9 8">human.</link> <> # QEND
		~ fallacy = "AD HOMINEM"
		~ cur_question = c1q9
	-	<link="1q10 1">Snot nosed</link> <> # KIT QSTART
		<link="1q10 2">brats</link> <>
		<link="1q10 3">like</link> <>
		<link="1q10 4">you</link> <>
		<link="1q10 5">need</link> <>
		<link="1q10 6">to be taught</link> <>
		<link="1q10 7">a lesson!</link> <> # QEND
		~ fallacy = "AD HOMINEM"
		~ cur_question = c1q10
    }
- turn == 2:
    <link="c1s1 1">Huff, huff.</link> <> # KIT QSTART
	<link="c1s1 2">Just</link> <>
	<link="c1s1 3">'cause</link> <>
	<link="c1s1 4">you've</link> <>
	<link="c1s1 5">dodged</link> <>
	<link="c1s1 6">a couple of</link> <>
	<link="c1s1 7">my attacks</link> <>
	<link="c1s1 8">doesn't mean</link> <>
	<link="c1s1 9">you're</link> <>
	<link="c1s1 10">not a weakling</link> <> # QEND
	~ fallacy = "AD HOMINEM"
	~ cur_question = c1s1
- turn == 5:
	<link="c1s2 1">I can't...</link> <> # KIT QSTART
	<link="c1s2 2">possibly</link> <>
	<link="c1s2 3">lose</link> <>
	<link="c1s2 4">to a</link> <>
	<link="c1s2 5">wimpy human</link> <>
	<link="c1s2 6">like</link> <>
	<link="c1s2 7">you!!!</link> <>
	<link="c1s2 8">I</link> <>
	<link="c1s2 9">will end</link> <>
	<link="c1s2 10">you!</link> <> # QEND
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