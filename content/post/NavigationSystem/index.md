---
title: "Open source navigation system for sailing"
summary: ""
authors: []
tags: []
categories: []
date: 2023-05-26
draft: false

# Optional external URL for project (replaces project detail page).
external_link: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  # caption: "Phenotypic diversity in Hemerocallis. Plants can be caracterised by many different traits, all of which can be assigned numerical values:  Flower colour, Specific Leaf Area (SLA), seed mass, Plant nitrogen fixation capacity, Leaf shape, Flower sex, plant woodiness. Source: [H Cui et al. 2019](https://doi.org/10.1371/journal.pone.0216460)"
  focal_point: ""

authors:
- admin

tags:
- Sailing
- Open Source Project

categories:
- Sailing tutorials
---

*Back in the days, people used to orient themselves with paper maps and the stars or with a sextant. Unfortunately, we have lost this knowledge. It would now be difficult, at least for me, to live without a digital map and a GPS. In this blog post, I detail how to set up a handy navigation system for sailing, using a Raspberry Pi and OpenPlotter to transmit GPS and AIS signals over Wifi to the Navionics Boating app.*

## Choosing the Right Chart Maps

There are plenty of digital chart map options available for navigation, and we had to figure out which one would fit our need on the boat. After careful consideration, we narrowed down our choices to two alternatives: [o-charts charts](https://www.o-charts.org), to be used in combination with OpenCPN, an open source navigation software, or [Navionics](https://www.navionics.com) charts, to be used with the "Navionics Boating" application. Both had a similar pricing for what we wanted (charts for Germany, Denmark, Sweden, Norway, Shetland Islands, UK, Ireland and France): around 120-150EUR, with a slight advantage for Navionics. Pros for o-charts is that you can use them more than one year, although the update option is only valid for a year (I think, although I am not 100% sure). Navionics charts is only valid for a year, the period of the subscription. Pros for Navionics is that you can use your subscription on many devices (at least 5, I think), while you cannot use o-charts on iOS devices and on more than 2 devices. Because we wanted to have charts on our smartphones, we decided to go for Navionics.

## The Importance of Accurate GPS and AIS

While our smartphones' GPS serves us well in our daily lives, accurate positioning becomes critical when sailing. It ensures that we navigate safely, avoiding shallow waters and potential collisions. Additionally, during nighttime navigation, an instrument called AIS (Automatic Identification System) proves invaluable by providing information about nearby large ships.

In the following, I explain how I installed a server on our boat that transmits GPS and AIS to the "Navionics Boating" application our smartphone and tablets through Wifi. For this, I used a Raspberry Pi 4, OpenPlotter, and a GPS beacon and a radio antenna fixed on the outside of the boat and connected to the Raspberry. 

## Installing OpenPlotter on the Raspberry Pi

To get started, you need to install [OpenPlotter](https://openmarine.net/openplotter), a Linux distribution designed for Raspberry Pi and that contains the essential software for navigation. I used the 64-bit [OpenPlotter Starting image](https://openplotter.readthedocs.io/en/latest/getting_started/downloading.html#openplotter-starting) that contains an appropriate pre-built kernel. To install it, you'll need a less than 32GB SD-card, to be formatted in FAT32. My problem was that the SD card I had had already been used on a Raspberry Pi, and as such contained an EXT4 partition. EXT4 partitions are used by Linux systems, but are not recognized by MacOS. This prevented me to format the card in FAT32. To allow formatting, I used the `diskutil` utility from MacOS.

First run 

```diskutil list```

in the Terminal. This allows you to identify your SD card, in my case `/dev/disk4`.  I had previously installed [`ext4fuse`](https://medium.com/@iamalleksy/how-to-mount-raspberry-pi-sd-card-using-mac-3046abc2059a), not sure if this is a required step. To format the SD card, execute the command 

```
sudo diskutil eraseDisk FAT32 RASPBERRY MBRFormat /dev/disk4
```

You can change `RASPBERRY` with any name you like best. More details of this command in [this thread](https://superuser.com/questions/527657/how-do-you-format-a-2-gb-sd-card-to-fat32-preferably-with-disk-utility).

Now the SD card is ready to be used. Download the [Raspberry Pi Imager](https://www.raspberrypi.com/software/) to install the image on the SD card. You first need to unzip the image, then execute Raspberry Pi Imager, click "Choose OS" and click on "Use custom". Locate the `.img` file, then choose the SD card in "Choose storage" and hit "Write". The SD card is ready. Insert it in the Raspberry Pi and swith the power on. The system is going boot on the SD card and set up OpenPlotter. This took a relatively short amount of time.

## Setting up OpenPlotter
I had an external monitor that I could use for the Raspberry Pi. I encountered a minor hurdle as OpenPlotter failed to identify it correctly, and did not properly display. I had to adjust the resolution of the screen by hitting the raspberry, then "Preferences" and "Screen configuration". Check also the configuration of the monitor, that may be set to zoom in the visual signal.

## Setting up the GPS
Configuring the GPS was a straightforward process that involved following [this tutorial](https://youtu.be/r8CGixMl18k?t=358).

## Setting up the AIS
Similar to configuring the GPS, we followed [this video tutorial](https://www.youtube.com/watch?v=qEeyl-WSDHk) (in French, with translation available) to set up the AIS system. At first, I did not correctly calibrate the PPM offset, and although I did follow the rest of the procedure correctly, I had an "inactive" AIS process. I then redid the whole procedure, properly waiting for more than an hour to get the PPM initial guess correct, and with this value, I did manage to make it work.

## Getting the signal on Navionics through OpenPlotter Access Point

To transmit the GPS and AIS data to the Navionics application, we established an access point using the Raspberry Pi. This allowed us to create a Wi-Fi network, enabling our devices to receive the signals. We followed this [this video](https://www.youtube.com/watch?v=tlU4HKT6XxM) to set up the access point, which provided clear instructions for this setup.

I did struggle to switch off the access point to connect back the Raspberry Pi to a Wifi network with Internet in order to do some updates and download a few stuff. It turns out it is quite easy. Go to the Network app, and on the Network mode tab, select back for "AP" "non" instead of "xx:xx:..:xx on board". Then hit the pen and sd card button, and reboot. Now you can connect back to a wifi network.

## Setting up a SSH connection to transfer big files
I could not properly download the charts I needed on the Raspberry Pi because the wifi on the boat was too weak. So I decided to download it on my smartphone that I could bring closer to the hotspot, and then transfer the files to the Raspberry Pi. In order to facilitate the process, I installed a SSH connection between my laptop and the Pi, then transferred through Airdrop the charts from my phone to my laptop, and then from the laptop to the Pi with SSH and the `scp` command. To enable the SSH access, click on the Raspberry, then "Raspberry Pi Configuration", the go to the "Interfaces" tab and enable SSH. From your laptop, connect to the Raspberry AP, go to the terminal and run 

```
ssh pi@openplotter.local
```

The password by default is `raspberry` (this is indicated [here](https://openplotter.readthedocs.io/en/latest/getting_started/installing.html?highlight=ssh#headless)). Then you can use the following command to transfer any folder to the Pi

```
scp -r path/to/folder/on/laptop pi@openplotter.local:/home/pi/path/you/want/to/drop/the/folder
```

## Useful links

- [o-charts charts](https://www.o-charts.org)
- [Navionics charts](https://www.navionics.com)
- [OpenPlotter](https://openmarine.net/openplotter)
- [OpenPlotter Starting image](https://openplotter.readthedocs.io/en/latest/getting_started/downloading.html#openplotter-starting)
- [ext4fuse](https://medium.com/@iamalleksy/how-to-mount-raspberry-pi-sd-card-using-mac-3046abc2059a)
- [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
- [Tutorial: Setting up GPS](https://youtu.be/r8CGixMl18k?t=358)
- [Tutorial: Setting up AIS](https://youtu.be/r8CGixMl18k)
- [Tutorial: Creating OpenPlotter Access Point](https://www.youtube.com/watch?v=tlU4HKT6XxM)
- [Tutorial: SSH Connection](https://openplotter.readthedocs.io/en/latest/getting_started/installing.html?highlight=ssh#headless)
