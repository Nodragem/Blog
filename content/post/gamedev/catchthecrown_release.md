+++
title = "Game Release: Catch the Crow"
highlight = true
math = false
summary = " "
image = ""
categories = ["gamedev"]
see_more_link = "/post/"
date = "2017-04-14T12:43:08+01:00"
thumbnail = "catchthecrown_release.png"
[header]
image = "catchthecrown_release_banner.png"
caption = "Catch The Crown's Splash Screen"
+++


## Release and then move on ...

Finally! After 3 years of uneven and chaotic development (partly due to a PhD, more details [here]({{< relref "blog/post.md" >}})), it feels like that it is the right time to finalize, freeze and ship my first video game. 

{{< figure src="/Blog/img/gamedev/catchthecrown_release/prabbit_winning_lowres.gif" title="How it feels like to ship a game!" >}}

Catch the Crown is the first game I made with libGDX. It is a multiplayer arena platform game. My pride is that it feels like I am shipping an actual game: it can be run, played and it delivers fun (to my friends at least!). 
You can download it here:

- Windows, portable version ([zip-file](/Blog/download/catchthecrown_win32.zip))
- Linux, portable version ([zip-file](/Blog/download/catchthecrown_linux32.zip))
- Mac OS, portable version ([zip-file](/Blog/download/catchthecrown_mac.zip))

Please find more details about customization on the [Project Page]({{< relref "project/catchthecrown.md" >}}).

## The Story
I made up most of the story and gameplay of the game with one of my best friends on a 7 hours road trip to Edinburgh :). The basic idea was that, in the tribe of the Prabbits - half parots / half rabbits creatures - four teenagers are undertaking their "Coming-of-Age" ritual. 

{{< figure src="/Blog/img/gamedev/catchthecrown_release/doing_nothing.gif" title="Three teenager Prabbits chilling out before the Coming-of-Age ritual..." >}}

## The Gameplay
The Prabbits are spawned on a map in which there is one crown while a timer in running. Once the crown is picked up by a Prabbit, coins, diamonds and rubies appear across the level. Only the Prabbit with the crown can collect them. When collected part of the money goes partly to the Prabbit's gold chest while the other part goes in the Crown itself. 

![](/Blog/img/gamedev/catchthecrown_release/timer.gif) 

<figure>
    <img src="/Blog/img/gamedev/catchthecrown_release/catch_crown.gif" width="100%"/>
    <figcaption>
        <h4>Only the Prabbit with the Crown can collect treasures</h4>
    </figcaption>
</figure>

A competition starts between Prabbits as everyone wants to catch the crown and be able to collect gold. When the timer ends, that is the richer Prabbit that wins the turn; players need to win 3 turns to win the tournament and be declared King of the Tournament (see Screenshot1).


## The Character Actions
The Prabbits benefit from several ways to hurt each others. They can throw lances, slaps each other, picked up another Prabbit and make a lethal throw. To slap someone increase its fatigue (fatigue mark on his head), which will increase its respawn time the next time he dies. Time is precious - more a player is waiting to respawn, less he/she can collect gold or change the outcome of the game.

{{< figure src="/Blog/img/gamedev/catchthecrown_release/spear_and_slap.gif" title="Spear, Slap, Trap Combo! I was alone recording, that's why Red is not moving :P" >}}


## What was not implemented
Originally, Catch The Crown was thought to be a cooperative and competitive 2D platform game. A Shaman would have explained the competitive rules to the teenager Prabbits. During a round, the players would have, in addition to theirs, a common gold chest. The next levels could be unlocked only if the common chest reaches a certain amount of Gold (We can still see this chest in the GUI). 

The levels would have been designed to force cooperative behaviours to get more common Gold. Furthermore, the Shaman would have also summon creatures against which the Prabbits would have need to fight in cooperation. Thus, to win a tournament would have been a competitive gameplay, and to unlock a new level would have been a cooperative gameplay. 

Maybe later, I will do a sequel where I will implement more of the stuffs I wanted originally. In any case, I will probably come back with new levels for this version of the game. Hope you will enjoy!

