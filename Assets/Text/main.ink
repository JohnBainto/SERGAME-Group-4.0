INCLUDE chapter0.ink
INCLUDE chapter1.ink
INCLUDE chapter2.ink
INCLUDE chapter0_battle.ink
INCLUDE chapter1_battle.ink
INCLUDE chapter2_battle.ink

LIST BG = PROLOGUE, TITLE_SCREEN, CH00_EXP_BLACK, CH00_EXP_TUTORIAL, CH01_EXP_BLACK, CH01_EXP_OUTSIDE, CH01_EXP_INSIDE, CH01_EXP_PIER, CH01_EXP_BASEMENT, CH02_EXP_BLACK, CH02_EXP_BASEMENT, CH02_EXP_HALLWAY, CH02_EXP_PIER_WET, CH02_EXP_PIER_MOVED, CH00_BATTLE_HATTIE, CH01_BATTLE_KIT, CH02_BATTLE_KOI
VAR INTERACTABLE = false

LIST inventory = clip, key, crane, newspaper, fire, detector

-> prologue

=== prologue ===
~BG = PROLOGUE
# AMY
The city ain't what it used to.
Seems like everyday these streets get darker and darker.
But that's why I'm here.
My name is Amy Buscador.
I'm a hard-boiled investigative journalist working in the city.
Where ever there's a big scoop, you can bet yer mama's sweet jammys that I'm there.
Lately I've been tracking a series 'a stories about gangs of supernatural beings doing organized crime in the city.
Y'know real bump in the night types, spooks ya tell yer friends 'round the campfire types.
They've been running amok in the city, wreckin' havoc, goin' about doin' whatever in tarnation they please.
Its 'cause those... things, they have some sorta magic about them. It's like they can cast these spells that can convince ya real good even though what they're sayin's more bologna than a deli on black friday.
But see, I'm wise to their tricks.
What they don't know 's on top 'a bein' an investigative reporter, I'm also the descendant of a family of powerful <color=yellow>babaylans</color> or monster hunters for short.
I know the truth is more powerful than any 'a their lies.
The <color=yellow>TRUTH</color> can break through any <color=red>FALLACY</color> and if those monsters think they can make my city into they're own personal playground, then they've got another thing comin'.
-> main

=== main ===
~BG = TITLE_SCREEN
Select an option:
+ [Chapter 0 (Tutorial)] -> tutorial
+ [Chapter 1] -> chapter1
+ [Chapter 2] -> chapter2
+ [End] -> END
