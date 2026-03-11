# SaveAndTele

Soldat script created to assist mapmaking and debug.
Easy to edit to adapt to the server's needs.
#### Features

 - Infinite saves. 
 - Teleport to mouse cursor position by pressing a
   key(default reload key).

### Edit it according to your needs
There are a few things that could be modified.  
Teleport key can be easily modified. See the properties [here](https://wiki.soldat.pl/index.php/TActivePlayer) (look at the properties that starts with ***key***). 
Name of commands can be edited, new commands can be added. Currently the commands are !s and /s. New commands like !save or /save could be added.



### Use as teleport(Godmode) only script
In order to use it as a save only script, erase or comment the lines on OnSpeak and OnCommand events, that respond to save commands, delete or commend the function OnBeforeRespawn, and the event handler setup(`Players[i].OnBeforeRespawn := `...).

### Use it as save only script
Remove the procedure OnClockTickHandler and remove the event setup at the end of the script. Remove the TeleportPlayer procedure (or comment the lines). 

### Issues and to do list

 - Save position persistent even after map change
 - Add a marker, like * to the save position
	 
	 If you find anything wrong or if you have any suggestion, feel free to report an issue or add a pull request.


