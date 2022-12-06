=== ch1_battle ===
~ ch0_evidence += ch0_evidence.e1
~ ch1_evidence += ch1_evidence.e1
~ ch1_evidence += ch1_evidence.e2
~ ch1_evidence += ch1_evidence.e3
~BG = CH01_BATTLE_KIT
~ _performance = 0
~ _life = 30
~ _turn = 0
~ _result = ""
# NARRATOR BATTLE_PHASE LOAD CODEX START BATTLE BTN
It feels like you're going to be sleeping with the fishes soon.
~ temp fallacy = ""

- (battle_phase)
~ _performance = 0
{_life <= 0: -> bad_end}
{
- _turn == 0 || _turn == 1 || _turn == 3 || _turn == 4:
    {shuffle:
    -	<link="-1">I'm</link> <> # KIT QSTART
		<link="-2">going</link> <>
		<link="-1">to send</link> <>
		<link="1">you</link> <>
		<link="-1">to the bottom</link> <>
		<link="-1">of this</link> <>
		<link="-1">harbor</link> <>
		<link="1">you</link> <>
		<link="2">weakling</link>. <> # QEND
		~ fallacy = "AD HOMINEM"
	-	<link="-1">The</link> <> # KIT QSTART
		<link="-2">truth</link> <>
		<link="-1">is</link> <>
		<link="-1">only</link> <>
		<link="-1">one thing</link> <>
		<link="-1">matters</link> <>
		<link="-1">in this city</link>, <>
		<link="-2">MONEY</link>. <> # QEND
		~ fallacy = "NONE"
	-	<link="-1">My gang</link> <> # KIT QSTART
		<link="-2">will take over</link> <>
		<link="-1">this city</link> <>
		<link="-2">and</link> <>
		<link="0">we'll crush</link> <>
		<link="0">anyone</link> <>
		<link="-1">who gets</link> <>
		<link="-1">in the way</link>. <> # QEND
		~ fallacy = "NONE"
	-	<link="1">You're</link> <> # KIT QSTART
		<link="0">out of your depths</link> <>
		<link="-1">here</link> <>
		<link="2">little girl</link>. <>
		<link="0">You</link> <>
		<link="0">can't stop</link> <>
		<link="-1">us</link>! <> # QEND
		~ fallacy = "AD HOMINEM"
	-	<link="-1">We've been</link> <> # KIT QSTART
		<link="-1">hiding</link> <>
		<link="-1">in the shadows</link> <>
		<link="-1">too long</link> <>
		<link="1">for some</link> <>
		<link="1">nosy brat</link> <>
		<link="0">to expose us</link>. <> # QEND
		~ fallacy = "AD HOMINEM"
	-	<link="-1">Monster hunters</link> <> # KIT QSTART
		<link="-1">like you</link> <>
		<link="-1">might be able</link> <>
		<link="-1">to pick us off</link> <>
		<link="-1">one by one</link> <>
		<link="-1">but now</link> <>
		<link="-1">you're</link> <>
		<link="-1">in our domain</link>. <> # QEND
		~ fallacy = "NONE"
	-	<link="1">You'll</link> <> # KIT QSTART
		<link="0">never</link> <>
		<link="0">see</link> <>
		<link="-1">the light of day</link> <>
		<link="-1">again</link> <>
		<link="2">pathetic human</link>! <> # QEND
		~ fallacy = "AD HOMINEM"
	-	<link="1">You're</link> <> # KIT QSTART
		<link="1">only doing this</link> <>
		<link="1">to earn a living</link> <>
		<link="-1">too</link> <>
		<link="-1">aren't you</link>? <>
		<link="1">We're</link> <>
		<link="0">two sides of the same coin</link>, <>
		<link="1">human</link>. <> # QEND
		~ fallacy = "AD HOMINEM"
	-	<link="2">Snot nosed</link> <> # KIT QSTART
		<link="2">brats</link> <>
		<link="0">like</link> <>
		<link="1">you</link> <>
		<link="-1">need</link> <>
		<link="-1">to be taught</link> <>
		<link="-1">a lesson</link>! <> # QEND
		~ fallacy = "AD HOMINEM"
    }
- _turn == 2:
    <link="-3">Huff, huff</link>. <> # KIT QSTART
	<link="-1">Just</link> <>
	<link="-1">'cause</link> <>
	<link="1">you've</link> <>
	<link="0">dodged</link> <>
	<link="0">a couple of</link> <>
	<link="0">my attacks</link> <>
	<link="1">doesn't mean</link> <>
	<link="2">you're</link> <>
	<link="2">not a weakling</link>. <> # QEND
	~ fallacy = "AD HOMINEM"
- _turn == 5:
	<link="0">I can't</link>... <> # KIT QSTART
	<link="-1">possibly</link> <>
	<link="0">lose</link> <>
	<link="-1">to a</link> <>
	<link="3">wimpy human</link> <>
	<link="0">like</link> <>
	<link="1">you</link>!!! <>
	<link="0">I</link> <>
	<link="1">will end</link> <>
	<link="2">you</link>! <> # QEND
	~ fallacy = "AD HOMINEM"
- else:
    -> end
}
~ set_life(-10)
+ [RETORT]
    // SET THE PERFORMANCE VALUE SOMEHOW
    {
    - _performance > 0:
        ~ set_life(13)
        {shuffle:
        -   Tch, intimidation? That ain't gonna work on me. # AMY
        -   Think you're the first monster I've taken down? I know your tricks # AMY
        -   That's wrong! I can see through your magic! # AMY
        -   I'm not afraid of you! # AMY
        }
       
    - _performance > -2:
        ~ set_life(6)
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
            I should look for words that are attacking or insulting me directly to unravel his fallacy spell. # AMY
        -   else:
            I don't think that one even had a fallacy. # AMY
            I should be more careful next time. # AMY
        }
    }
+ [SKIP]
    {fallacy == "NONE":
        ~ set_life(10)
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
    }
~ set_turn(1)
- -> battle_phase


- (bad_end)
# AMY
Urk! # AMY
I can't go on! # AMY
Is this the end? # AMY

# KIT
"Huff, toss 'em into the bay."

# NARRATOR
~ _result = "LOSE"
Continue?
+ [Try Again] -> ch1_battle
+ [Main Menu] -> main

- (end)
# KIT
"Hrngg!" # KIT
"This.." # KIT
"How is this possible!?" # KIT

# AMY
"It's over Kit!" # AMY
"You're done for." # AMY
"I'm puttin' you and your entire posse on the front page of every paper in Wetro Wanila." # AMY

# KIT
"Defeated..." # KIT
"by a weak human." # KIT
"Hurmph" # KIT
~ _result = "WIN"
-> chapter1.end