# OneNext
 Add-on set of cores, tools & options for Spectrum Next (KS1) / N-GO

A set of alternative cores, tools and NextZXOS menu configurations, it allows selection of cores and options from a customised NextZXOS default menu, without the need for haulting the start up sequence in order to assign a different core or having to rely on multiple SD cards. The objective is to have a comprehensive set of amazing features all readily available from just 1 SD Next card, avoiding hot-swapping and/or using different SD cards. Hence the name of this simple but useful project 'OneNext'. Please be aware this is NOT an official add-on package from or associated with the Spectrum Next distribution; this project is aimed at demostrating many features that the Spectrum Next is capable of, and illustrate how thay can indeed be configured in a easy-access native modality. It is intended for educational and evaluation purposes, the hope is that it would make it easier for users to evaluate additional features (FPGA) and incourage users to learn, develop and contribute further to continuous Spectrum Next development and enjoyment.

All credits go exclusively to the original authors of such ports, utilities and tools. OneNext is a celebration of Spectrum Next capabilities (KS1 and N-go) and tribute to the many great people who actively developed for it over the recent years. Licences (GNU,CC0) original source code, references and links are all included in this repository, you are strongly incouraged to learn about the extensive work of the original creators by checking their main repositories, learning about other amazing projects, or visiting their web sites. Please read the credits section, licence and relevant documentation.

This repository is for the Spectrum Next (KS1) and the fantastic N-go, an authorised clone by ManuFehri. The boards have FPGA Xilinx XC6SLX16. It has not been tested yet on the new N-mini, a 'Raspberry PI-sized' Next board by Don Superfo, but in theory should work just as well.

Disclaimer: Under terms of GNU/CC0 Licence. No liability or warrants are attributed to, implied or derived from   this project and its author. Use the resouces available from this repository is excusively at your own risk. Please proceed only if you are confident with your abilities and understanding.

REQUIREMENTS

1) A VGA monitor/TV with PAL 50mhz, ideally one that can rotate sideways, as some arcade cores have only native vertical display. Some of the alternative cores (SAM Coupe, Amstrad CPC6128, BBC Micro) can also be displayed on RGB, whilst only the BBC Micro core supports digital output (HDMI/DVI compatible). A VGA monitor can be obtained very inexpensively these days, a second hand unit would normally cost just a few dollars/pounds.
   
Additionally, VGA (mode 0) is considered the most timing-accurate display for the Spectrum Next, fully compatible with older ZX Spectrum software. Please check your VGA display frequencies with the Next 'Screen Test' by pressing key 'V' at start up, and select 'mode 0' whenever possible. Refer to your Sinclair ZX Spectrum Next User Manual 'Chapter 1 - Setting it UP', also available online https://www.specnext.com/zx-spectrum-next-user-manual-first-edition/

3) A newly-formatted SD card (preferably 4GB). Whether you have a Spectrum Next (KS1) or N-go, you will need to format a new SD card to FAT16 (not FAT32). Please do NOT use your old or ordinary Next SD card, you should obtain a new SD card specifically for this set up build. As a few alternative cores work only with card up to 4gb, if you have a spare lager sized SD card, you can create just a FAT16 4GB primary partition, or even better split the SD card size into multiple partitions, as explained herewith in the next line marked OPTIONAL. 

OPTIONAL (recommended): it is possible to have multiple drives on NextZXOS (no need for external additional drives) by partitioning the new SD card this way: 1st 4GB partition in FAT16, a 2nd and 3rd partitions in FAT32 GB in sizes of your choice depending on how large the SD card is. IMPORTANT: ALL partitions must be PRIMARY, and only the first 4GB partition must be formatted in FAT16, the subsequent partitions must be formatted in FAT32. 
There are many free programs/tools for Windows, Mac or Linux to create multiple partitions on a SD card, for example EaseUS Partition Master for Windows or GParted for different architetures (amd64,i686,i686-PAE) https://gparted.org/download.php Please choose the tool you are familiar or confortable with, or do your own reasearch for a suitable tool in order to partition and correctly format your SD card. 
 

4) Download the latest stable complete System/Next distribution sn-complete-22.10a.zip (recommended) SYSTEM/NEXT 22.10 at https://www.specnext.com/latestdistro 
Navigate to the place you downloaded the distribution and double-click it to unzip. Select ALL files in the distribution and copy them to the root folder of your newly FAT16 formatted SD card (or the first FAT16 4GB partition, if you have opted to have multiple drives in NextZXOS, as optional in step 4)
At this stage you can check your stock official NextZXOS distribution by inserting the new SD card

5) Download this repository release, unzip and 

The NextZXOS menu is edited with the excellent editor zxnext-menuedit by em00k, David Saphier. The alternative cores in this add-on configuration are SAM Coupe by ManuFehri, Amstrad CPC6128 port by ManuFehri based on original AmstradCPC464 work by Miguel Angel Rodriguez Jodar, 
