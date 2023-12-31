### OneNext

Add-on set of extra cores, configurations, tools for Spectrum Next (ks1) and N-go

Alternative cores, settings and additional options from edited NextZXOS menu, OneNext makes a selection of systems possible from the default menu, without having to assign an extra core at boot. 
This resolves a deal of complexity for the average or casual user, the objective is multicore capability from one single SD card and a complete setup that works for all extra systems. 

<details>

Please be aware this is not an official Spectrum Next distribution package, or associated with SpecNext Ltd. 
The project is intended to implement open-source resources available for the Spectrum Next, made by third parties, and to provide an integrated setup. It is mainly for evaluation purposes, with the hope that it will encourage more enthusiasts to explore Spectrum Next-related projects.

OneNext is under the terms of the GNU General Public License by the Free Software Foundation, version 3. The use of resources in this repository is for evaluation and educational purposes; proceed only if you are confident in your abilities, understand and accept the terms herein. Source software is under the terms of respective GNU / CC0 / MIT original projects' licenses. No liability or warrants are attributed to, implied in, or derived from this software. 

None of the extra cores, settings and configurations in OneNext are permanent; they are only set from files on SD card. You can just revert to your old Next build, by simply replacing the SD card with your own previous card, whenever you wish.

This release and repository do NOT include game roms; you must add your games/roms to respective system folders: SAMCOUPE, CPC6128, MSX, NES, COLECO, ATARI. 

<summary>Licence / Details</summary>
 
</details>

![Edited Menu](https://github.com/DopierRex/OneNext/assets/137646337/3ea5f9c0-8e6a-4d1b-ba9f-f4642505ba70)

The default NextZXOS menu is edited with [zxnext-menuedit](https://github.com/em00k/zxnext-menuedit), kindly created by em00k, David Saphier. 
Anyone can learn how to use this amazing tool and customise the default NextZXOS menu. There is a great tutorial on the YouTube channel [Spectrum Next Stuff](https://www.youtube.com/watch?v=khba0wV743Q&t=6s)

![MENU](https://github.com/DopierRex/OneNext/assets/137646337/e4a66675-98c5-433c-89ff-33ad7437407b)

The extra machines in this build are from several open source projects, made by many authors:

### SAM Coupé
[Sam Coupe](https://github.com/ManuFerHi/N-GO/tree/main/cores/Sam%20Coupe) by ManuFehri, based on McLeod's SAM Coupe core (VGA/RGB)

### MSX
[MSX1](https://gitlab.com/victor.trucco/zx-spectrum-next-cores/-/tree/master/Sources/MSX1) by Victor Trucco, based also on previous MSX1FPGA by Fabio Belavenuto (VGA @50/60Hz)

### Amstrad CPC6128 
[AmstradCPC](https://github.com/ManuFerHi/N-GO/tree/main/cores/AmstradCPC) port by ManuFehri, based on original AmstradCPC464 work by Miguel Angel Rodriguez Jodar (VGA/RGB)

### BBC Micro Master
by hoglet67, David Banks, [BeebFpga](https://github.com/hoglet67/BeebFpga), using Alan Daly's 65C02 implementation (VGA/RGB/HDMI @50Hz)


![MACHINES2](https://github.com/DopierRex/OneNext/assets/137646337/da9084e3-6226-4083-a641-bb0e7d9f7769)


The following consoles are ports for the ZX Spectrum Next by [Victor Trucco](https://gitlab.com/victor.trucco/zx-spectrum-next-cores/-/tree/master/Cores):

### ATARI 2600
port of the A2601 FPGA implementation for the ZXUNO

### Colecovision
FGPA port based from old PACE project 

### NES
from fpganes ZXUNO port, 2016 DistWave

### Additional tools 
executable from NextZXOS menu:

WiFi Off, WiFi switch-off option, by DopierRex

[NextSIDPlayer](https://github.com/em00k/NextSID/tree/main) by em00k, David Saphier

[NXMODPlayer](https://github.com/em00k/NXModPlayer) by em00k, David Saphier

[NextPlayer by perrada69](https://github.com/perrada69/NextPlayer), by Miroslav Bursa

[CalmCommander](https://github.com/perrada69/CalmCommander/releases), file manager by perrada69, Miroslav Bursa

All credits are attributed to the original authors of the above ports, utilities, and tools. Licences, original source code, and relevant links are included in this repository. You are encouraged to learn about the awesome projects of the creators by checking their main repositories and extensive work.

<details> 

<summary>Arcade cores not included </summary>

Please note that arcade cores are not included in this repository. If you are interested in arcades, you should check out Victor Trucco's fantastic work on his [repository](https://gitlab.com/victor.trucco/zx-spectrum-next-cores/-/tree/master/Cores/Arcades) 

</details>

### Requirements

OneNext is for the [Spectrum Next](https://www.specnext.com/about/) and the fantastic [N-Go](https://manuferhi.com/p/n-go-board), a clone of the Spectrum Next (Issue 2F) by ManuFehri, authorised by the Spectrum Next team. The FPGA device is Xilinx XC6SLX16.

<details>

<summary>Spectrum Next Kickstarter 2 (ks2) and Xberry-Pi</summary>

The current extra cores are not expected to work on the new Spectrum Next Kickstarter 2 (ks2), as the FPGA logic device is different from the one used in Kickstarter 1 (ks1). Hopefully, third-party developers or the Spectrum Next team will create extra cores or adapt the existing ones to the Spectrum Next Kickstarter 2. OneNext has not been tested yet on the new Xberry-Pi, a Raspberry Pi-sized Spectrum Next clone by Don Superfo.
 
</details>

<details>

 <summary>SAM Coupé</summary>
 
NOTE: SAM Coupé core needs the Next 2MB RAM, so it would not work on an unexpanded Spectrum Next (ks1) base model with only 1024KB RAM. This is not an issue for N-go boards, or any Spectrum Next (ks1) already fitted with 2MB
 
</details>

### You will need:

### 1. VGA Monitor 

Check your VGA monitor/TV boot menu to see how you can adjust horizontal and vertical settings, for the video output to be centred on the screen. Although some of the alternative cores (SAM Coupe, Amstrad CPC6128, BBC Master) can also be displayed in RGB, only the BBC Master core does support digital display (HDMI/DVI).
However, ALL extra cores work with VGA video. 
A VGA monitor is ideal for the extra cores and it can be obtained inexpensively (4:3 50Hz); 
a second-hand VGA monitor would normally cost a few dollars/pounds. Additionally, VGA 50hz, mode 0, is the most timing-accurate for the Spectrum Next, as it is fully compatible with older ZX Spectrum software.

Once you have a VGA monitor connected, please check your VGA display frequencies with the Next 'Screen Test' by holding down key 'V' at power up. Screen Test will go through different mode cycles. Depending on your monitor, select 'mode 0' whenever possible, or another 50hz VGA mode. Otherwise, just select any VGA mode you are satisfied with (50/60hz).

For more information, please refer to the official Sinclair ZX Spectrum Next User Manual, 'Chapter 1: Setting it UP', also available [online](https://www.specnext.com/zx-spectrum-next-user-manual-first-edition/)

### 2. Speakers

If your VGA monitor does not have in-line audio and speakers, you will need to use external speakers connected to the Spectrum Next/N-go 3.5mm audio output. As for the VGA monitor above, a simple set of speakers would be inexpensive to obtain, likely you might have speakers that can be used already. Consider also using a good amplified stereo system or speakers for the fantastic sound of the Spectrum Next: NextSound (3 x AY-3-89xx compatible PSGs and PCM digital audio with stereo output), and Covox/Soundrive/SpecDrum/TurboSound digital audio.
Moreover, NextSIDPlayer and NXMODPlayer by the legendary David Saphier let you play SID like sounds and Amiga MOD files, while NextPlayer by Miroslav Bursa plays STC, PT2, PT3, SQT and TS (TurboSound) music files! 

### 3. PS/2 Keyboard

The cores that make it possible to recreate other machines on the Spectrum Next tend to support PS/2 keyboards, VGA output, and 3.5mm audio because that's what they were developed for originally. As with other FPGA builds, a PS/2 keyboard provides more keys than most source keyboards. Only the BBC Master core works with the Spectrum Next keyboard (a great achievement by David Banks!)

IMPORTANT: 

- MUST use or obtain a PS/2 keyboard that has standard complete keyset, 'F12' function key, and 'SCROLL LOCK' key.
  Also, a VGA display lead to connect it.

- Using a USB Keyboard with PS/2 adapter or a Y-splitter cable will NOT work on Spectrum Next (ks1) for the extra cores, it needs to be a full PS/2 standard keyboard. 

### 4. FAT16 Formatted 4GB SD Card

You will need to format a SD card to FAT16 (not FAT32).   
Please do NOT re-use your old or ordinary Next SD card, rather use a new SD card specifically for this. 
Some extra cores will only work with cards up to FAT16 4gb maximum; therefore, if you have a larger SD card, you MUST resize it to a 4GB primary partition in FAT16 file system or, even better, split the SD card size into multiple partitions (explained in the following section). 

<details>

<summary>Formatting and Partitioning </summary>

Windows File Explorer does not work for this; there are free programs/tools for Windows, Mac or Linux to create multiple partitions on a single SD card. For example, to name a couple, [EaseUS Partition Master](https://www.easeus.com/partition-manager/epm-free.html) free edition for Windows PC or [GParted](https://gparted.org/download.php) for Linux (amd64, or i686, i686-PAE)

Please choose the proper tool you are comfortable with or do your own research for a suitable method to partition and format your SD card correctly.

</details>

OPTIONAL (recommended):
You can actually have multiple drives on NextZXOS (no need for external drives or additional SD cards) by partitioning a new SD card in this way: 1st 4gb partition in FAT16,
2nd, 3rd.. partitions in FAT32, in GB sizes of your choice (depending on how large the SD card is). 

For example, creating 4 partitions from a 32gb SD card: 
1st partition 4gb FAT16, 
2nd partition 10gb FAT32, 
3rd partition 10gb FAT32, 
4th partition 8gb FAT32. 

IMPORTANT: ALL partitions must be PRIMARY, and ONLY the first 4gb partition must be formatted in FAT16, the other partitions (2nd, 3rd..) need to be formatted in FAT32 (!)

![SD](https://github.com/DopierRex/OneNext/assets/137646337/4cd678a4-74ee-4fd6-8e97-c05f80327322)

In this example, NextZXOS will show 5 logical drives C, D, E, F, M (drive 'M' is the RAMdisk).

![Next Drives](https://github.com/DopierRex/OneNext/assets/137646337/31bb76f5-3722-4155-a129-84e13b1bdb2a)

Games for the extra systems and consoles must be placed on the first NextZXOS 'C' drive (FAT16, 1st SD partition) inside their respective folders: SAM, CPC6128, MSX, NES, COLECO, ATARI, where you can place your own games/roms. 
Anything else, ZX Spectrum legacy or Next, can be on any drive (C,D,E,F..) because the Spectrum Next has support for FAT16 and FAT32.

You can keep all your files neatly organised, for example: the extensive ZX Spectrum library in drive D, Next games in drive E, music files or your own programs in drive F..

## Instructions

Only works from freshly formatted SD card (or 1st partition) as detailed above, and in the following step order: 

### STEP 1 

On your new FAT16 4gb SD card, the first file that you must copy is a standard single BEEB.MMB file; this is required for the modern SD Card File System MMFS, which is used by the BeebFpga core. Download it from hoglet67 on GitHub:  
https://github.com/hoglet67/BeebFpga/releases/download/specnext_beta1/BEEB.MMB.zip 

Unzip it, and copy the single file to the root of the SD card.

### STEP 2 

The resources on this repository do NOT include the official System/Next distribution, therefore, you have to dowload it yourself. Download the latest stable System/Next distribution, sn-complete-22.10a.zip (recommended) SYSTEM/NEXT 22.10 at 

https://www.specnext.com/latestdistro

Navigate to the place where you downloaded the distribution and double-click it to unzip. Select all files and copy them to the root folder of the FAT16 4gb SD card (or the first FAT16 4gb partition, if you have opted to have multiple drives in NextZXOS, as in 'Requirements' above).

Now, please check out your official NextZXOS distribution by inserting the new SD card in the Spectrum Next. Remember that a 'Screen Test' will be enabled at your first start up (press 'V' VGA, 'R' RGB, 'D' Digital, 'A' ALL).

![FW](https://github.com/DopierRex/OneNext/assets/137646337/e87ec5f3-ab06-4ebc-81d2-9944ca66f497)

PLEASE NOTE: 

- You need at least core v3.01.10
READ the instructions carefully at the link above for SYSTEM/NEXT 22.10

- Read section 'Note for PS/2 keyboard users' on the official distribution release website listed above.
  Extra cores require an external PS/2 keyboard, it needs to be enabled!

![keyboard](https://github.com/DopierRex/OneNext/assets/137646337/25ed4e76-7a42-4360-a85e-b49b6a881725)

Test that VGA VIDEO and PS/2 KEYBOARD are working for your setup before proceeding with the next step. 

### STEP 3

Download this repository's latest release, navigate to the place you downloaded it, unzip the file, select ALL and copy all files to the root of your first (or only) FAT16 primary partition on the SD card, where you have already placed the System/Next distribution (step 2). 
If you get any prompt on your PC screen "The destination already has a file named '....'", click to "Replace the file in the destination".
 
IMPORTANT: The software in this repository does not alter or corrupt the official Spectrum Next firmware or its code; in fact, additional resources are simply added with relevant settings, files and configurations.

### STEP 4

The SD card is finally ready, you can insert it in your Spectrum Next or N-go.

Now, you will need to FLASH the alternative cores right from the Spectrum Next!

Using a VGA monitor and the PS/2 keyboard wired, power up your Next/N-go. 
At this point, the default video is set to VGA 50hz 'mode 0', but if you don't get a satisfactory display on your monitor, you can restart the Spectrum Next/N-go and check again the VGA display frequencies by holding down key 'V' at power up and starting 'Screen Test'. Select a VGA mode you are happy with, from the different modes displayed on your monitor through the screen cycles.

Flashing the extra cores is relatively simple. Restart your Spectrum Next/N-go, upon boot press the key 'C' to enter ZX Spectrum Next Extra Cores. There are up to 24 slots available, listed vertically from numbers 08 to 31. From here, you can enter, erase, and update the extra cores.

Once you select an empty slot and press 'space', a list of extra cores will appear on the screen. Select any of the available cores and press 'enter' to flash it. Once a core is flashed to a slot, it will no longer show on the list of cores that can be flashed (unless you erase it first). Flashing an extra core actually takes just a few seconds. 

You will need to flash all the extra core, one by one, and ensure they are named as listed hereunder. The slot number doesn't matter; an extra core can be flashed to any of the available slots, from 08 to 31.

Acorn BBC Master

AMSTRAD1

ATARI_26

COLECOVI

MSX_128K

NES_GAME

SAMCOUPE

![FLASH](https://github.com/DopierRex/OneNext/assets/137646337/7a31a023-7b23-4726-894d-18d0529cbd80)

When you complete flashing all of the cores, restart your Spectrum Next in default Next personality.

Please read QUICKSTART for more information on how to use each of the systems, this file is inside each of the following folders: SAMCOUPE, CPC6128, MSX, NES, COLECO, ATARI, together with the README file!
 
For the Acorn BBC Master, read BBC_QUICKSTART in directory BBC; it contains more detailed information, due to the Next membrane keyboard support.

IMPORTANT: This build and its repository do NOT include game ROMS. 
It is your own prerogative to add games in the relevant folders. 
Check README.txt inside each of the extra system directory: SAMCOUPE, CPC6128, MSX, NES, COLECO, ATARI for instructions. 

PLEASE NOTE: when you start Amstrad CCP6128 and SAM Coupé, if your monitor does not give a signal, press the 'SCROLL LOCK' key, this key switches between 15 and 31khz and enables video output. 

Now, you can enjoy extra machines and consoles, switch WiFi off, manage files, or play music.. 
all from your NextZXOS menu!
