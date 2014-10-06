---
title: The Pivot - EmployMe
date: 2014-06-09 23:10 UTC
tags:
author: Corey Davis, Alan Smith, Robert Gu, Horacio Chavez
layout: post
---

# Student Report: EmployMe from The Pivot

We're starting a new experiment on the Turing blog: students retrospecting and
explaining some of the projects they complete. The first posts will be from our
1406 cohort reflecting on their The Pivot projects.

[The Pivot](http://tutorials.jumpstartlab.com/projects/the_pivot.html) was a three-week project comprising the first half of our third class
(weeks 15-18) of the program. Teams of four were tasked with adopting a codebase
from a different team of developers built for the [Dinner Dash](http://tutorials.jumpstartlab.com/projects/dinner_dash.html) project in class two.
Over the three weeks the teams had to bend and push the codebase into a multi-tenant
platform with a totally different business model.

Below is the report from Corey Davis, Alan Smith, Robert Gu, and Horacio Chavez:

## EmployMe: Making Muffins Out of Car Parts

<iframe src="//player.vimeo.com/video/108136753" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> <p><a href="http://vimeo.com/108136753">The Pivot - EmployMe</a> from <a href="http://vimeo.com/turing">Turing School</a> on <a href="https://vimeo.com">Vimeo</a>.</p>

Our latest project for [Turing](http://turing.io) involves pivoting a legacy codebase to a multi-tenant app. Specifically we are taking a previous single-tenant restaurant app and turning it into a multi-tenant employment app (think miniature Monster.com.) Working with legacy code comes with a lot of challenges. The obvious problem was the architecture and design of our codebase was directed to meet the needs of a single restaurant, not an employment site.

So to start, what is a pivot? Well from our seat (that of students at Turing) a pivot is taking something and making into something TOTALLY different. Which from our perspective seems totally ludacris. But the truth of it is that this is something that actually happens to us (developers) especially in the consultancy side of our world. So what does it mean?

### Legacy Code

To provide a definition, legacy code is a code base that already exists. For junior developers entering the workforce, jumping into legacy code is very common. In fact it is more common that not. It comes with a host of positives and a set of negatives. But for the most part its pretty straight forward: you work to improve or modify the existing code so as to keep a product up to date and moving forward. Let's look at the concept of clearing the white board.

Starting this project was like browsing an abandoned junkyard. There are a lot of great parts some of which you can salvage, others you can tweak, but the rest is for discard. The challenge is not fitting your project to the current code, but instead fitting the current code to your project. You have to look at each part not for what it is, but what it could be. Often you can reuse parts to fit your purposes, and this becomes your default. But you can’t let this keep you from clearing the whiteboard. Sometimes the right choice is to take an existing structure and burn it to the ground. Often it means dumping the whole file, waiting a minute, and then approaching the problem as if it was the first time.

### Bug Hunting

So hopefully the code base is relatively bug free. This is good for the existing app, but really its indifferent for the pivot, because as soon as you start ripping parts out and adding new features you are most likely going to start inventing bugs on the fly. Inevitably you jack everything up! This is a unique feeling because you know that you started off with a nice clean app and green tests, so you kind of have to brace for this. Especially if you don’t fully understand how the legacy worked to begin with. It worked, it seems like it should still work, but it doesn’t.

## Pivot Points

One would think that by name a "pivot" would be obvious. But the thing is that depending on how far the pivot is intended to swing these points may be highly convoluted. In the case of this project they were not clear from the start. We took a restaurant ordering app and pivoted over to a Monster.com like hiring platform. This was a big swing, and our original ideas on where the pivot points were proved to be way off base. This is where applying the Agile idea of flexibility becomes so critical. If you think that you can see the outcome you probably are already lost. Instead figure out the dream, then let the process and work evolve to get there.
