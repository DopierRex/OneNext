**********************************************************************
PLACE YOUR OWN GAMES/ROMS .mgt .dsk IN THIS FOLDER /SAMCOUPE 
**********************************************************************

Links to sites with disk images
-------------------------------
- https://www.worldofsam.org/
- https://velesoft.speccy.cz/download.htm
- http://ftp.nvg.ntnu.no/pub/sam-coupe/

MGT SAM Coupe
=============

Port to ZX Spectrum Next / N-GO by ManuFerHi.

Keys
----
- F12 - disk menu
- F5 - NMI button
- F1 - toggle joystick splitter setting
- CTRL-ALT-DEL - reset SAM
- CTRL-ALT-Backspace - reset to BIOS.
- SCROLL-LOCK - switch from VGA to RGB and back.
- (numeric keypad [-]) - switch on/off scanlines

Known issues
------------
- Only support for .MGT 80 track 10 sector, or CPM 80 track 9 sector format
- Border effects bad due to memory contention issues.

Disk image support
------------------
Many emulators running on host systems with infinite resources accept disk formats in ZIP format.  This core
does not.  Whereas it might be interesting to allow that support, it would be at the expense of other functionality
so for the sake of extracting and converting disk formats, for the moment, only MGT and CPM format is supported.

There is no support for copy protected disks with odd formats at present, so sorry, Lemmings is out unless there's a
cracked version.  This may change, the ZIP format probably will not.

To convert disks use Simon Owen's excellent SAMdisk utility available here: https://simonowen.com/samdisk/

2nd drive support
-----------------
SAMDOS stores the drive configuration along with the DOS on the disk and inherits the settings from the dos it loads.
Since not all SAMs had a 2nd drive, then if you boot a SAMDOS that was saved on a machine with only 1 drive, when you
try to DIR 2, then you will receive the message: "103 No such drive, 0:1".  To get around this, and to enable the
second drive after booting SAMDOS, you can enable the drive with the simple command:
- POKE DVAR 2, 208

If you resave the SAMDOS onto the disk, then it will save the setting and next time you boot that disk it will remember
that you had 2 drives configured.  This shouldn't affect PRODOS (CPM).

Instructions
------------
Copy core into your SD machines/SamCoupe and rename it core.bit

IMPORTANT - if you don't see anything on the screen press the Scroll-Lock key to switch between 15 and 31khz

F12 for load DSK image disk, then type BOOT 
