=== ch0_battle ===
~BG = BATTLE
# TUTORIAL BATTLE_PHASE
This is the battle phase.
Each round your enemy will try to attack you using a fallacy spell.
Fallacy spells are magical spells made out of lies and half-truths that weaken you're endurance.
If you run out of stamina you will lose the fight.
You can dispel these fallacy spells by identifying their weak points.
Each boss specializes in a certain type of fallacy as indicated in your undercity codex.
Select the words or phrases in the opponent's fallacy spell that contribute the most to it being fallacy in order to dispel them.

~ temp life = 20
~ temp performance = 0
~ temp turn = 0
~ temp fallacy = ""

- (battle_phase)
~ performance = 0
{life <= 0: -> bad_end}
{cycle:
-   <link="-2">OMG!</link> <> # HATTIE QSTART
	<link="-1">You're going to try</link> <>
	<link="-1">to fight me?</link> <>
	<link="-1">That's</link> <>
	<link="1">either</link> <>
	<link="0">the funniest thing</link> <>
	<link="0">I've ever heard</link> <>
	<link="2">or</link> <>
	<link="0">like the saddest!</link> <> # QEND
	~ fallacy = "FALSE DICHOTOMY"
	
    # TUTORIAL
    Finding the weak points of a fallacy spell can be tricky.
    But, you can CONSULT you undercity codex dusring the batttle to help you decide which words to pick.
    Remember that Hattie's special fallacy skill is 【FALSE DICHOTOMY】.
    Try to look for words that try to frame somethings as only one of two things.
    Then when you're ready, click retort to dispel their attack.
-   <link="-1">Tch,</link> <> # HATTIE QSTART
	<link="-2">as if</link> <>
	<link="-1">I'm</link> <>
	<link="-1">going to spend</link> <>
	<link="-1">my time</link> <>
	<link="-1">battling</link> <>
	<link="-1">some poser like</link> <>
	<link="-2">you. </link> <> # QEND
	~ fallacy = "NONE"

    # TUTORIAL
    Watch out! this question is tricky.
    Sometimes, the opponent can show you a statement that does NOT contain the weakness of their special fallacy skill.
    If you try to retort something like this, you will end up wasting your stamina on something that doesn't matter.
    For questions like this, it's best for you to just skip.
    But, be careful when skipping statements that DO have fallacies in them as you can take a lot of damage doing so!
-   -> end
}
~ life -= 10

+ [Retort]
    // SET THE PERFORMANCE VALUE SOMEHOW
    {
    - turn == 0 and performance > 0:
        # AMY
        "It's neither of those two, I'm dead serious about defeating you."
        # TUTORIAL
        Woah good job! You're a natural!
        ~ life += 13
    - turn == 0 and performance > -2:
        # AMY
        "N-no its not that going to be that simple... I think."
        # TUTORIAL
        Nice one!
        A little shaky, but you've got the right idea.
        Try to ignore filler words or phrases that are just there for the structure of the sentence to make you attack stronger next time.
        ~ life += 6
    -   turn == 0:
        # AMY
        "Gah! N-no w-way!"
        I'm not sure what to say!
        # TUTORIAL
        That response was pretty shaky but that's okay.
        Practice makes perfect!
        Try to review yout undercity codex if you're unsure which words you should be picking to dispel Hattie's fallacy spells.
    -   turn == 1:
        # AMY
        "No, that's wrong!"
        # HATTIE
        "Haah? Do you even know what you're talking about?"
        "Hahahahaha\~"
        # AMY
        "Urk! Was that wrong?"
        # TUTORIAL
        Okay seem like you were supposed to skip that one.
        But don't worry!
        Even if you lose a battle, you can always try again next time.
    }
+ [Skip]
    {fallacy == "NONE":
        {shuffle:
        -   You're not worth my time! # AMY
        -   Trying to be tricky eh? # AMY
        -   As if! # AMY
        -   You won't fool me with that! # AMY
        }
        # TUTORIAL
        Alright! Good job!
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
How did I lose??

# HATTIE
"AHAHAHA! You're like so pathetic that it's hillarious\~"

# NARRATOR
Continue?
+ [Yes] -> ch0_battle
+ [No] -> main

- (end)
# HATTIE
"Ngaah!!"
"This totally majorly BLOWS!"
"How am I supposed to take over this territory like this!!"

# AMY
"You're no match for me Hattie!"
"I hope you can make friends in juvie."

# HATTIE
"Kyaah!! No way, no way, no way, no way!"
"Juvie is totally the worst!!"

-> tutorial.end