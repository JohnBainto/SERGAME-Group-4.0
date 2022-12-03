=== ch2_battle ===
~BG = BATTLE

~ _performance = 0
~ _life = 30
~ _turn = 0
~ _result = ""
# NARRATOR BATTLE_PHASE LOAD CODEX
The wind is howling and the rain is falling in torrents.
Are you ready?

~ temp fallacy = ""

- (battle_phase)
~ _performance = 0
{_life <= 0: -> bad_end}
{
- _turn == 0 || _turn == 1 || _turn == 3 || _turn == 4 || _turn == 5:
    {shuffle:
    -	<link="-1">Why</link> <> # KOI QSTART
		<link="0">don't you</link> <>
		<link="1">just leave</link> <>
		<link="1">my operation alone</link>? <>
		<link="-1">There are</link> <>
		<link="1">plenty of other fish</link> <>
		<link="0">in the sea</link> <>
		<link="1">doing crime</link>. <> # QEND
		~ fallacy = "RED HERRING"
	-	<link="-1">I</link> <> # KOI QSTART
		<link="-2">have</link> <>
		<link="-2">an idea</link>, <>
		<link="1">there is a lovely new cafe</link> <>
		<link="0">that opened</link> <>
		<link="0">on Dapitan</link> <>
		<link="0">that you</link> <>
		<link="1">could write about</link> <>
		<link="1">instead</link>. <> # QEND
		~ fallacy = "RED HERRING"
	-	<link="0">Exposing us</link> <> # KOI QSTART
		<link="1">won't remove demand</link> <>
		<link="-1">you know</link>. <>
		<link="0">Cut the problem</link> <>
		<link="-1">at the root</link> <>
		<link="1">by writing a story</link> <>
		<link="1">about our clients</link> <>
		<link="1">instead</link>. <> # QEND
		~ fallacy = "RED HERRING"
	-	<link="-1">You're</link> <> # KOI QSTART
		<link="-1">so keen</link> <>
		<link="-1">on exposing</link> <>
		<link="-1">us</link> <>
		<link="1">but you're soaking wet</link>! <>
		<link="0">You'll</link> <>
		<link="1">get sick</link> <>
		<link="1">if you don't dry up</link>. <> # QEND
		~ fallacy = "RED HERRING"
	-	<link="-1">Of course</link> <> # KOI QSTART
		<link="1">it's alright</link> <>
		<link="-1">for my business</link> <>
		<link="0">to be fishy</link>, <>
		<link="1">I am</link> <>
		<link="1">a fish</link> <>
		<link="0">after all</link>. <> # QEND
		~ fallacy = "RED HERRING"
	-	<link="-1">I'll</link> # KOI QSTART
		<link="-1">let you leave</link> <>
		<link="-1">if you give me</link> <>
		<link="-1">that book</link>, <>
		<link="1">that's what you want right</link>? <>
		<link="1">To leave</link>? <> # QEND
		~ fallacy = "RED HERRING"
	-	<link="-1">Why</link> <> # KOI QSTART
		<link="-1">are you</link> <>
		<link="-1">disrupting</link> <>
		<link="-1">my business</link> <>
		<link="-1">so much</link>. <>
		<link="1">Don't</link> <>
		<link="0">you</link> <>
		<link="1">have anything better to do</link>? <> # QEND
		~ fallacy = "RED HERRING"
	-	<link="-1">Hand me</link> <> # KOI QSTART
		<link="-1">that cursed book</link> <>
		<link="-1">already</link>! <>
		<link="-1">You're</link> <>
		<link="-1">messing</link> <>
		<link="-1">with powers</link> <>
		<link="-1">greater than</link> <>
		<link="-1">you could even understand</link>. <> # QEND
		~ fallacy = "NONE"
	-	<link="-1">I</link> <> # KOI QSTART
		<link="-1">won't let</link> <>
		<link="-1">you</link> <>
		<link="-1">tear down</link> <>
		<link="-1">my operation!</link> <>
		<link="-1">I'll have you</link> <>
		<link="-1">sleeping with the fishes</link> <>
		<link="-1">before that happens</link>. <> # QEND
		~ fallacy = "NONE"
	-	<link="-1">How dare you</link> <> # KOI QSTART
		<link="-1">attack me</link> <>
		<link="-1">like this</link>. <>
		<link="-1">I</link> <>
		<link="-1">am</link> <>
		<link="-1">a renowned businessman</link> <>
		<link="-1">with many connections</link> <> # QEND
		~ fallacy = "NONE"
	-	<link="-1">The water</link> <> # KOI QSTART
		<link="-1">is rising faster</link> <>
		<link="-1">now</link>. <>
		<link="-1">My business</link> <>
		<link="-1">will stay afloat</link> <>
		<link="-1">but I don't think</link> <>
		<link="-1">you will</link>. <> # QEND
		~ fallacy = "NONE"
	-	<link="-1">I'm going to</link> <> # KOI QSTART
		<link="-1">wash you away</link> <>
		<link="-1">and</link> <>
		<link="-1">all the evidence</link> <>
		<link="-1">you've collected</link> <>
		<link="-1">with one</link> <>
		<link="-1">big wave</link>. <> # QEND
		~ fallacy = "NONE"
    }
- _turn == 2:
	<link="-2">Ngah</link>! <> # KOI QSTART
	<link="1">Enough of this</link>, <>
	<link="-1">allow me</link> <>
	<link="1">to make you an offer</link>. <>
	<link="1">A hundred thousand pesos</link> <>
	<link="0">for that book</link>, <>
	<link="0">final offer</link>. <> # QEND
	~ fallacy = "RED HERRING"
- _turn == 6:
	<link="-2">Huff, huff</link>. <> # KOI QSTART
	<link="-1">Alright</link> <>
	<link="-1">you've proven</link> <>
	<link="-1">your salt</link>. <>
	<link="-1">Let's call it</link> <>
	<link="1">a tie</link> <>
	<link="1">and forget all about this</link>. <>
	<link="-1">Water under the bridge, huh</link>? <> # QEND
	~ fallacy = "RED HERRING"
- else:
    -> end
}
~ set_life(-10)

+ [RETORT]
    // SET THE PERFORMANCE VALUE SOMEHOW
    {
    - _performance > 0:
        {shuffle:
        -   Don't bother trying to distract me, I already know what you're up to. # AMY
        -   Think you're the first monster I've taken down? I know your tricks # AMY
        -   That's wrong! I can see through your magic! # AMY
        -   I can see trhough your illusions Koi! # AMY
        }
        ~ set_life(13)
    - _performance > -2:
        {shuffle:
        -   N-no that's not true! # AMY
        -   Ngh, I won't let you under my skin. # AMY
        -   I w-won't give in! # AMY
        -   Mmph! I uhh... t-that's wrong! # AMY
        }
        ~ set_life(6)
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
+ [SKIP]
    {fallacy == "NONE":
        {shuffle:
        -   You're not worth my time! # AMY
        -   Trying to be tricky eh? # AMY
        -   As if! # AMY
        -   You won't fool me with that! # AMY
        }
        ~ set_life(10)
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
Urk!
I can't go on! # AMY
Is this the end? # AMY

# KOI
"That will teach you to meddle in my affairs."

# NARRATOR
~ _result = "LOSE"
Continue?
+ [Try Again] -> ch2_battle
+ [Main Menu] -> main

- (end)
# KOI
"Aaarrghh!!"
"How dare you, y-you gutter trash!" # KOI

# AMY
"You're no match for me Koi!"

# KOI
"That's Mr. Ignacio to you!"

# AMY
"It's over!"
"You little reign of terror over the pier is going to be exposed." # AMY

# KIT
"This... can't... be..."
"hapening!!!" # KIT
~ _result = "WIN"
-> chapter2.end