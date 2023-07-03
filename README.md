OneNext

Add-on set of extra cores, configurations and tools for Spectrum Next (ks1) / N-go

A set of alternative cores, settings and additional options from edited NextZXOS menu, it makes a selection of systems possible from the default menu, without having to assign an extra core at boot. This resolves a deal of complexity for the average or casual user, the objective is having multicore capability and features from just one SD card (no more different SD cards for the extra cores).

Please be aware this is NOT an official Spectrum Next distribution package, or associated with SpecNext Ltd. 
The project is intended to implement open-source features available for the Spectrum Next, made by third parties, and to provide an integrated setup. It is mainly for evaluation purposes, with the hope that it will encourage more enthusiasts to explore Spectrum Next-related projects.

The default NextZXOS menu is edited with zxnext-menuedit, kindly created by em00k, David Saphier. 
Anyone can learn how to use this amazing tool and customise the default NextZXOS menu. There is also a great tutorial on the YouTube channel 'Spectrum Next Stuff' 
https://www.youtube.com/watch?v=khba0wV743Q&t=6s

The extra machines in this build are from several open source projects, made by many authors:

-SAM COUPE by ManuFehri, based on McLeod's SAM Coupe core (VGA/RGB)

-AMSTRAD CPC6128 port by ManuFehri, based on original AmstradCPC464 work by Miguel Angel Rodriguez Jodar (VGA/RGB)

-BBC MICRO MASTER by hoglet67, David Banks, BeebFpga Spec Next Beeb Core, using Alan Daly's 65C02 implementation (VGA/RGB/HDMI @50Hz)

-MSX1 by Victor Trucco, also from on previous MSX1FPGA work by Fabio Belavenuto (VGA @50/60Hz)


The following consoles are all ports to the ZX Spectrum Next by Victor Trucco:


-ATARI 2600 port of the A2601 FPGA implementation for the ZXUNO (VGA)

-COLECOVISION, FGPA port based from old PACE project (VGA)

-NES, from fpganes ZXUNO port, 2016 DistWave (VGA)


Additional tools executable from NextZXOS menu are:


-WiFi Off, WiFi switch-off option, by DopierRex

-NextSIDPlayer by em00k, David Saphier

-NXMODPlayer by em00k, David Saphier

-NextPlayer by perrada69, Miroslav Bursa

-CalmCommander, file commander by perrada69, Miroslav Bursa

All credits are attributed to the original authors of the above ports, utilities, and tools. Licences, original source code, and relevant links are included on this repository. You are encouraged to learn about the awesome projects of the original creators by checking their main repositories and extensive work.

Please note that Arcade cores/roms are NOT included in this repository; arcades are not within the scope of this project at present. If you are interested in arcade cores, you should check out Victor Trucco's fantastic work on his repository 
https://gitlab.com/victor.trucco/zx-spectrum-next-cores/-/tree/master/Cores/Arcades

IMPORTANT:
OneNext is under the terms of the GNU General Public License by the Free Software Foundation, version 3. The use of resources in this repository is for evaluation and educational purposes; please proceed only if you are confident in your abilities, understand and accept the terms herein. Source software is under the terms of respective GNU / CC0 / MIT original projects' licenses. No liability or warrants are attributed to, implied in, or derived from this software. 

None of the extra cores, settings and configurations in OneNext are permanent; they are only set from the SD card files. You can just revert to your old Next build, by simply replacing the SD card with your own previous card, whenever you wish.

OneNext does not include game roms; you must add your games/roms to respective system folders: SAMCOUPE, CPC6128, MSX, NES, COLECO, ATARI. 


REQUIREMENTS

This repository is for the SPECTRUM NEXT (ks1 only) and the fantastic N-GO, a clone of the Spectrum Next (Issue 2F) by ManuFehri, authorised by the Spectrum Next team https://www.specnext.com/about/  https://manuferhi.com/p/n-go-board
Those boards use a FPGA Xilinx XC6SLX16.

The extra cores are not expected to work on the new Spectrum Next machines from Kickstarter 2 (ks2), as the FPGA logic device is different from the one used for Kickstarter 1 (ks1). Hopefully, third-party developers or the Spectrum Next team will create extra cores or adapt the existing ones to the Spectrum Next FPGA of Kickstarter 2. OneNext has not been tested yet on the new N-mini, a Raspberry PI-sized Spectrum Next clone by Don Superfo.

1. A VGA MONITOR/TV, and a VGA display lead to connect it

Check your VGA monitor/TV boot menu to see if you can adjust horizontal and vertical settings, for the video output to be centred on the screen. Although some of the alternative cores (SAM Coupe, Amstrad CPC6128, BBC Master) can also be displayed in RGB, only the BBC Master extra core supports digital display (HDMI/DVI). A VGA monitor is  ideal for the extra cores and it can be obtained inexpensively; a second-hand VGA monitor would normally cost a few dollars/pounds. Additionally, VGA 50hz, mode 0, is the most timing-accurate for the Spectrum Next, as it is fully compatible with older ZX Spectrum software.

Once you have a VGA monitor connected, please check your VGA display frequencies with the Next 'Screen Test' by holding down key 'V' at power up. Screen Test will go through different mode cycles. Depending on your monitor, select 'mode 0' whenever possible, or another 50hz VGA mode. Otherwise, just select any VGA mode you are satisfied with (50/60hz).

For more information, please refer to the official Sinclair ZX Spectrum Next User Manual, 'Chapter 1: Setting it UP', also available online at https://www.specnext.com/zx-spectrum-next-user-manual-first-edition/

2. SPEAKERS

If your VGA monitor does not have built-in speakers, you will need to use external speakers connected to the Spectrum Next/N-go 3.5mm audio output. As for the VGA monitor above, a simple set of speakers is quite inexpensive, probably you already have a set of speakers that can be used. Consider also getting a good amplified stereo system or speakers to enjoy the fantastic sound of the Spectrum Next: NextSound (3 x AY-3-89xx compatible PSGs and PCM digital audio with stereo output), and Covox/Soundrive/SpecDrum/TurboSound digital audio.
Moreover, software like NextSIDPlayer and NXMODPlayer by the legendary David Saphier let you play PT3 and Amiga MOD files, while NextPlayer by Miroslav Bursa lets you play STC, PT2, PT3, SQT and TS (TurboSound) music files.

3. PS/2 KEYBOARD

The cores that make it possible to recreate other machines on the Spectrum Next tend to support PS/2 keyboards, VGA, and 3.5mm audio because that's what they were originally developed for. As with other FPGA builds, a PS/2 keyboard provides more keys than most source keyboards; for example, although the BBC Master core has support for the Spectrum Next keyboard (a great achievement by David Banks!), it may not be always ideal to use because the layout of the Acorn BBC Micro is so different.

OPTIONAL (reccommended):
PS/2 Y-Splitter cable and a PS/2 Mouse; few programs require a mouse.

4. A FAT16 FORMATTED 4GB SD CARD

Whether you have a Spectrum Next (ks1) or N-go, you will need to format a new SD card to FAT16 (not FAT32). Please do NOT re-use your old or ordinary Next SD card, you should definitely obtain a new SD card specifically for this. A few of the extra cores will only work with cards up to 4gb maximum; therefore, if you have a larger SD card, you must create on it a FAT16 4gb primary partition or, even better, split the SD card size into multiple partitions (explained in the following section).

OPTIONAL (recommended):
You can actually have multiple drives on NextZXOS (no need for external drives or additional SD cards) by partitioning a new SD card in this way:
1st 4gb partition in FAT16,
2nd, 3rd.. partitions in FAT32, in GB sizes of your choice (depending on how large the SD card is)
For example, a 32gb SD card size into 4 partitions: 1st partition 4gb FAT16, 2nd partition 10gb FAT32, 3rd partition 10gb FAT32, 4th partition 8gb FAT32. In this case, NextZXOS will show 5 logical drives C, D, E, F, M (drive 'M' is the RAMdisk). 

IMPORTANT: ALL partitions must be PRIMARY, and only the first 4gb partition must be formatted in FAT16, the next partitions (2nd, 3rd..) must be formatted in FAT32 (!)

Games for the extra systems and consoles need to be placed on the first NextZXOS 'C' drive (FAT16, 1st SD partition) in their respective folders: SAM, CPC6128, MSX, NES, COLECO, ATARI, where you can place your own games/roms. 
Anything else, ZX Spectrum legacy or Next files, can be on any drive (C,D,E,F..) because Spectrum Next has support for FAT16 and FAT32.

You can keep all your files neatly organised, for example: the extensive ZX Spectrum library in drive D, Next games in drive E, music files or your own programs in drive F..

There are many free programs/tools for Windows, Mac or Linux to create multiple partitions on a single SD card. To name a few, 'EaseUS Partition Master' for Windows PC or 'GParted' for Linux (amd64, or i686, i686-PAE) https://gparted.org/download.php

Please choose the proper tool you are comfortable with or do your own research for a suitable method to partition and format your SD card correctly.

INSTRUCTIONS

-STEP 1 

On your new FAT16 4gb SD card, the first file that you must copy is a standard BEEB.MMB file; this is needed for the modern SD Card File System MMFS, which is used by the BeebFpga core. Download it from hoglet67 on GitHub  

https://github.com/hoglet67/BeebFpga/releases/download/specnext_beta1/BEEB.MMB.zip 

Unzip it, and copy the single file to the root of the SD card.

-STEP 2 

The resources on this repository do not include the official System/Next distribution, therefore, you have to dowload it yourself. Download the latest stable System/Next distribution, sn-complete-22.10a.zip (recommended) SYSTEM/NEXT 22.10 at 

https://www.specnext.com/latestdistro

Navigate to the place where you downloaded the distribution and double-click it to unzip. Select all files in the distribution and copy them to the root folder of your newly formatted FAT16 SD card (or the first FAT16 4gb partition, if you have opted to have multiple drives in NextZXOS, as in REQUIREMENTS above).

At this stage, it's a good idea to check out your official NextZXOS distribution by inserting the new SD card in the Spectrum Next, before proceeding to the next step. Remember that a 'Screen Test' will be enabled at your first start up (press 'V' VGA, 'R' RGB, 'D' Digital, 'A' ALL).

PLEASE NOTE: You need at least core v3.01.10
Please read the instructions carefully at the link above for SYSTEM/NEXT 22.10

Also, you may notice the section 'Note for PS/2 keyboard users' on the official distribution release website listed above. As extra cores require an external PS/2 keyboard, that feature needs to be enabled (you can still use a mouse AND a keyboard with a PS/2 Y-splitter cable). However, no action is really required at this stage because, after you complete the next step (3), PS/2 keyboard will be automatically configured.

-STEP 3

Download this repository's latest release, navigate to the place you downloaded it, unzip the file, select ALL and copy all files to the root of your FAT16 primary partition on the SD card, where you have already placed the System/Next distribution (step 2). 
If you get the prompt on your PC screen "The destination already has a file named '....'", click 'yes' to "Replace the file in the destination" for all files.
 
IMPORTANT: The software in this repository does not alter, replace, or corrupt the official Spectrum Next firmware or its code; in fact, additional files, folders are simply added with relevant settings and configurations.

-STEP 4

The SD card is finally ready, you can insert it in your Spectrum Next or N-go.


Now, you will need to FLASH the alternative cores right on the Spectrum Next!

If you haven't already, you can start using a VGA monitor with your Next/N-go. 
The default is VGA 50hz 'mode 0', but if you don't get a satisfactory display on your  monitor, you can reset  your Spectrum Next/N-go and check the VGA display frequencies by holding down key 'V' at power up and starting 'Screen Test'. Select a VGA mode you are happy with, from the different modes displayed on your monitor through the screen cycles.

Also, you will notice that, if you have a PS/2 keyboard wired to the Spectrum Next, it will be now configured to work. Use a PS/2 splitter cable, if you want to add a PS/2 mouse.

Flashing the extra cores is relatively simple. Reset your Spectrum Next/N-go, upon boot press the key 'C' to enter ZX Spectrum Next Extra Cores. There are up to 14 FPGA slots available, listed vertically from numbers 18 to 31. From here, you can enter, erase, and update the extra cores.

Once you select an empty slot and press 'space', a list of extra cores will appear on the screen. Select any of the available cores and press 'enter' to flash it. Once a core is flashed to a slot, it will no longer show on the list of cores that can be flashed (unless you erase it first). Flashing an extra core is actually a simple process; it takes just a few seconds.

You will need to flash all the extra cores on this release, one by one, and ensure they appear named as listed hereunder. The slot number doesn't matter though; an extra core can be flashed to any of the available slots, from 08 to 31.

Acorn BBC Master

AMSTRAD1

ATARI_26

COLECOVI

MSX_128K

NES_GAME

SAMCOUPE


When you have finished flashing all of the extra cores, restart your Spectrum Next in default Next personality.

Please read QUICKSTART for more information on how to use each of the extra cores, this file is found inside each folder: SAMCOUPE, CPC6128, MSX, NES, COLECO, ATARI, together with the README file!
 
For the Acorn BBC Master, please read BBC_QUICKSTART in directory BBC; it contains more detailed information, due to the Next membrane keyboard support and commands.

IMPORTANT: This build and its repository do NOT include game roms.

So for the extra systems, it is your own prerogative to add games/roms in the relevant folders. Please check README.txt inside each of the extra system directory: SAMCOUPE, CPC6128, MSX, NES, COLECO, ATARI

Now, you can start extra machines and consoles, switch WiFi off, manage files, or play music.. 
all from your NextZXOS menu!
