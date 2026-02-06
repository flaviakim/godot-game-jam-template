# Brackeys Game Jam 26.1 - Godot Project

This is a Godot repository for the [Brackeys Game Jam 26.1](https://itch.io/jam/brackeys-15).

## Godot Version

This project uses [Godot 4.6-stable](https://godotengine.org/download/archive/4.6-stable/).

## Project Structure

This repository contains boilerplate code that will handle module loading. For the following moduls pre setup.
- Main menu
- Game scenes
- Settings menu
- Game pausing functionality in the pause menu

## Debug helpers
1. Debug menu (visible by default in editorm hiden in exports) which shows some usefull infos and can be extended
2. simple message system to display snackbar like messages

### Debug Menu
The debug menu is visible by default if the game is started from within the editor, in builds it can be viewed by pressing CTRL + Period (or what ever you add in the input settings)

It already contains some debug properties by default:
- fps counter
- current OS (great if you need to ask users where they run the game -> "can you please press CTRL + Period and send me a screenshot")
- a button which directly loads the game
- you can expand this easily further 

## Folder structure:
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
