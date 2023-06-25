# OneNext
 Add-on set of cores & options for Spectrum Next (ks1)/N-go

A set of alternative cores and additional features from an edited NextZXOS menu configuration, it allows a selection of options from a customised NextZXOS default menu, without having to hault the start up sequence in order to assign a different core, or resorting to use of multiple SD cards. It also resolves complexity for the average or casual user, as the objective is to have a comprehensive set of amazing features all readily available from using just 1 SD Next card (no alternative cores SD card hot-swapping, or having to use different SD cards). Hence the name of this simple but useful project and configuration, 'OneNext'

Please be aware this is NOT an official add-on package from, or associated with the Spectrum Next distribution; this project is essentually aimed at demostrating the many features that Spectrum Next is capable of, and how it can be configured for additional features in a easy-access native mode. It is intended for educational and evaluation purposes, the hope is that it would make it easier for users to evaluate additional features that are available (FPGA/programs/tools), as well as to incourage more people to implement, learn and contribute to Spectrum Next development.

All credits go exclusively to the original authors of such ports, utilities and tools. OneNext adds Spectrum Next versatile capabilities (ks1 and N-go) and thus is based on many great developments made over recent years. 
Licences (GNU,CC0) original source code, references and links are all included in this repository, you are strongly incouraged to learn about the extensive work of the original creators by checking their main repositories, learning about other amazing projects, or visiting their web sites. Please read all the credits, licence information, and relevant detailed documentation on this repository.

This repository is for the Spectrum Next (ks1) and the fantastic N-go, an authorised clone by ManuFehri. The boards have FPGA Xilinx XC6SLX16. It has not been tested yet on the new N-mini, a 'Raspberry PI-sized' Next board by Don Superfo, but in theory should work just as well. 

Disclaimer: Under terms of GNU/CC0 Licence. No liability or warrants are attributed to, implied or derived from   this project and its author. Use the resouces available from this repository is excusively at your own risk. Please proceed only if you are confident with your abilities and understanding.

REQUIREMENTS

1) A VGA monitor/TV with (PAL) 50Hz and a VGA display lead to connect it. If you are looking for a VGA monitor, ideally try to get one that can rotate, as some arcades (alternative cores) have only native vertical video output.
Check the VGA monitor/TV boot menu to see if you can select 50Hz, you may also need to adjust other settings, as you want the best display and the output to appear centred on your screen.

Although, some of the alternative cores (SAM Coupe, Amstrad CPC6128, BBC Micro) can also be displayed as RGB output, only the BBC Micro core supports digital display (HDMI/DVI compatible). A VGA monitor is therefore required for this build, it can be obtained very inexpensively these days and a second-hand VGA monitor would normally cost only a few dollars/pounds. Additionally, VGA (mode 0) is considered the most timing-accurate display for the Spectrum Next, as it is fully compatible with older ZX Spectrum software. 

Once you have a VGA monitor connected, please check your VGA display frequencies with the Next 'Screen Test' by pressing key 'V' at start up, and select 'mode 0' whenever possible. For more information, refer to Sinclair ZX Spectrum Next User Manual 'Chapter 1 - Setting it UP', also available online at https://www.specnext.com/zx-spectrum-next-user-manual-first-edition/

2) A PS/2 Keyboard. OPTIONAL (reccommended) an PS/2 splitter cable and a PS/2 Mouse, as few sofware require use of a mouse. The open source cores that make it possible to recreate other machines on the Spectrum Next tend to be supporting PS/2 keyboard, VGA, 3.5mm audio because that's what they were developed for. The PS/2 is effectively the way to use other machines, as it provides more keys than most source keyboards; for expample, although the BBC Micro core has support for the Spectrum Next keyboard, using it can feel somehow awkward as the layout is so different. 

4) A newly-formatted SD card (preferably 4gb). Whether you have a Spectrum Next (ks1) or N-go, you will need to format a new SD card to FAT16 (not FAT32). Please do NOT use your old or ordinary Next SD card, you should obtain a new SD card specifically for this set up. A few alternative cores only work with card up to 4gb, therefore, if you have a spare lager-sized SD card, just create a FAT16 4gb primary partition, or even better split the SD card size into multiple partitions (as explained herewith in the following line, marked OPTIONAL). 

OPTIONAL (recommended): it is possible to have multiple drives on NextZXOS (no need for external additional drives) by partitioning the new SD card this way: 1st 4gb partition in FAT16, a 2nd and 3rd partitions in FAT32 in GB sizes of your choice (depending on how large the SD card is). 
IMPORTANT: ALL partitions must be PRIMARY, and only the first 4gb partition must be formatted in FAT16, the subsequent partitions (2nd, 3rd) must be formatted in FAT32.

There are many free programs/tools for Windows, Mac or Linux to create multiple partitions on a SD card, for example EaseUS Partition Master for Windows, or GParted for different architetures (amd64,i686,i686-PAE) https://gparted.org/download.php Please choose the tool you are familiar or confortable with, or do your own reasearch for a suitable method to partition and correctly format your SD card. 
 
4) Download the latest stable complete System/Next distribution sn-complete-22.10a.zip (recommended) SYSTEM/NEXT 22.10 at https://www.specnext.com/latestdistro 
Navigate to the place you downloaded the distribution and double-click it to unzip. Select ALL files in the distribution and copy them to the root folder of your newly FAT16 formatted SD card (or the first FAT16 4gb partition, if you have opted to have multiple drives in NextZXOS, as optional in step 4)
At this stage you can check your stock official NextZXOS distribution by inserting the new SD card, before proceeding to the next step.

5) Download this repository latest release, navigate to the place you downloaded it, unzip the file, select ALL and copy to the root of your FAT16 formatted primary partition on the SD card where you have already the System/Next distribution from step 4. At the prompt "The destination already has a file named '....'", click "Replace the file is the destination" for ALL files.

6) Now, you can insert the newly configured SD card in your Spectrum Next or N-go. The SD card set-up is done, however, you still need to FLASH the alternative cores to your FPGA system.

8) 

The NextZXOS menu is edited with the excellent editor zxnext-menuedit by em00k, David Saphier. The alternative cores in this add-on configuration are SAM Coupe by ManuFehri, Amstrad CPC6128 port by ManuFehri based on original AmstradCPC464 work by Miguel Angel Rodriguez Jodar, 
