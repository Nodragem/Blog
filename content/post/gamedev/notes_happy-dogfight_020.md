+++
title = "Release Notes: Happy Dogfight 0.2.0"
highlight = true
math = false
description = " "
image = ""
post_type = ["gamedev"]
see_more_link = "/post/"
date = "2019-12-12T21:27:08+01:00"
thumbnail = "thumbnails/prabbit-aviator-thumbnail.png"
images = ["thumbnails/prabbit-aviator-thumbnail.png"]
[header]
image = "prabbit-aviator-banner.png"
caption = ""
+++

{{< alert note >}}
Major Update!
{{< /alert >}}

Finally updating the demo of my next game, just in time for you to enjoy with some friends during the festive season :) Hope you like it! A lot of love and time has gone into it. In description, it is much more fun and less buggy :) with a new level to unlock. But for those who wants to know more, I prepared a detailed changelog you can read below.

## A New Level and a Newsletter

I wanted to make a valuable gift to players who may like the game and want to join the newsletter I am planning to start (already part of my new year's resolutions). So I developed an additional level especially for the occasion!

![demo-level4-2](/Blog/img/gamedev/notes_happydogfights_020/demo-level4-2.gif)

It is inspired by ironworkers and the giant crane hook they use to raise beams of steel up to the sky. Watch for the iron ball as it will be deadly.
I also designed an in-game form for players to join the newsletter. 
Hopefully, I will be speaking to you soon about the development of the game and my new gameplay and game mode ideas :) !

## Change to the Gameplay

![newbomb-demo](/Blog/img/gamedev/notes_happydogfights_020/newbomb-demo.gif)

The Bomb does not eliminate a player for the whole tournament any more. This was judged too punitive; now, a bomb will eliminate a player for the next round only. Hence if you only play at two players, the player who used the bomb will win two rounds at once.

![demo-bomb-small](/Blog/img/gamedev/notes_happydogfights_020/demo-bomb-small.gif)

The radius of the Bomb is now shown on the screen with a red semi-transparent circle.
The bomb will explode at the end of its timer (instead of simply disappearing); when the time comes close, the red circle will flicker.

I also reduced the number of hearts and increased the time before they respawn: there were too many hearts, that made the dogfights too long.

![control-scheme](/Blog/img/gamedev/notes_happydogfights_020/control-scheme.gif)

Finally the controls have changed a bit, it is now left to turn the plane anti-clockwise and right to turn the plane clockwise. The player can now control the speed of the plane with the vertical axis of the second thumbstick.

## New Local Multiplayer

You can play locally without being connected to the internet! Sounds quite normal, but before this release the game needed to connect to internet :) !

Although that's not a new feature, note that you can play at two on the same keyboard!

![image-20191208193326587](/Blog/img/gamedev/notes_happydogfights_020/image-20191208193326587.png)

## Updated Online Multiplayer

The online multiplayer is now much closer to what exists elsewhere, with a lobby and rooms. It is still **experimental**; as I am using a free server for this free demo, ***only 20 concurrent clients can play at the same time***. Here what's new:

- new Lobby and Rooms system

- create a room with its unique name for your friends to find you easily

  ![demo-createroom](/Blog/img/gamedev/notes_happydogfights_020/demo-createroom.gif)

- use the search button to find the room of your friend![demo-lobby](/Blog/img/gamedev/notes_happydogfights_020/demo-lobby.gif)

- Master client needs to wait for other clients' players to be ready

- the game still allows several players to play from the same machine

## Graphic Updates and Readability

I realised that some players did not always follow what was going on during a tournament. For instance, some players did not know who was currently leading the tournament (and hence who should be hunted). I tried to make the game more readable.

- Level 1 and Level 2 were redecorated (see below)

- a crown was added on the head of the Prabbit who won the most rounds:

  ![Unity_A2VkcE6cq4](/Blog/img/gamedev/notes_happydogfights_020/Unity_A2VkcE6cq4.png)

- an arrow pointing forward was added to help the player aim when shooting

- players can test which slot they are in the player list by pressing START:

  ![pressSTART](/Blog/img/gamedev/notes_happydogfights_020/pressSTART.gif)

- textual announcement of who is not playing next round

- planes will emit smoke based on their remaining life (white for 50% life, black for 1% life)

- more readable leaderboard, the text "1/5 wins" was replaced with a row of stars that is easier to read

  ![demo-leaderboard2](/Blog/img/gamedev/notes_happydogfights_020/demo-leaderboard2.gif)

- the star animation makes the winner more visible

- "Out Next Round" is displayed in the leaderboard when players are eliminated for the next round


## UI improvement
![demo-fume2menu](/Blog/img/gamedev/notes_happydogfights_020/demo-fume2menu.gif)

A new in-game menu allows players to go back to the level selection/lobby or see the controls.

![controls-demo](/Blog/img/gamedev/notes_happydogfights_020/controls-demo.gif)

A new help panel was added to familiarise players with the control schemes and rules.


## Bug corrections
- ghost plane: after a plane was destroyed, its collision box could still be active and destroy your plane
- sometimes, to kill the last player with a bomb would make the player win the tournament
- many more... in a few words, the game should be more stable now!

## Download

You can grab the demo here:  

- [Free Early Access of Happy Dogfigths 0.2.0](/Blog/project/released-happy-dogfight/)

Or directly from here:

<iframe src="https://widgets.gamejolt.com/package/v1?key=Z8cUgjHM" frameborder="0" width="500" height="145"></iframe>

Don't hesitate to leave your feedback!