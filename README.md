# nixos-dotfiles

This is WIP. After being fed up with every Linux machine always being slightly differently setup (packages missing on one machine, some fish function not yet copied over to another,...) and dotfile management solutions not entirely being up for the task I have decided to give NixOS a try.

What I want for my setup:

* Configuration being split up into several small, manageable pieces.
* Each of my Linux installations should get their own host configuration. 
* I want to explore Home-Manager more to ensure I properly manage my dotfiles
* Setup Java Development
* Setup Go Development
* Use Flakes

# Applying changes

`sudo nixos-rebuild switch --flake /path/to/this/repo#laptop`
