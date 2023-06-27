# OneNext
 Add-on set of cores & options for Spectrum Next (ks1) / N-go

A set of alternative cores and additional features from an edited NextZXOS menu configuration, it allows a selection of options from a customised default menu. This makes it possible to switch to any of the alternative machine/systems that can run on the Spectrum Next, without having to select the core during boot up sequence. It also resolves complexity for the average or casual user, the objective is to have a set of additional features, available on just one SD card, with options selectable from a customised NextZXOS menu which is already configured (no SD card swapping, or having to use multiple SD cards).

Please be aware this is NOT an official add-on package from the Spectrum Next distribution; this project wants to demonstrate some of the many features available for the Spectrum Next, and provide a set-up for easy access. It is intended mainly for evaluation purposes, the hope is that it would make it easier to appreciate and implement additional open-sourced features that are made available by the wonderful developers (FPGA cores/programs/tools), as well as to incourage more people to explore, learn and contribute to Spectrum Next development.

The NextZXOS menu is edited with the excellent editor zxnext-menuedit by em00k, David Saphier. 

The alternative machines are:

-SAM COUPE by ManuFehri, based on McLeod's SAM coupe core

-AMSTRAD CPC6128 port by ManuFehri, based on original AmstradCPC464 work by Miguel Angel Rodriguez Jodar

-BBC MICRO MASTER by hoglet67, David Banks, BeebFpga Spec Next Beeb Core

-MSX1 by Victor Trucco, based on previus work from Fabio Belavenuto

The following consoles are ports by Vistor Trucco to the ZX Spectrum Next:

-ATARI 2600

-COLECOVISION, FGPA port from old PACE project

-NES, from fpganes ZXUNO port 2016 DistWave

Additional features selectable from NextZXOS menu are:

-WIFI OFF, option to switch off on board WiFi

-NextSIDPlayer by em00k, David Saphier

-NXMODPlayer by em00k, David Saphier

-NextPlayer by perrada69, Miroslav Bursa

-CalmCommander, file commander by perrada69, Miroslav Bursa

Additional options from ZX Spectrum Next configuration (personalities), selectable at boot up time by pressing key 'space', are experimental for evaluation or educational purposes. Copyrights are the of respective entities, Sky has kindly given its permission for the redistribution of its copyrighted material (ROMs) but retains that copyright. 

-ZX Spectrum 128k with DivMMC (supported by esxDOS 0.8.7 by Papaya Dezign)

-ZX Spectrum 128k DerbyPro (enhanced ROM by Source Solutions, Inc.)

IMPORTANT

All credits go exclusively to the original authors of such ports, utilities and tools.

OneNext add capabilities and thus implement some of the many great developments made over recent years for the Specrtum Next. Licences, original source code, references and links are all included on this repository. You are strongly incouraged to learn about the extensive work of the original creators by checking their main repositories, learning about other amazing projects, or visiting their web sites. Please read the credits, licence information, and relevant detailed documentation on this repository.

Disclaimer: Under terms of respective GNU/CC0/Apache/MIT Licence. No liability or warrants are attributed to, implied or derived from this software. Use of the resources available from this repository is exclusively at your own risk. Please proceed only if you are confident in your abilities and understanding of the project.

REQUIREMENTS

This repository is for the SPECTRUM NEXT (ks1) and the fantastic N-GO, a (improved) clone of Spectrum Next (Issue 2F) by ManuFehri, authorized by the Spectrum Next team. Those boards are use a FPGA Xilinx XC6SLX16. It has not been tested yet on the new N-mini, a Raspberry PI-sized Next board by Don Superfo, but in theory should work just as well. 

1) A VGA MONITOR/TV with (PAL) 50Hz and a VGA display lead to connect it.
   
Check the VGA monitor/TV boot menu to see if you can adjust settings for the best display you are happy with, and have output to appear centred on your screen. Although some of the alternative cores (SAM Coupe, Amstrad CPC6128, BBC Micro) can also be displayed as RGB output, only the BBC Micro core supports digital display (HDMI/DVI compatible). A VGA monitor is therefore required for this build, it can be obtained very inexpensively these days and a second-hand VGA monitor would normally cost a few dollars/pounds. Additionally, VGA (mode 0) is the most timing-accurate display for the Spectrum Next, as it is fully compatible with older ZX Spectrum software. 

Once you have a VGA monitor connected, please check your VGA display frequencies with the Next 'Screen Test' by pressing key 'V' at start up, and select 'mode 0' whenever possible. For more information, refer to Sinclair ZX Spectrum Next User Manual, 'Chapter 1 - Setting it UP', also available online at https://www.specnext.com/zx-spectrum-next-user-manual-first-edition/

3) SPEAKERS
    
If your VGA monitor does not have audio output or built-in speakers, you will need to use external speakers plugged to the Spectrum Next/N-go 3.5mm audio output. Again, as for the VGA monitor above, getting a simple set of speakers is quite inexpensive or you may have one already. However, also consider using a good amplified sound system/speakers to enjoy the fantastic sound capabilities of Spectrum Next: NextSound (3 x AY-3-89xx compatible PSGs and PCM digital audio with stereo output), Covox/Soundrive/SpecDrum/TurboSound digital audio. Additionally, software NextSIDPlayer and NXMODPlayer by the legendary David Saphier let you play PT3 and Amiga MOD files, while NextPlayer by Miroslav Bursa let you play STC, PT2, PT3, SQT and TS (TurboSound) music!

2) A PS/2 KEYBOARD
   
The open source cores that make it possible to recreate other machines on the Spectrum Next tend to be supporting PS/2 keyboard, VGA, 3.5mm audio because that's what they were developed for. The PS/2 is effectively the way to use other machines, as it provides more keys than most source keyboards; for expample, although the BBC Micro core has support for the Spectrum Next keyboard (a great achievement!), using it may feel somehow awkward simply because the layout is so different.

OPTIONAL (reccommended): PS/2 splitter cable and a PS/2 Mouse, as few sofware require use of a mouse. 

4) A newly-formatted SD CARD (preferably 4gb)

Whether you have a Spectrum Next (ks1) or N-go, you will need to format a new SD card to FAT16 (not FAT32).
Please do NOT use your old or ordinary Next SD card, you should obtain a new SD card specifically for this set up. A few alternative cores only work with cards up to 4gb, therefore, if you have a lager-sized SD card, you must create a FAT16 4gb primary partition, or even better split the SD card size into multiple partitions (as explained herewith in the following section, marked OPTIONAL). 

OPTIONAL (recommended): It is possible to have multiple drives on NextZXOS (no need for external drives or additional SD cards) by partitioning the new SD card this way: 1st 4gb partition in FAT16, a 2nd and 3rd partitions in FAT32 in GB sizes of your choice (depending on how large the SD card is).

IMPORTANT: ALL partitions must be PRIMARY, and only the first 4gb partition must be formatted in FAT16, the subsequent partitions (2nd, 3rd..) must be formatted in FAT32. NextZXOS will show multiple logical drives, C,D,E,F..
Games for the alternative cores, systems and consoles, must be kept on the first NextZXOS C drive (FAT16) in their respectives folders SAM, CPC, MSX, NES, COLECO, ATARI where you can place your own games/roms. 
Anything else, ZX Spectrum legacy or Next files, can go on the other drives (D,E,F..) if you wish a neat set up; for example: the whole ZX Spectrum TOSEC library in drive D, Next games in drive E, music files or your own programs in drive F..

There are many free programs/tools for Windows, Mac or Linux to create multiple partitions on a SD card, for example 'EaseUS Partition Master' for Windows PC, or 'GParted' for Linux and architetures amd64,i686,i686-PAE https://gparted.org/download.php Please choose the tool you are confortable with, or do your own reasearch for a suitable method to partition and correctly format your SD card. 

INSTRUCTIONS

1) Download the latest stable complete System/Next distribution, the FULL distribution download sn-complete-22.10a.zip (recommended) SYSTEM/NEXT 22.10 at https://www.specnext.com/latestdistro

Navigate to the place you downloaded the distribution and double-click it to unzip. Select ALL files in the distribution and copy them to the root folder of your newly FAT16 formatted SD card (or the first FAT16 4gb partition, if you have opted to have multiple drives in NextZXOS, as marked optional in REQUIREMENTS above)
At this stage you can check your stock official NextZXOS distribution by inserting the new SD card, before proceeding to the next step.

IMPORTANT: You need at least core v3.01.10 Please read the instructions carefully at the link above for SYSTEM/NEXT 22.10 

Also, you may read the section 'Note for PS/2 keyboard users' on the same release page.
As alternative cores use an external PS/2 keyboard, it needs to be enabled instead of only a default mouse (You can still use a mouse AND a keyboard with a PS/2 splitter cable). However, no action is not necessarily required at this stage, because after you complete the next step (3) the PS/2 keyboard will be authomatically configured for use. 

3) Download this repository latest release, navigate to the place you downloaded it, unzip the file, select ALL and copy to the root of your FAT16 primary partition on the SD card, where you have already placed the System/Next distribution from step 4. If you get the prompt "The destination already has a file named '....'", click "Replace the file is the destination" for ALL files.

4) Now, you can insert the newly configured SD card in your Spectrum Next or N-go. The SD card set-up is done, however, you still need to FLASH the alternative cores to your FPGA on the Spectrum Next.

At this stage, if you haven't already, start using your VGA monitor connected to your Next/N-go. This build assumes that you are using VGA 50hz PAL mode 0, however, if you don't get a satisfactory display, you can check your VGA display frequencies with the Next 'Screen Test' by pressing key 'V' at start up, select 'mode 0' whenever possible, or another mode you are happy with.

You will notice that, if you have it attached, the PS/2 is already configured to work now.

Flashing the extra cores is relatively simple, at start up press the key C to enter 'ZX Spectrum Next Extra Core' There are up to 23 slots available, listed vertically from number 18 to 31. In here, you can enter, erase and update the extra cores.

Once you select an empty slot, you can then pick one of the extra cores which are now listed on the screen. 
You will need to flash all the etxra cores on this release, one by one, and ensure they are named exactly as listed hereunder and in the respective numbered slot,

08 Acorn BBC Master
13 AMSTRAD1
16 ATARI_26
17 COLECOVI
20 MSX_128K
21 NES_GAME
22 SAMCOUPE

When you have finished flashing all of the extra cores, please switch off and restart your Spectrum Next in its Next personality normally. Please chech 'Quick Start' for more information and how to use each one of the extra cores. 

Now, you can start using the extra cores, systems and consoles, music players, switch off WiFi, select CalmCommander.. all from your NextZXOS menu!





