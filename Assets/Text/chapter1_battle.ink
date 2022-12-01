=== ch1_battle ===
~BG = BATTLE
# NARRATOR BATTLE_PHASE
It feels like you're going to be sleeping with the fishes soon.

~ temp life = 30
~ temp performance = 0
~ temp turn = 0
~ temp fallacy = ""

- (battle_phase)
~ performance = 0
{life <= 0: -> bad_end}
{
- turn == 0 || turn == 1 || turn == 3 || turn == 4:
    {shuffle:
    -	<link="-1">I'm</link> <> # KIT QSTART
		<link="-2">going</link> <>
		<link="-1">to send</link> <>
		<link="1">you</link> <>
		<link="-1">to the bottom</link> <>
		<link="-1">of this</link> <>
		<link="-1">harbor</link> <>
		<link="1">you</link> <>
		<link="2">weakling</link> <> # QEND
		~ fallacy = "AD HOMINEM"
	-	<link="-1">The</link> <> # KIT QSTART
		<link="-2">truth</link> <>
		<link="-1">is</link> <>
		<link="-1">only</link> <>
		<link="-1">one thing</link> <>
		<link="-1">matters</link> <>
		<link="-1">in this city,</link> <>
		<link="-2">MONEY.</link> <> # QEND
		~ fallacy = "NONE"
	-	<link="-1">My gang</link> <> # KIT QSTART
		<link="-2">will take over</link> <>
		<link="-1">this city</link> <>
		<link="-2">and</link> <>
		<link="0">we'll crush</link> <>
		<link="0">anyone</link> <>
		<link="-1">who gets</link> <>
		<link="-1">in the way.</link> <> # QEND
		~ fallacy = "NONE"
	-	<link="1">You're</link> <> # KIT QSTART
		<link="0">out of your depths</link> <>
		<link="-1">here</link> <>
		<link="2">little girl.</link> <>
		<link="0">You</link> <>
		<link="-0>can't stop</link> <>
		<link="-1">us</link> <> # QEND
		~ fallacy = "AD HOMINEM"
	-	<link="-1">We've been</link> <> # KIT QSTART
		<link="-1">hiding</link> <>
		<link="-1">in the shadows</link> <>
		<link="-1">too long</link> <>
		<link="1">for some</link> <>
		<link="1">nosy brat</link> <>
		<link="0">to expose us.</link> <> # QEND
		~ fallacy = "AD HOMINEM"
	-	<link="-1">My gang</link> <> # KIT QSTART
		<link="-1">will take over</link> <>
		<link="-1">this city</link> <>
		<link="-2">and</link> <>
		<link="-2">we'll crush</link> <>
		<link="-1">anyone</link> <>
		<link="-2">who gets</link> <>
		<link="-1">in the way.</link> <> # QEND
		~ fallacy = "NONE"
	-	<link="-1">Monster hunters</link> <> # KIT QSTART
		<link="-1">like you</link> <>
		<link="-1">might be able</link> <>
		<link="-1">to pick us off</link> <>
		<link="-1">one by one</link> <>
		<link="-1">but now</link> <>
		<link="-1">you're</link> <>
		<link="-1">in our domain.</link> <> # QEND
		~ fallacy = "NONE"
	-	<link="1">You'll</link> <> # KIT QSTART
		<link="0">never</link> <>
		<link="0">see</link> <>
		<link="-1">the light of day</link> <>
		<link="-1">again</link> <>
		<link="2">pathetic human!</link> <> # QEND
		~ fallacy = "AD HOMINEM"
	-	<link="1">You're</link> <> # KIT QSTART
		<link="1">only doing this</link> <>
		<link="1">to earn a living</link> <>
		<link="-1">too</link> <>
		<link="-1">aren't you?</link> <>
		<link="1">We're</link> <>
		<link="0">two sides of the same coin,</link> <>
		<link="1">human.</link> <> # QEND
		~ fallacy = "AD HOMINEM"
	-	<link="2">Snot nosed</link> <> # KIT QSTART
		<link="2">brats</link> <>
		<link="0">like</link> <>
		<link="1">you</link> <>
		<link="-1">need</link> <>
		<link="-1">to be taught</link> <>
		<link="-1">a lesson!</link> <> # QEND
		~ fallacy = "AD HOMINEM"
    }
- turn == 2:
    <link="-3">Huff, huff.</link> <> # KIT QSTART
	<link="-1">Just</link> <>
	<link="-1">'cause</link> <>
	<link="1">you've</link> <>
	<link="0">dodged</link> <>
	<link="0">a couple of</link> <>
	<link="0">my attacks</link> <>
	<link="1">doesn't mean</link> <>
	<link="2">you're</link> <>
	<link="2">not a weakling</link> <> # QEND
	~ fallacy = "AD HOMINEM"
- turn == 5:
	<link="0">I can't...</link> <> # KIT QSTART
	<link="-1">possibly</link> <>
	<link="0">lose</link> <>
	<link="-1">to a</link> <>
	<link="3">wimpy human</link> <>
	<link="0">like</link> <>
	<link="1">you!!!</link> <>
	<link="0">I</link> <>
	<link="1">will end</link> <>
	<link="2">you!</link> <> # QEND
	~ fallacy = "AD HOMINEM"
- else:
    -> end
}
~ life -= 10

+ [Retort]
    // SET THE PERFORMANCE VALUE SOMEHOW
    {
    - performance > 0:
        {shuffle:
        -   Tch, intimidation? That ain't gonna work on me. # AMY
        -   Think you're the first monster I've taken down? I know your tricks # AMY
        -   That's wrong! I can see through your magic! # AMY
        -   I'm not afraid of you! # AMY
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