# GAME NAME

This is the repository for GAME NAME, a game for the [Brackeys Game Jam 26.1](https://itch.io/jam/brackeys-15).

## Engine

This project uses [Godot 4.6-stable](https://godotengine.org/download/archive/4.6-stable/).

## Template

This game is based on the template repository [brackeys-game-jam-2026-1](https://github.com/Saturn91/brackeys-game-jam-2026-1)
by [saturn91.dev](https://saturn91.dev).

For starting on the project, the template instruction is kept below.

### Template Overview

This repository contains boilerplate code that will handle module loading. For the following moduls pre setup.
- Main menu
- Game scenes
- Settings menu
- Game pausing functionality in the pause menu

Following other features are ready to use:
- simple Global soundsystem for easy reusable simple and or UI sounds
- persisted settings (saved to file) which update the volume of all audio on "SFX" and "Music" buses automatically
- pause game mechanics and in game settings menu
- elaborate debug system which will make your testing phase easier in so many ways

### Debug helpers
1. Debug menu (visible by default in editorm hiden in exports) which shows some usefull infos and can be extended
2. simple message system to display snackbar like messages

#### Debug Menu
The debug menu is visible by default if the game is started from within the editor, in builds it can be viewed by pressing CTRL + Period (or what ever you add in the input settings)

It already contains some debug properties by default:
- a button which hides the menu
- a button which directly loads the game
- fps counter
- current OS (great if you need to ask users where they run the game -> "can you please press CTRL + Period and send me a screenshot")
- you can expand this easily further e.g. with some buttons to load certain levels or give weapons to the player or kill all enemies, take you directly to the boss stage... basically make your life easier when testing the game

#### Message system
Use `Debug.print(msg)`, `Debug.warn(msg)`, or `Debug.error(msg)` to display snackbar-like messages which will also be visible on builds.

>Recommendation, mainly use this to debug and for errors/warnings which you don't expect the game to run into. I build this message tool with debugging in builds in mind, not to inform the player ;-) but you do you!

### Audio System with Bus-Based Volume Control

The project uses Godot's audio buses ("SFX" and "Music") for global volume management. Volume settings are persisted and automatically applied to all audio on the respective buses.

#### Adding global sounds
Add `AudioStreamPlayer`, `AudioStreamPlayer2D`, or `AudioStreamPlayer3D` nodes as children to the `GlobalSound` node. Assign them to the "SFX" bus for volume control. They will be automatically registered by name for global playback.

#### Adding global music
Add `AudioStreamPlayer` nodes as children to the `GlobalMusic` node. Assign them to the "Music" bus for volume control. They will be automatically registered by name for global playback.

#### Playing global sounds/music from scripts
Use `GlobalSound.singleton.play("sound_name")` or `GlobalMusic.singleton.play("music_name")` to play a registered sound/music by its node name.

#### Bus-based volume control
All audio assigned to "SFX" or "Music" buses automatically respects user volume settings. Volumes are linear (0-1) internally, converted to dB for the AudioStreamPlayers.

### Folder structure
I created some other sub readmes for both folders
- [details scr](src/README.md)
- [details resources](resources/README.md)
- [detais .scripts](.scripts/README.md)
```
src -> godot related files
resources -> files from external editors
.scripts -> helper scripts (optional)
```

> Template created by [saturn91.dev](https://saturn91.dev)
