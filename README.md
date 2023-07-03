# OneNext 
Add-on set of extra cores & options for Spectrum Next (ks1) / N-go 

A set of alternative cores and additional features from edited NextZXOS menu, it makes a selection of systems possible from the menu, without having to select an extra core at start-up.  

This resolves a deal of complexity for the average or casual user, the objective is to have pre-configured features and cores on just one SD card, with options executable from the NextZXOS menu (no SD card swapping, or having to use multiple SD cards). 
 
Please be aware this is NOT an official Spectrum Next add-on package, and it is not in any way associated with SpecNext Ltd, supported by the Spectrum Next official distribution, or endorsed by the Spectrum Next team. 
The project is intended to demonstrate the implementation of open-source features available for the Spectrum Next, made by third parties, and provide an easy setup. It is mainly for evaluation purposes, with the hope that it will encourage more people to explore Spectrum Next-related projects. 
 
The NextZXOS menu is edited with zxnext-menuedit, kindly created by em00k, David Saphier 
Anyone can learn how to use this amazing tool and customise the default NextZXOS. 

There is also a great tutorial on the YouTube channel 'Spectrum Next Stuff' at 

https://www.youtube.com/watch?v=khba0wV743Q&t=6s 
 
The extra machines are from the following works and projects: 
 
-SAM COUPE by ManuFehri, based on McLeod's SAM Coupe core (VGA/RGB) 
 
-AMSTRAD CPC6128 port by ManuFehri, based on original AmstradCPC464 work by Miguel Angel Rodriguez Jodar (VGA/RPG) 
 
-BBC MICRO MASTER by hoglet67, David Banks, BeebFpga Spec Next Beeb Core (VGA/RGB/HDMI @50Hz) 
 
-MSX1 by Victor Trucco, based on previous FPGA work by Fabio Belavenuto (VGA @50/60Hz) 
 
The following consoles are ports by Vistor Trucco to the ZX Spectrum Next: 
 
-ATARI 2600 port of the A2601 FPGA implementation for the ZXUNO (VGA) 
 
-COLECOVISION, FGPA port from old PACE project (VGA) 
 
-NES, from fpganes ZXUNO port 2016 DistWave (VGA) 
 
Additional features selectable from NextZXOS menu are: 
 
-WIFI OFF, option to switch off on board WiFi 
 
-NextSIDPlayer by em00k, David Saphier 
 
-NXMODPlayer by em00k, David Saphier 
 
-NextPlayer by perrada69, Miroslav Bursa 
 
-CalmCommander, file commander by perrada69, Miroslav Bursa 
 
Please note that Arcade cores are NOT included in this repository; implementing arcades is not within the scope of this project. If you are interested in arcade cores, you should check out Victor Trucco's fantastic work on his repository at https://gitlab.com/victor.trucco/zx-spectrum-next-cores/-/tree/master/Cores/Arcades 
 
IMPORTANT 
 
All credits go exclusively to the original authors of the above referenced ports, utilities, and tools. 
 
OneNext adds capabilities and thus implements some of the many great developments made over recent years for the Spectrum Next. Licences, original source code, references, and links are all included in this repository. You are encouraged to learn about the extensive work of the creators by checking their main repositories, learning about other amazing projects, or visiting their web sites. Please read the credits, licence information, and all relevant documentation on this repository. 
 
Disclaimer: Under the terms of the respective GNU/CC0/Apache/MIT licences No liability or warrants are attributed to, implied in, or derived from this software. The use of resources in this repository is for evaluation and educational purposes only and exclusively at your own risk. Please proceed only if you are confident in your abilities, understand the project, and accept the terms herein. 
 
REQUIREMENTS 
 
This repository is for the SPECTRUM NEXT (ks1 only) and the fantastic N-GO, a (improved) clone of Spectrum Next (Issue 2F) by ManuFehri, authorised by the Spectrum Next team https://manuferhi.com/p/n-go-board Those boards use a FPGA Xilinx XC6SLX16. 
 
The extra cores will not work on the new Spectrum Next Kickstarter 2 (ks2), as its FPGA is different. Hopefully, third-party developers or the Spectrum Next team will create new extra cores and adapt the existing ones to the Spectrum Next Kickstarter 2. 
 
The software in this repository has not been tested yet on the new N-mini, a Raspberry PI-sized Next clone by Don Superfo. 
 
1) A VGA MONITOR/TV, and a VGA display lead to connect it 
 
Check your VGA monitor/TV boot menu to see if you can adjust settings, with output centred on your screen. Although some of the alternative cores (SAM Coupe, Amstrad CPC6128, BBC Master) can also be displayed in RGB, only the BBC Master core supports digital display (HDMI/DVI) 
 
A VGA monitor is therefore ideal for the extra cores, it can be obtained very inexpensively these days, and a second-hand VGA monitor would normally cost a few dollars/pounds. Additionally, VGA 50hz, mode 0, is the most timing-accurate display for the Spectrum Next, as it is fully compatible with older ZX Spectrum software.  
 
Once you have a VGA monitor connected, please check your VGA display frequencies with the Next 'Screen Test' by pressing key 'V' at start up and selecting 'mode 0' whenever possible. 

For more information, refer to the Sinclair ZX Spectrum Next User Manual, 'Chapter 1: Setting it UP', also available online at https://www.specnext.com/zx-spectrum-next-user-manual-first-edition/ 
 
2) SPEAKERS 
 
If your VGA monitor does not have audio output or built-in speakers, you will need to use external speakers connected to the Spectrum Next/N-go 3.5mm audio output. As for the VGA monitor above, getting a simple set of speakers is quite inexpensive, probably you already have a set of speakers that can be used. Consider also getting a good amplified stereo sound system or speakers to enjoy the awesome sound of the Spectrum Next, NextSound (3 x AY-3-89xx compatible PSGs and PCM digital audio with stereo output), and Covox/Soundrive/SpecDrum/TurboSound digital audio. 
 
Additionally, software like NextSIDPlayer and NXMODPlayer by the legendary David Saphier let you play PT3 and Amiga MOD files, while NextPlayer by Miroslav Bursa lets you play STC, PT2, PT3, SQT and TS (TurboSound) music files! 
 
3) PS/2 KEYBOARD 
 
The open source cores that make it possible to recreate other machines on the Spectrum Next tend to support PS/2 keyboards, VGA, and 3.5mm audio because that's what they were developed for. As with other FPGA builds, a PS/2 keyboard is the way to use the recreated machines, for it provides more keys than most source keyboards; for example, although the Acorn BBC Master core has support for the Spectrum Next keyboard (a great achievement!), it may feel somehow difficult to use because the layout is so different. 
 
OPTIONAL (reccommended): 

PS/2 splitter cable and a PS/2 Mouse, as few programs require a mouse.  
 
4) A NEWLY FAT16 FORMATTED 4GB SD CARD 
 
Whether you have a Spectrum Next (ks1) or N-go, you will need to format a new SD card to FAT16 (not FAT32). Please do NOT re-use your old or ordinary Next SD card, you should definitely obtain a new SD card specifically for this. A few extra cores will only work with cards up to 4gb maximum; therefore, if you have a larger SD card, you must create on it a FAT16 4gb primary partition, or even better, split the SD card size into multiple partitions (as explained in the following section, marked OPTIONAL). 
 
OPTIONAL (recommended): 

You can actually have multiple drives on NextZXOS (no need for external drives or additional SD cards) by partitioning a new SD card in this way:  
 
1st 4gb partition in FAT16,  
 
2nd, 3rd.. partitions in FAT32, in GB sizes of your choice (depending on how large the SD card is) 
 
For example, a 32gb SD card: first 4gb FAT16 partition, second 10gb FAT32 partition, third 10gb FAT32 partition, fourth 8gb FAT32 partition; Hence, in this case, NextZXOS will show four logical drives C, D, E, F 
 
IMPORTANT: ALL partitions must be PRIMARY, and only the first 4gb partition must be formatted in FAT16, the next partitions (2nd, 3rd..) must be formatted in FAT32 (!)  
 
Games for the extra systems and consoles need to be placed on the first NextZXOS 'C' drive (FAT16, 1st SD partition) in their respective folders: SAM, CPC, MSX, NES, COLECO, ATARI, where you can place your own games/roms.  
 
Anything else, ZX Spectrum legacy or Next files, can go on any of the other drives (D,E,F..)  
You can keep all your files neatly organised, for example: the whole ZX Spectrum TOSEC library in drive D, Next games in drive E, music files or your own programs in drive F.. 
 
There are many free programs/tools for Windows, Mac or Linux to create multiple partitions on a single SD card. To name a few, 'EaseUS Partition Master' for Windows PC or 'GParted' for Linux (amd64, or i686, i686-PAE) https://gparted.org/download.php  
 
Please choose the tool you are comfortable with or do your own research for a suitable method to partition and correctly format your SD card.  
 
INSTRUCTIONS 

1) The resources on this repository do NOT include the official System/Next distribution, therefore:
    Download the latest stable complete System/Next distribution, the FULL distribution download sn-complete-22.10a.zip (recommended) SYSTEM/NEXT 22.10 at https://www.specnext.com/latestdistro 
 
Navigate to the place where you downloaded the distribution and double-click it to unzip. Select ALL files in the distribution and copy them to the root folder of your newly formatted FAT16 SD card (or the first FAT16 4gb partition, if you have opted to have multiple drives in NextZXOS, as marked optional in REQUIREMENTS above). 
 
At this stage, it's a good idea to check out your stock official NextZXOS distribution by inserting the new SD card in the Spectrum Next, before proceeding to the next step. Remember that a 'Screen Test' will be enabled at your first start up (press 'V' VGA, 'R' RGB, 'D' Digital, 'A' ALL). 
 
IMPORTANT: You need at least core v3.01.10  
Please read the instructions carefully at the link above for SYSTEM/NEXT 22.10  
 
Also, you may notice the section 'Note for PS/2 keyboard users' on the same official release page. 
As extra cores require an external PS/2 keyboard, that feature needs to be enabled, as opposed to having only a default mouse (you can still use a mouse AND a keyboard with a PS/2 splitter cable). However, no action is really required for enabling a PS/2 keyboard at this stage because, after you complete the next step (3), it will be automatically configured. 

2) Download this repository's latest release, navigate to the place you downloaded it, unzip the file, select ALL and copy all files to the root of your FAT16 primary partition on the SD card, where you have already placed the System/Next distribution (step 1). If you get the prompt on your PC screen "The destination already has a file named '....'", click 'yes' to "Replace the file in the destination" for each or all files. 

IMPORTANT: The software in this repository does NOT alter, replace, or corrupt the official Spectrum Next firmware or its code in any way; in fact, resources, files and additional folders are simply added, configured, and made accessible with the relevant settings. 

3) Now, you can insert the newly configured SD card in your Spectrum Next or N-go. 
The SD card set-up is finally complete; however, you still need to FLASH the alternative cores to your FPGA on the Spectrum Next! 
 
At this stage, if you haven't already, you can start using a VGA monitor with your Next/N-go.  
This build assumes that you are using VGA 50hz PAL mode 0. If you don't get a satisfactory display on your VGA monitor, you can check the display frequencies by pressing key 'V' at start up time and invoking the Next 'Screen Test'. Select VGA 'mode 0' whenever possible, or any VGA mode you are happy with. 
 
Also, you will notice that, if you have it attached, the PS/2 is now configured to work. 
 
Flashing the extra cores is relatively simple. At start-up, press the key 'C' to enter ZX Spectrum Next Extra Cores.  
 
There are up to 14 FPGA slots available, listed vertically from numbers 18 to 31. From here, you can enter, erase, and update the extra cores. 
 
Once you select an empty slot and press 'space', the list of extra cores will appear on the screen. Select any of the available cores and press 'enter' to flash it. Once a core is flashed to a slot, it will no longer show on the list of cores that can be flashed (unless you erase it first). It is actually a simple process; flashing a core takes just a few seconds.  
 
You will need to flash all the etxra cores on this release, one by one, and ensure they are named as listed hereunder. The slot number doesn't matter though; a core can be flashed to any of the available FPGA slots, from 08 to 31. 

Acorn BBC Master

AMSTRAD1

ATARI_26

COLECOVI

MSX_128K 

NES_GAME 

SAMCOUPE 
 
When you have finished flashing all of the extra cores, restart your Spectrum Next in normal Next personality. 

Please check 'Quick Start' for more information on how to use each of the extra cores.  
 
Now, you can start using the extra systems and consoles, switch off WiFi, manage files, or enjoy music players.. all from your NextZXOS menu! 

