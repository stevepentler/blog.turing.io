---
title: "Get Some PI: A Beginner's Guide to Integrating Hardware"
date: 2015-07-15
tags:
author: Eric Dowty
layout: post
---

### Get Some PI: A Beginners Guide to Integrating Hardware

![Raspberry Pi Logo](http://pi.qcontinuum.com/Welcome/Welcome_Resources/raspberry-pi-900-75-2.png?raw=true)

Do you remember that feeling when you created your first web page? When you could finally call your mom and tell her to visit *your-awesome-project.com*? After months of writing code finally you felt like you had accomplished something real that you could share with the world. Integrating hardware into your web applications takes that feeling one step further allowing your web applications to interact with not just cyberspace, but the physical world around you. This may seem like an impossible task. I mean, we're just students, how could we possibly have the skills to do this? Keep reading and I'll explain how you can get started.

The good news is that you don't have to start from scratch! Thousands of do-it-yourself enthusiasts have come before you to pave the way to hardware integration greatness. The hardware and code to start your journey have already been developed allowing you to take a lego-like approach to putting something together. 

Before you get started you will have to identify which piece of hardware you would like to integrate. There are several hardware devices that you may want to take a look at integrating, check out [this link](http://cylonjs.com/documentation/platforms/) to view dozens of possibilities. In this post we will be discussing the popular Raspberry Pi.

![Raspberry Pi](http://ecx.images-amazon.com/images/I/51MrYF3ct0L._SX300_.jpg?raw=true)

The Raspberry Pi is a credit-card-sized, fully functional computer that has been stripped down to only the most basic components. But don't let this fool you! Although it is small it packs a hard punch. It includes processing power that can support an Operating System (OS), as well as ports for USB, HDMI, ethernet, VGA, GPIO for hardware integration, and the capability to be wifi compatible. Think about it like this, the Raspberry Pi is more powerful than the Apollo moon capsules. If NASA can get a man to the moon with something less powerful that a Raspberry Pi the options for you and I are only bounded by our imaginations. As of 2015 approximately 4.5 million have been sold world-wide. You can purchase a Raspberry Pi for around $40. It is sold as a stand alone card computer (as pictured above) so you will have to buy some additional pieces including a power cord, a case, and any sensors or hardware that you are going to want to work with. This can all be purchased at [adafruit.com](http://www.adafruit.com/).

So now that we have hardware what is the next step? Believe it or not there is more great news to come! There are hundreds of tutorials and videos avaliable for you to follow of varying levels of complexity that will get you up and running in no time. However, before you can get started you will need to set up your new Raspberry Pi with an OS. [This tutorial](https://www.howtoforge.com/tutorial/howto-install-raspbian-on-raspberry-pi/) will walk you through how to setup the most popular, community-driven Linux distribution available: Raspbian.

Once your OS is up and running and you begin to develop your projects you'll have to write code to integrate your sensors and other hardware with the Raspberry Pi. There is even more great news! Whatever language you prefer to code with there is probably a library already written to help you with this task. Below is a list of libraries you may want to research:

* Ruby - Artoo 
* Python - GPIO
* Golang - Gobot
* JavaScript - Cylon.js

Now that we have our hardware picked out and a nice library of code to work with we need to talk inspiration. There are so many projects that may come to mind, however, I'd suggest that for your first project you follow a tutorial to get used to Raspberry Pi development. Below are a few projects that you may want to consider. If none of these quite hit the spot check out [this link](http://www.treehugger.com/slideshows/gadgets/20-awesome-projects-raspberry-pi-microcomputers/) for more ideas.

1. Automated Time-Lapse Photography

![Raspberry Pi Time Lapse Camera](http://media.treehugger.com/assets/images/2013/02/time-lapse-dolly.jpg.644x0_q70_crop-smart.jpg?raw=true)

[This tutorial](http://www.instructables.com/id/Raspberry-Pi-powered-time-lapse-dolly-RasPiLapse/?ALLSTEPS) will walk you through how to integrate a camera to produce time lapse photography.

2. Automatic Deviant Art Picture Frame

![Raspberry Pi Deviant Art](http://media.treehugger.com/assets/images/2013/02/deviant-art-picture-frame-wired-design.jpg.644x0_q70_crop-smart.jpg?raw=true)

[This tutorial](http://theswitchtolinux.blogspot.com/2012/12/raspberry-pi-daily-deviations-picture.html) will walk you through how to create a picture frame which automatically cycles through pictures from the pop art site [DeviantArt](http://www.deviantart.com/).

3. Dog Treat Dispenser

![Raspberry Pi Dog Treat Dispenser](http://media.treehugger.com/assets/images/2013/02/treat-machine.jpg.644x0_q70_crop-smart.jpg?raw=true)

[This tutorial](http://www.nyccnc.com/judd-treat-machine.html) will walk you through how to create a dispenser that will automatically release a dog treat when an email is sent to a specific address.

4. Old School Arcade Game

![Raspberry Pi Arcade](http://cnet4.cbsistatic.com/hub/i/r/2012/11/27/2862e2f6-cbf2-11e2-9a4a-0291187b029a/resize/770x578/f1e1feda0740a98003b6732679a83400/25-things-to-do-with-raspberry-pi-arcade.jpg?raw=true)

[This tutorial](http://www.iliketomakestuff.com/raspberry-pi-arcade-part-1/) will walk you through how to create an old school style arcade game including the case.

---
Eric Dowty is a student in the 1502 cohort. Prior to Turing, Eric was an Air Force engineer working on stealth aircraft software, nuclear command and control systems, and taught at the US Air Force Academy. When he is not programming, he is working out at CrossFit or salsa dancing. Find Eric on Github at [https://github.com/eric-dowty](https://github.com/eric-dowty).
