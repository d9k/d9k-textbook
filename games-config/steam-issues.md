Проблемы Steam
==============

invalid depot comfig
--------------------

###Official


    Completely exit the Steam client.
    Open the run dialogue by pressing windows key + r (you can also navigate here from the start menu by typing run).
    Type steam://flushconfig then press enter. (If asked to allow this website to open a program, please click Allow or OK).
    Restart your computer.
    Now, launch Steam directly from the installation folder, not from a pre-existing shortcut (~C:\program files (x86)\Steam). 
    The Steam application will either appear as Steam or Steam.exe depending on whether your settings show file extensions.

### Other recipes

1. Close Steam
2. Open SteamApps Folder
3. Edit appmanifest_[gameid].acf
4. Delete whole "MountedDepots" config part
5. Start Steam. It will validate the game and create corrected MountedDepots config

http://steamcommunity.com/app/219640/discussions/0/34094415728654123/

