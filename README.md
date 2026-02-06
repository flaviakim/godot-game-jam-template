# License and Copyright

This project is released under the Unlicense. See the [LICENSE](LICENSE) file for details.

> If you decide to give some credit voluntarily, you can keep the "based on a saturn91.dev template" watermark in the intro

# Brackeys Game Jam 26.1 - Godot Project

This is a Godot repository for the [Brackeys Game Jam 26.1](https://itch.io/jam/brackeys-15).

## Godot Version

This project uses [Godot 4.6-stable](https://godotengine.org/download/archive/4.6-stable/).

## How to use
Easiest: click on the code button above and click on "Download ZIP" then just add the godot to your godot editor and you are good to go.

If you are a seasoned github user - you know what to do ;-)

## Project Structure

This repository contains boilerplate code that will handle module loading. For the following moduls pre setup.
- Main menu
- Game scenes
- Settings menu
- Game pausing functionality in the pause menu

Following other features are ready to use:
- simple Global soundsystem for easy reusable simple and or UI sounds
- persisted settings (saved to file) which update the volume of all AudioSources automatically
- pause game mechanics and in game settings menu
- elaborate debug system which will make your testing phase easier in so many ways

## Debug helpers
1. Debug menu (visible by default in editorm hiden in exports) which shows some usefull infos and can be extended
2. simple message system to display snackbar like messages

### Debug Menu
The debug menu is visible by default if the game is started from within the editor, in builds it can be viewed by pressing CTRL + Period (or what ever you add in the input settings)

It already contains some debug properties by default:
- a button which hides the menu
- a button which directly loads the game
- fps counter
- current OS (great if you need to ask users where they run the game -> "can you please press CTRL + Period and send me a screenshot")
- you can expand this easily further e.g. with some buttons to load certain levels or give weapons to the player or kill all enemies, take you directly to the boss stage... basically make your life easier when testing the game

### Message system
Use `Debug.singleton.print(msg)`, `Debug.singleton.warn(msg)`, or `Debug.singleton.error(msg)` to display snackbar-like messages which will also be visible on builds.

>Recommendation, mainly use this to debug and for errors/warnings which you don't expect the game to run into. I build this message tool with debugging in builds in mind, not to inform the player ;-) but you do you!

## Global Soundsystem which is connect to the Settingsmanager

### Adding global sounds
Add `AudioStreamPlayer`, `AudioStreamPlayer2D`, or `ControlledAudioStreamPlayer` nodes as children to the GlobalSound node. They will be automatically registered by name for global playback.

### Playing global sounds from scripts
Use `GlobalSound.singleton.play("sound_name")` to play a registered sound by its node name.

### ControlledAudioStreamPlayers
Use `ControlledAudioStreamPlayer` or `ControlledAudioStreamPlayer2D` or `ControlledAudioStreamPlayer3D` instead of standard AudioStreamPlayers when you want volume settings to apply. Set the `type` export to `SFX` or `MUSIC`. These automatically connect to `SettingsManager.singleton.on_volume_changed` signal to adjust volume based on user settings and get updated immediatly on each volume setting change.

## Folder structure
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
