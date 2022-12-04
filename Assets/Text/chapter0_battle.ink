VAR _performance = 0
VAR _life = 30
VAR _turn = 0
VAR _result = ""
=== ch0_battle ===
~BG = BATTLE
# NARRATOR TUTORIAL BATTLE_PHASE LOAD CODEX
This is the battle phase.# NARRATOR
Each round your enemy will try to attack you using a fallacy spell.# NARRATOR
Fallacy spells are magical spells made out of lies and half-truths that weaken you're endurance.# NARRATOR
If you run out of stamina you will lose the fight.# NARRATOR
You can dispel these fallacy spells by identifying their weak points.# NARRATOR
Each boss specializes in a certain type of fallacy as indicated in your undercity codex.# NARRATOR
Select the words or phrases in the opponent's fallacy spell that contribute the most to it being fallacy in order to dispel them.# NARRATOR START BATTLE BTN

~ temp fallacy = ""

- (battle_phase)
~ _performance = 0
{_life <= 0: -> bad_end}
{cycle:
-   <link="-2">OMG</link>! <> # HATTIE QSTART
	<link="-1">You're going to try</link> <>
	<link="-1">to fight me</link>? <>
	<link="-1">That's</link> <>
	<link="1">either</link> <>
	<link="0">the funniest thing</link> <>
	<link="0">I've ever heard</link> <>
	<link="2">or</link> <>
	<link="0">like the saddest</link>! # QEND
	~ fallacy = "FALSE DICHOTOMY"
	
    # NARRATOR  # TUTORIAL
    Finding the weak points of a fallacy spell can be tricky.# NARRATOR
    But, you can CONSULT you undercity codex during the batttle to help you decide which words to pick.# NARRATOR
    Remember that Hattie's special fallacy skill is 【FALSE DICHOTOMY】.# NARRATOR
    Try to look for words that try to frame somethings as only one of two things.# NARRATOR
    Then when you're ready, click retort to dispel their attack.# NARRATOR
    
-   <link="-1">Tch</link>, <> # HATTIE QSTART
	<link="-2">as if</link> <>
	<link="-1">I'm</link> <>
	<link="-1">going to spend</link> <>
	<link="-1">my time</link> <>
	<link="-1">battling</link> <>
	<link="-1">some poser like</link> <>
	<link="-2">you</link>. # QEND
	~ fallacy = "NONE"

    # TUTORIAL
    Watch out! this question is tricky.# NARRATOR
    Sometimes, the opponent can show you a statement that does NOT contain the weakness of their special fallacy skill.# NARRATOR
    If you try to retort something like this, you will end up wasting your stamina on something that doesn't matter.# NARRATOR
    For questions like this, it's best for you to just skip.# NARRATOR
    But, be careful when skipping statements that DO have fallacies in them as you can take a lot of damage doing so!# NARRATOR
-   -> end
}
~ set_life(-10)

+ [RETORT]
    // SET THE PERFORMANCE VALUE SOMEHOW
    {
    - _turn == 0 and _performance > 0:
        # AMY
        "It's neither of those two, I'm dead serious about defeating you."
        # TUTORIAL
        Woah good job! You're a natural!
        ~ set_life(13)
    - _turn == 0 and _performance > -2:
        # AMY
        "N-no its not that going to be that simple... I think."
        # TUTORIAL
        Nice one!
        A little shaky, but you've got the right idea.
        Try to ignore filler words or phrases that are just there for the structure of the sentence to make you attack stronger next time.
        ~ set_life(6)
    -   _turn == 0:
        # AMY
        "Gah! N-no w-way!"
        I'm not sure what to say!
        # TUTORIAL
        That response was pretty shaky but that's okay.
        Practice makes perfect! # TUTORIAL
        Try to review yout undercity codex if you're unsure which words you should be picking to dispel Hattie's fallacy spells. # TUTORIAL
    -   _turn == 1:
        # AMY
        "No, that's wrong!"
        # HATTIE
        "Haah? Do you even know what you're talking about?"
        "Hahahahaha\~"  # HATTIE
        # AMY
        "Urk! Was that wrong?"
        # TUTORIAL
        Okay seem like you were supposed to skip that one.
        But don't worry! # TUTORIAL
        Even if you lose a battle, you can always try again next time. # TUTORIAL
    }
+ [SKIP]
    {fallacy == "NONE":
        {shuffle:
        -   You're not worth my time! # AMY
        -   Trying to be tricky eh? # AMY
        -   As if! # AMY
        -   You won't fool me with that! # AMY
        }
        # TUTORIAL
        Alright! Good job!
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
How did I lose??

# HATTIE
"AHAHAHA! You're like so pathetic that it's hillarious\~"

# NARRATOR
~ _result = "LOSE"
Continue?
+ [Repeat Tutorial] -> ch0_battle
+ [Main Menu] -> main

- (end)
# HATTIE
"Ngaah!!"
"This totally majorly BLOWS!" # HATTIE
"How am I supposed to take over this territory like this!!" # HATTIE

# AMY
"You're no match for me Hattie!"
"I hope you can make friends in juvie." # AMY

# HATTIE
"Kyaah!! No way, no way, no way, no way!"
"Juvie is totally the worst!!" # HATTIE
~ _result = "WIN"
-> tutorial.end

== function set_performance(amount) ==
~ _performance = amount

== function set_life(add_amount) ==
~ _life += add_amount

== function set_turn(add_amount) ==
~ _turn += add_amount