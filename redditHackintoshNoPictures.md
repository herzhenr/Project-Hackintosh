# Triple Boot MiniITX Hackintosh with SecureBoot (MacOS Monterey, Windows 11, Ubuntu 22.04) in NR200P (OC 0.7.6)

MacOS Monterey successfully running on my Mini-ITX machine alongside Windows 11 and Ubuntu 22.04 with activated Secure Boot.

I recently built my first miniITX PC which I specifically configured to run well as a Hackintosh. In the last days I updated to the newest macOS Version and therefore wanted to share with you my finished build!

# Decision for a Hackintosh

I need a Desktop PC that combines productive work under macOS but also gaming on Windows and development under Linux. Gaming isn't really enjoyable under macOS/Apple Silicon Chips at the moment in my opinion so a Hackintosh running all 3 OSes is a perfect solution for me. I also like tinkering around and a hackintosh gives me the possability (in comparison to Apple) to select the specific hardware I want so I went that route.

For this build I wanted to go MiniITX mainly for the looks but I also like the challenge of cramping much horsepower into a small form factor case while making almost no compromises regarding performace or looks.

# Hardware

Specs:

|                 | **Parts**                                     |
| --------------- | --------------------------------------------- |
| **Case**        | NR200P Black                                  |
| **CPU**         | Intel Core i9-10850K                          |
| **Motherboard** | ASRock Z490 Phantom Gaming-ITX/TB3            |
| **CPU-Cooler**  | Scythe Mugen 5 Rev.B                          |
| **RAM**         | Kingston FURY Beast 64GB (DDR4-3600 CL18)     |
| **GPU**         | XFX RX 5700XT THICC III Ultra                 |
| **PSU**         | Corsair SF Series SF750 80 PLUS Platinum 750W |
| **Fans**        | Cooler Master MasterFan MF120 Halo (3-pack)   |
| **Wifi/BT Card**| Fenvi BCM94360NG (replaced onboard motherboard chip)  |

## Some notes:

**CPU:**
I decided to go for a 10th Gen Intel chip as it is the latest generation natively supported by macOS. Also at the time I bought the parts for the build 12th gen Intel Chips weren't yet released and 10th gen was much more affordable than 11th gen so my decision was made.

**Wifi/BT Card:** 
The onboard Wifi/BT card on this motherboard isn't supported by macOS but it is CNVI unlocked meaning I could replace it with another Card (in my case with the BCM94360NG) which is natively supported and enables features like AirDrop.

**CPU Cooler:** 
This cooler was a very tight fit. Because of the case there was a height constrain of roughly 153mm of height and the bulky top VRM heatsink of the motherboard also interferes with many coolers. The choosen cooler just so tightly fitted after I filed some metal off of that heatsink.

**Status display:**
More on that in another reddit post comming soon

# Software

This systems runs with the help of OpenCore 0.6.7 with enabled secure boot (Full security state under macOS). This allows me to boot Windows 11 (more or less requires secure boot), Ubuntu 22.04 and most notable macOS Monterey 12.3.1.

The EFI / OpenCore configuration of this build is based on [this Post](https://www.reddit.com/r/hackintosh/comments/ic5uef/miniitx_powerful_silent_hackintosh_ncase_m1/) from Schmocklord but modified in some regards. He has a GitHub page where he explains how to get started with his EFI and how to set everything up.

I personally had to manually map my USB ports because the provided configuration didn't work for me and this also fixed sleep issues I encountered before.

Another thing I added was enabling SecureBoot (for Windows 11) and booting Linux with the recommended OpenLinuxBoot Driver (detailed instructions over at my GitHub)

# Working Features
- Audio, USB, Ethernet
- iGPU and dedicated GPU (RX 5700XT)
- CPU & GPU Power Management
- Wifi/BT
- Sleep
- iMessage, FaceTime and other iCloud Services
- Airdrop, Handoff, SideCar, UniversalControl, Unlock with Apple Watch and all the other Apple Goodies that come with macOS

# Not Working
- **Thunderbolt Support**: Haven't tested this extensively as I don't have a use for it currently but at the moment it doesn't function with my configuration as far as I now (you would need to flash the thunderbolt chip with custom firmware in order for it to work properly with hot plug support under macOS)
- **DRM**: (4K Netflix, Amazon Prime, AppleTV etc.) The Problem is my SMBIOS (iMac20,2). It makes the iGPU available for macOS which introduces the problem of DRM not working (See [here](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.Chart.md)). A possible fix would be to use another appropriate SMBIOS (e.g. iMac Pro 1,1) which hides the iGPU and only makes the dedicated GPU available for macOS which would make DRM work but then I would have to give up other features like SideCar functionality (requires Intel Quick Sync from the integrated graphics chip)

Everything else I can think of works perfectly fine. I am really happy that (almost) everything here functions like on a real Apple Mac!

# Performance

Here is a CPU and GPU benchmark of my system in macOS Monterey 12.3.1

[Link](https://browser.geekbench.com/v5/cpu/14545651) to CPU Benchmark (Intel Core i9-10850k)

[Link](https://browser.geekbench.com/v5/compute/4725064) to GPU Benchmark (RX 5700 XT)

# Conclusion

I am pretty happy how this turned out. I really like the minimalistic look of the machine as well as the small form factor but at the same time this machine has quite some computing power. This build will be my daily driver for the next couple of years. Let's see how long Apple will provide Intel Macs with further macOS Updates!

If you haven't gotten enough already and want to know more about my build as well as the installing/building process and the problems I went through have a look at my [GitHub Repo](https://github.com/herzhenr/Project-Hackintosh) as it is too much to cover it in a single reddit post.

# Credits
- huge thank to [@schmocklord](https://github.com/SchmockLord) for his excellent [z490 mini-ITX Hackintosh build](https://github.com/SchmockLord/Hackintosh-Intel-i9-10900k-AsRock-Z490-Phantom-ITX-TB3) guide as well as his [secure boot tutorial](https://www.youtube.com/watch?v=c8JcuIQu9XY&t=585s)
- another huge thanks to the [german hackintosh forum](https://www.hackintosh-forum.de) as well as [tonymacx86](https://www.tonymacx86.com). They are an awesome resource for questions about anything concerning hackintoshing
- [Dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/)
- [Opencore Project](https://github.com/acidanthera/OpenCorePkg) in general
- and of course this subreddit which also helped a lot in many cases