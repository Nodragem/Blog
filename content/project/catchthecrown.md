+++
math = false
external_link = ""
thumbnail = "catchthecrown_release.png"
date = "2017-04-15T14:51:57+01:00"
title = "Catch The Crown!"
summary = "A mutiplayer arena game featuring Prabbits. All assets made from scratch."
project_type = ["released"]
highlight = true
image_folder = "/gamedev/catchthecrown_release"

[header]
  image = "catchthecrown_release_banner.png"
  caption = ""

+++

## Download

- Windows, portable version ([zip-file](https://github.com/Nodragem/Catch-the-Crown/releases/download/v0.9-alpha/catchthecrown_win32.zip))
- Linux, portable version ([zip-file](https://github.com/Nodragem/Catch-the-Crown/releases/download/v0.9-alpha/catchthecrown_linux32.zip))
- Mac OS, portable version ([zip-file](https://github.com/Nodragem/Catch-the-Crown/releases/download/v0.9-alpha/catchthecrown_mac.zip))

{{% alert note %}}
I could not actually test the Mac / Linux versions. Please let me know if the game does not run on your platform.
{{% /alert %}}

## Release Notes

 - [Relase Notes of The Prabbits: Catch the Crown]({{< relref "/post/gamedev/catchthecrown_release.md" >}})


## Summary

**The Prabbits: Catch The Crown** is a local multiplayer arena platform game.

Four teenager Prabbits - half parrot / half rabbit creatures - are undertaking their "Coming-of-Age" ritual. They are spawned in an arena with a crown and a timer. Once the crown is picked up by a Prabbit, coins, diamonds and rubies appear across the level. Only the Prabbit with the crown can collect them. 

A competition starts between Prabbits to catch the crown and collect gold. When the timer ends, the richer Prabbit wins.

## Credits

I need to thank my friends for their ideas and feedback, especially:

- Arthur Portron
- Lukas Wolf
- Atanaska Nikolova

Software used:

- **libGDX** (Game Engine): https://libgdx.badlogicgames.com/
- **Gimp** (2D Graphics): https://www.gimp.org/
- **Krita** (2D Graphics/Painting): https://krita.org/en/
- **Aseprite** (2D Graphics/Animation): https://www.aseprite.org/
- **sfxr/bfxr** (Sound FX): https://www.bfxr.net/ http://www.drpetter.se/project_sfxr.html
- **Audacity** (Voice Recording and Editing): https://www.audacityteam.org/
- **LMMS** (Music): https://lmms.io/

## Customization

### Asset folder
The assets are accessible and can be modified, that means you can add new levels and change the animations or sounds if you wanted to.

### Preference Files
The preference files are in the folder `preference` and they can be modified to make the game windowed or fullscreen, change the name of the characters, or even use the keyboard as input.

  * Use the **Keyboard and Mouse input**:
    
    Open the file `preferences.json` in `./preference` and replace, for instance:
    ```
    "input": "controller",
    "id_input": 2
    ```
    with:
    ```
    "input": "keyboard",
    "id_input": 1
    ```
    Note that the `id_input` of the keyboard must be set to 1.

  * Change the **names of the Prabbits**:
    
    Open the file `preferences.json` in `./preference` and replace, for instance:
    ```
    "name": "Purple",
    "color": "purple",
    ```
    with:
    ```
    "name": "MyNewName",
    "color": "purple",
    ```

  * Change **FullScreen Mode and Resolution**:  
    
    Open the file `preferences.json` in `./preference` and replace, for instance:
    ```
    "full_screen": true,
    "resolution": [1920, 1080],
    ```
    with:
    ```
    "full_screen": false,
    "resolution": [800, 600],
    ```

  * Change the Controls:
    
    The controls are mapped to actions in the files `profileController.xml` and `profileKeyBoard.xml`. Note that the Mouse controls are hard coded and cannot be modified. The numbers mapped to the buttons of your controller depend on your controller.
    Known mapping can be found [here](https://github.com/libgdx/libgdx/tree/master/extensions/gdx-controllers/gdx-controllers/src/com/badlogic/gdx/controllers/mappings).




<!-- ## Screenshot: 
 <img src="/Blog/img/gamedev/catchthecrown_release/catch_crown.gif" width="100%"/> -->


