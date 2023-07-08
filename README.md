OneNext

Add-on set of extra cores, configurations and tools for Spectrum Next (ks1) / N-go

Alternative cores, settings and additional options from edited NextZXOS menu, OneNext makes a selection of systems possible from the default menu, without having to assign an extra core at boot. 
This resolves a deal of complexity for the average or casual user, the objective is multicore capability from one single SD card and a complete setup that works for all extra systems. 

Please be aware this is not an official Spectrum Next distribution package, or associated with SpecNext Ltd. 
The project is intended to implement open-source resources available for the Spectrum Next, made by third parties, and to provide an integrated setup. It is mainly for evaluation purposes, with the hope that it will encourage more enthusiasts to explore Spectrum Next-related projects.

The default NextZXOS menu is edited with zxnext-menuedit, kindly created by em00k, David Saphier. 
Anyone can learn how to use this amazing tool and customise the default NextZXOS menu. There is a great tutorial on the YouTube channel 'Spectrum Next Stuff' 
https://www.youtube.com/watch?v=khba0wV743Q&t=6s

![MENU](https://github.com/DopierRex/OneNext/assets/137646337/3edd4b96-0f28-445f-9080-6b74a63a2a08)

The extra machines in this build are from several open source projects, made by many authors:

-SAM COUPE by ManuFehri, based on McLeod's SAM Coupe core (VGA/RGB)

-AMSTRAD CPC6128 port by ManuFehri, based on original AmstradCPC464 work by Miguel Angel Rodriguez Jodar (VGA/RGB)

-BBC MICRO MASTER by hoglet67, David Banks, BeebFpga Spec Next Beeb Core, using Alan Daly's 65C02 implementation (VGA/RGB/HDMI @50Hz)

-MSX1 by Victor Trucco, based also on previous MSX1FPGA by Fabio Belavenuto (VGA @50/60Hz)

![MACHINES2](https://github.com/DopierRex/OneNext/assets/137646337/661d522f-eeb9-4480-be9e-b250b1b29f5d)

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

All credits are attributed to the original authors of the above ports, utilities, and tools. Licences, original source code, and relevant links are included in this repository. You are encouraged to learn about the awesome projects of the creators by checking their main repositories and extensive work.

Please note that Arcades (cores/roms) are NOT included in this repository; at present, arcades are not within scope of the project. If you are interested in arcade cores, you should check out Victor Trucco's fantastic work on his repository 
https://gitlab.com/victor.trucco/zx-spectrum-next-cores/-/tree/master/Cores/Arcades

IMPORTANT:
OneNext is under the terms of the GNU General Public License by the Free Software Foundation, version 3. The use of resources in this repository is for evaluation and educational purposes; proceed only if you are confident in your abilities, understand and accept the terms herein. Source software is under the terms of respective GNU / CC0 / MIT original projects' licenses. No liability or warrants are attributed to, implied in, or derived from this software. 

None of the extra cores, settings and configurations in OneNext are permanent; they are only set from files on SD card. You can just revert to your old Next build, by simply replacing the SD card with your own previous card, whenever you wish.

This release and repository do NOT include game roms; you must add your games/roms to respective system folders: SAMCOUPE, CPC6128, MSX, NES, COLECO, ATARI. 

REQUIREMENTS

OneNext is for the SPECTRUM NEXT (ks1 only) and the fantastic N-GO, a clone of the Spectrum Next (Issue 2F) by ManuFehri, authorised by the Spectrum Next team https://www.specnext.com/about/  https://manuferhi.com/p/n-go-board
Those boards use FPGA Xilinx XC6SLX16

NOTE: SAM COUPÉ extra core needs 2MB RAM expansion for Spectrum Next (ks1) 

The current extra cores are not expected to work on the new Spectrum Next Kickstarter 2 (ks2), as the FPGA logic device is different from the one used in Kickstarter 1 (ks1). Hopefully, third-party developers or the Spectrum Next team will create extra cores or adapt the existing ones to the Spectrum Next Kickstarter 2. OneNext has not been tested yet on the new N-mini, a Raspberry PI-sized Spectrum Next clone by Don Superfo.

YOU WILL NEED:

1. A VGA MONITOR/TV, and a VGA display lead to connect it

Check your VGA monitor/TV boot menu to see how you can adjust horizontal and vertical settings, for the video output to be centred on the screen. Although some of the alternative cores (SAM Coupe, Amstrad CPC6128, BBC Master) can also be displayed in RGB, only the BBC Master core does support digital display (HDMI/DVI).
However, ALL extra cores work with VGA video. 
A VGA monitor is ideal for the extra cores and it can be obtained inexpensively; 
a second-hand VGA monitor would normally cost a few dollars/pounds. Additionally, VGA 50hz, mode 0, is the most timing-accurate for the Spectrum Next, as it is fully compatible with older ZX Spectrum software.

Once you have a VGA monitor connected, please check your VGA display frequencies with the Next 'Screen Test' by holding down key 'V' at power up. Screen Test will go through different mode cycles. Depending on your monitor, select 'mode 0' whenever possible, or another 50hz VGA mode. Otherwise, just select any VGA mode you are satisfied with (50/60hz).

For more information, please refer to the official Sinclair ZX Spectrum Next User Manual, 'Chapter 1: Setting it UP', also available online at https://www.specnext.com/zx-spectrum-next-user-manual-first-edition/

2. SPEAKERS

If your VGA monitor does not have built-in speakers, you will need to use external speakers connected to the Spectrum Next/N-go 3.5mm audio output. As for the VGA monitor above, a simple set of speakers would be inexpensive to obtain, likely you might have speakers that can be used already. Consider also using a good amplified stereo system or speakers for the fantastic sound of the Spectrum Next: NextSound (3 x AY-3-89xx compatible PSGs and PCM digital audio with stereo output), and Covox/Soundrive/SpecDrum/TurboSound digital audio.
Moreover, NextSIDPlayer and NXMODPlayer by the legendary David Saphier let you play SID like sounds and Amiga MOD files, while NextPlayer by Miroslav Bursa plays STC, PT2, PT3, SQT and TS (TurboSound) music files! 

3. PS/2 KEYBOARD

The cores that make it possible to recreate other machines on the Spectrum Next tend to support PS/2 keyboards, VGA output, and 3.5mm audio because that's what they were developed for originally. As with other FPGA builds, a PS/2 keyboard provides more keys than most source keyboards. Only the BBC Master core works with the Spectrum Next keyboard (a great achievement by David Banks!)

IMPORTANT: 

- MUST use or obtain a PS/2 keyboard that has standard complete keyset, 'F12' function key, and 'Scroll Lock' key.
  
- Using a USB Keyboard with PS/2 adapter or a Y-splitter cable will NOT work on Spectrum Next (ks1) for the extra cores, it needs to be a full PS/2 standard keyboard. 

4. A FAT16 FORMATTED 4GB SD CARD

You will need to format a SD card to FAT16 (not FAT32). 
Please do NOT re-use your old or ordinary Next SD card, rather use a new SD card specifically for this. 
Some extra cores will only work with cards up to 4gb maximum; therefore, if you have a larger SD card, you must create a FAT16 4gb primary partition or, even better, split the SD card size into multiple partitions (explained in the following section).

OPTIONAL (recommended):
You can actually have multiple drives on NextZXOS (no need for external drives or additional SD cards) by partitioning a new SD card in this way: 1st 4gb partition in FAT16,
2nd, 3rd.. partitions in FAT32, in GB sizes of your choice (depending on how large the SD card is). 

For example, creating 4 partitions from a 32gb SD card: 
1st partition 4gb FAT16, 
2nd partition 10gb FAT32, 
3rd partition 10gb FAT32, 
4th partition 8gb FAT32. 

IMPORTANT: ALL partitions must be PRIMARY, and ONLY the first 4gb partition must be formatted in FAT16, the other partitions (2nd, 3rd..) need to be formatted in FAT32 (!)

![SD](https://github.com/DopierRex/OneNext/assets/137646337/0f919a6d-975b-43e0-9cb7-6a987eb2a8fe)

In this example, NextZXOS will show 5 logical drives C, D, E, F, M (drive 'M' is the RAMdisk).

![Next Drives](https://github.com/DopierRex/OneNext/assets/137646337/96b8d278-7769-4ea5-897d-8f4bf799c058)

Games for the extra systems and consoles must be placed on the first NextZXOS 'C' drive (FAT16, 1st SD partition) inside their respective folders: SAM, CPC6128, MSX, NES, COLECO, ATARI, where you can place your own games/roms. 
Anything else, ZX Spectrum legacy or Next, can be on any drive (C,D,E,F..) because the Spectrum Next has support for FAT16 and FAT32.

You can keep all your files neatly organised, for example: the extensive ZX Spectrum library in drive D, Next games in drive E, music files or your own programs in drive F..

There are many free programs/tools for Windows, Mac or Linux to create multiple partitions on a single SD card. To name a couple, 'EaseUS Partition Master' for Windows PC or 'GParted' for Linux (amd64, or i686, i686-PAE) https://gparted.org/download.php

Please choose the proper tool you are comfortable with or do your own research for a suitable method to partition and format your SD card correctly.

INSTRUCTIONS

-STEP 1 

On your new FAT16 4gb SD card, the first file that you must copy is a standard single BEEB.MMB file; this is required for the modern SD Card File System MMFS, which is used by the BeebFpga core. Download it from hoglet67 on GitHub:  
https://github.com/hoglet67/BeebFpga/releases/download/specnext_beta1/BEEB.MMB.zip 

Unzip it, and copy the single file to the root of the SD card.

-STEP 2 

The resources on this repository do NOT include the official System/Next distribution, therefore, you have to dowload it yourself. Download the latest stable System/Next distribution, sn-complete-22.10a.zip (recommended) SYSTEM/NEXT 22.10 at 

https://www.specnext.com/latestdistro

Navigate to the place where you downloaded the distribution and double-click it to unzip. Select all files and copy them to the root folder of the FAT16 4gb SD card (or the first FAT16 4gb partition, if you have opted to have multiple drives in NextZXOS, as in REQUIREMENTS above).

Now, please check out your official NextZXOS distribution by inserting the new SD card in the Spectrum Next. Remember that a 'Screen Test' will be enabled at your first start up (press 'V' VGA, 'R' RGB, 'D' Digital, 'A' ALL).

![FW](https://github.com/DopierRex/OneNext/assets/137646337/441d0937-9587-432f-8e82-33c4bf02b773)

PLEASE NOTE: You need at least core v3.01.10
READ the instructions carefully at the link above for SYSTEM/NEXT 22.10
Also, you may notice the section 'Note for PS/2 keyboard users' on the official distribution release website listed above. Extra cores require an external PS/2 keyboard, it needs to be enabled! 

Test that VGA VIDEO and PS/2 KEYBOARD are working for your setup before proceeding with the next step. 

-STEP 3

Download this repository's latest release, navigate to the place you downloaded it, unzip the file, select ALL and copy all files to the root of your first (or only) FAT16 primary partition on the SD card, where you have already placed the System/Next distribution (step 2). 
If you get the prompt on your PC screen "The destination already has a file named '....'", click 'yes' to "Replace the file in the destination" for all files.
 
IMPORTANT: The software in this repository does not alter or corrupt the official Spectrum Next firmware or its code; in fact, additional files, folders, are simply added with relevant settings and configurations.

-STEP 4

The SD card is finally ready, you can insert it in your Spectrum Next or N-go.

Now, you will need to FLASH the alternative cores right from the Spectrum Next!

Using a VGA monitor and the PS/2 keyboard wired, power up your Next/N-go. 
At this point, the default video is set to VGA 50hz 'mode 0', but if you don't get a satisfactory display on your monitor, you can restart the Spectrum Next/N-go and check again the VGA display frequencies by holding down key 'V' at power up and starting 'Screen Test'. Select a VGA mode you are happy with, from the different modes displayed on your monitor through the screen cycles.

Flashing the extra cores is relatively simple. Restart your Spectrum Next/N-go, upon boot press the key 'C' to enter ZX Spectrum Next Extra Cores. There are up to 14 FPGA slots available, listed vertically from numbers 18 to 31. From here, you can enter, erase, and update the extra cores.

Once you select an empty slot and press 'space', a list of extra cores will appear on the screen. Select any of the available cores and press 'enter' to flash it. Once a core is flashed to a slot, it will no longer show on the list of cores that can be flashed (unless you erase it first). Flashing an extra core actually takes just a few seconds.

You will need to flash all the extra core, one by one, and ensure they are named as listed hereunder. The slot number doesn't matter; an extra core can be flashed to any of the available slots, from 08 to 31.

Acorn BBC Master

AMSTRAD1

ATARI_26

COLECOVI

MSX_128K

NES_GAME

SAMCOUPE

![FLASH](https://github.com/DopierRex/OneNext/assets/137646337/aed2043f-517b-4834-8316-c48169bb71b1)

When you complete flashing all of the cores, restart your Spectrum Next in default Next personality.

Please read QUICKSTART for more information on how to use each of the systems, this file is inside each of the following folders: SAMCOUPE, CPC6128, MSX, NES, COLECO, ATARI, together with the README file!
 
For the Acorn BBC Master, read BBC_QUICKSTART in directory BBC; it contains more detailed information, due to the Next membrane keyboard support.

IMPORTANT: This build and its repository do NOT include game ROMS. 
It is your own prerogative to add games in the relevant folders. 
Please check README.txt inside each of the extra system directory: SAMCOUPE, CPC6128, MSX, NES, COLECO, ATARI for instructions. 

Now, you can enjoy extra machines and consoles, switch WiFi off, manage files, or play music.. 
all from your NextZXOS menu!
