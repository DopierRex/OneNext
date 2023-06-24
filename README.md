# OneNext
 Add-on set of cores & options for Spectrum Next (KS1) / N-GO

A set of alternative cores and NextZXOS menu configurations, it allows selection of cores and options from NextZXOS edited default menu, without the need for haulting the start up sequence in order to assign a different core or having to rely on multiple SD cards. The objective is to have a comprehensive set of amazing features from 1 SD card, avoiding hot-swapping and or using different SD cards. Hence the name of this simple but useful project 'OneNext'. 

It is meant for the Spectrum Next (KS1) and fantastic N-go authorised clone by ManuFehri, using the FPGA Xilinx XC6SLX16. This build configuration has not been tested yet on the new N-mini, a 'Raspberry PI-sized' Next board by Don Superfo, but in theory it should work just as well.

REQUIREMENTS

1) Whether you have a Spectrum Next (KS1) or N-go, you will need to format a new SD card (preferably 4GB) to FAT16 (not FAT32). Please do not use your old Next SD card, you should obtain a new SD card.
OPTIONAL (recommended): it is possible to have multiple drives on NextZXOS (no need for external additional drives) by partitioning the new SD card this way: 1st 4GB partition in FAT16, 2nd and 3rd partitions in FAT32 GB size of your choice. ALL partitions must be PRIMARY, and only the first 4GB partition must be formatted in FAT16. 

3) Download the latest stable complete System/Next distribution sn-complete-22.10a.zip (recommended) SYSTEM/NEXT 22.10 at https://www.specnext.com/latestdistro 
Navigate to the place you downloaded the distribution and double-click it to unzip. Select ALL files in the distribution and copy them to the root folder of your Next SD Card.unzip and copy all files to the SD Select ALL files in the distribution and copy them to the root folder of your newly FAT16 formatted SD card (or the first FAT16 4GB partition, if you have opted to have multiple drives in NextZXOS, as optional in step 1)
At this stage you can check your stock official NextZXOS distribution by inserting the new SD card

4) Download this repository release, unzip and 

The NextZXOS menu is edited with the excellent editor zxnext-menuedit by em00k, David Saphier. The alternative cores in this add-on configuration are SAM Coupe by ManuFehri, Amstrad CPC6128 port by ManuFehri based on original AmstradCPC464 work by Miguel Angel Rodriguez Jodar, 
