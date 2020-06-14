+++
title = "Game Release: Catch the Crow"
highlight = true
math = false
description = " "
image = ""
post_type = ["gamedev"]
see_more_link = "/post/"
date = "2017-04-14T12:43:08+01:00"
thumbnail = "catchthecrown_release.png"
[header]
image = "catchthecrown_release_banner.png"
caption = "Catch The Crown's Splash Screen"
+++


## Release and then move on ...

Finally! After 3 years of uneven and chaotic development (partly due to a PhD), it feels like that's the right time to finalize and ship my first video game. 

{{< figure src="/Blog/img/gamedev/catchthecrown_release/prabbit_winning_lowres.gif" caption="How it feels like to ship a game!" >}}

Catch the Crown is the first game I made with libGDX. It is a multiplayer arena platform game. My pride is that it feels like I am shipping an actual game: it can be run, played and it delivers fun (to my friends at least!). 
You can download it here:

- Windows, portable version ([zip-file](https://github.com/Nodragem/Catch-the-Crown/releases/download/v0.9-alpha/catchthecrown_win32.zip))
- Linux, portable version ([zip-file](https://github.com/Nodragem/Catch-the-Crown/releases/download/v0.9-alpha/catchthecrown_linux32.zip))
- Mac OS, portable version ([zip-file](https://github.com/Nodragem/Catch-the-Crown/releases/download/v0.9-alpha/catchthecrown_mac.zip))

Please find more details about customization on the [Project Page]({{< relref "/project/catchthecrown.md" >}}).

## The Story
I made up most of the story and gameplay with one of my best friends on a 7 hours road trip to Edinburgh :). The basic idea is that in the tribe of the Prabbits - half parrot/half rabbit creatures - four teenagers are undertaking their "Coming-of-Age" ritual. 

{{<figure src="/Blog/img/gamedev/catchthecrown_release/doing_nothing.gif" caption="Three teenager Prabbits chilling out before the Coming-of-Age ritual..." >}}

## The Gameplay
The Prabbits are spawned on a map where there is one Crown while a timer is running. Once the Crown is picked up by a Prabbit, coins, diamonds, and rubies appear across the level. Only the Prabbit with the Crown can collect them. When collected part of the money goes to the Prabbit's gold chest while the other part goes in the Crown itself. 

<figure>
    <img src="/Blog/img/gamedev/catchthecrown_release/timer.gif" width="100%"/>
    <img src="/Blog/img/gamedev/catchthecrown_release/catch_crown.gif" width="100%"/>
    <figcaption>
        Only the Prabbit with the Crown can collect treasures
    </figcaption>
</figure>

A competition starts between Prabbits as everyone wants to catch the Crown and be able to collect gold. When the timer ends, it is the richer Prabbit that wins the turn; players need to win 3 turns to win the tournament and be declared King of the Tournament (see Screenshot1).


## The Character Actions
The Prabbits have several ways to hurt each other. They can throw lances, slap each other, pick up another Prabbit and make a lethal throw. To slap someone increases their fatigue (fatigue marks on his head), which will increase the respawning time the next time they die. Time is precious - the longer a player is waiting to respawn, the less they can collect gold or change the outcome of the game.

{{<figure src="/Blog/img/gamedev/catchthecrown_release/spear_and_slap.gif" caption="Spear, Slap, Trap Combo! I was alone recording, that's why Red is not moving :P" >}}


## What was not implemented
Originally, Catch The Crown was thought to be a cooperative and competitive 2D platform game. A Shaman would have explained the competition rules to the teenager Prabbits. During a round, the players would have a common gold chest in addition to their own. The next level would be unlocked only if the common chest reaches a certain amount of Gold (you can still see this chest in the GUI). 

The levels would have been designed to force cooperative behavior to get more common Gold. Furthermore, the Shaman would summon creatures against which the Prabbits need to fight in cooperation. Thus, to win a tournament would encourage a competitive gameplay, while to unlock a new level would encourage a cooperative gameplay. 

Maybe later I will do a sequel where I will implement more of the stuff I wanted originally. In any case, I will probably come back with new levels for this version of the game. Hope you enjoy the game!