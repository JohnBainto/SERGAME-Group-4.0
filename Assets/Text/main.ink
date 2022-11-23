INCLUDE chapter0.ink
INCLUDE chapter1.ink
INCLUDE chapter2.ink
INCLUDE chapter2_battle.ink


LIST BG = BLACK, OUTSIDE, INSIDE, PIER, BASEMENT, HALLWAY
VAR INTERACTIBLE = false

-> prologue

/* 
    TAGS
    Tags continue on until they are replace with another tag.
    Text from the main character with no quotation marks mean internal thoughts.
    
    NARRATOR
        - text from an omniscient narrator
        - italicized, gray, no quotation marks
    UNKNOWN
        - the characters name in the dialog box appears as "???"
    HIDDEN
        - the character's portrait is a dark sillhoutte
    Normal character tags
    Every other character
        - normal, black, with quotation marks
*/

=== prologue ===
PROLOGUE
# MC
The city ain't what it used to.
Seems like everyday these streets get darker and darker.
But that's why I'm here.
My name is Amy Buscador.
I'm a hard-boiled investigative journalist working in the city.
Where ever there's a big scoop, you can bet yer mama's sweet jammys that I'm there.
Lately I've been tracking a series 'a stories about supernatural beings infiltratin' the local government  infrastructure.
Y'know real bump in the night types, spooks ya tell yer friends 'round the campfire types.
They've been running amok in the city, wreckin' havoc, goin' about doin' whatever in tarnation they please.
Its 'cause those... things, they have some sorta magic about them. It's like they can cast these spells that can convince ya real good even though what they're sayin's more bologna than a deli on black friday.
But see, I'm wise to their tricks.
What they don't know 's on top 'a bein' an investigative reporter, I'm also the descendant of a family of powerful <color=yellow>babaylans</color> or monster hunters for short.
I know the truth is more powerful than any 'a their lies.
The <color=yellow>TRUTH</color> can break through any <color=red>FALLACY</color> and if those monsters think they can make my city into they're own personal playground, then they've got another thing comin'.
-> main

=== main ===
+ [Chapter 0 (Tutorial)] -> tutorial
+ [Chapter 1] -> chapter1
+ {chapter1.end} [Chapter 2] -> chapter2
+ [End] -> END
