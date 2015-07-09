---
title: Do You Even Vim?
date: 2015-07-09
tags:
author: David Daniel
layout: post
---

When I was eight, I remember hearing my father argue with one of his friends about the Atlanta Braves' pitching bullpen. At the time I cared very little for sports, but I remember listening to the intensity of the conversation thinking, "Why are they arguing so much over something so… stupid?" 

Sometimes it's sports, other times it's food, or music, or politics — chances are, if you step into a conversation among friends and listen long enough, strange opinions will rear their heads. So what happens when you put a group of 80 unique, technologically-inclined individuals in basement for 50+ hours a week and teach them to code?

We debate our text editor. 

Generally, the argument falls into two groups: The Vim evangelists, and everyone else. As it turns out, though, the 'editor war' goes back way further than I originally expected.

As many know, the original computers relied on manual punched cards to input information. Holes would be inserted into a card, which would then be read as binary by a computer to input data. After punched cards came 'line-editors', which could could be considered the first real text-editors. A user would use a typewriter-like device to send commands to the editor, which guided an imaginary 'cursor' to certain lines and positions within lines so that edits could be made, and then verified through printing.

With the dawn of a video-screen based computer terminal came a series of Unix-based editors (most notably Ed), from which spawned two giants: Vi (or Vim) and Emacs.

Emacs is a hyper-complicated (2,000+ native commands), hyper-customizable editor that uses a variety of key-modifiers and sequences to carry out various functions. Those who use it love that you can do almost anything from within an Emacs buffer - from editing a text file to checking your email or surfing the web.

Vim, on the other hand, is a modal editor. It has three main ways of operating, each with their own function: Normal mode is used for navigation, visual mode selects text, and insert modifies it. Simple enough. 

Like Emacs, it can be uniquely personalized with color schemes, plugins, and extensions numbering in the hundreds. Users like that it's fast to load and can be used both within the terminal and in a stand-alone GUI.

Now that we have a little background, I can circle around to the great Turing debate: to Vim or not to Vim.

My answer: It's a ridiculous question. 

There is, in my opinion, a major advantage to using Vim: its modal commands. In my limited experience as a developer, I've found that I spend as much, if not more, time manipulating code than actually writing it and for that, Vim commands can be a big aid. 

Need to delete a line? "dd". 
Paste that line somewhere else? "p".  
Change the content of a Javascript function? "c i {".

That said, Vim has some serious downsides. The most obvious is the learning curve — or more accurately, the learning wall. While the basics can be learned relatively quickly, mastering it takes time.

In many ways, one of Vim's greatest assets - its customizability - is also one of its faults. By default, Vim hardly looks like a text editor. Configuring a custom .vimrc is no small feat (especially for new developers), and while there are dozens of fantastic plugins, installing them can be complicated and sometimes setting up one can break another.

Not to mention, Vim is ugly.

On the other hand, we have the modern editors: TextMate, Sublime, and Atom being the biggest players. They offer out-of-the-box functionality with user-friendly, intuitive commands. They are also quite customizable, with an ever-growing library of easy-to-install plugins.

I can't help but wonder how much of Vim's popularity is due to the fact that at the time it was created, visual cursors (ie. the mouse) weren't common, and complicated forms of navigation made sense. 

With the advent of modern editors and accurate mice/trackpads, a lot of the utility of the complicated text navigation within Vim gets depreciated. Sublime Text, Atom, and several others all offer much of the customizability and utility of the old-school editors, but are significantly more user-friendly and easy to pick up.

So what if you want the benefit of Vim commands with the look and 'just-works' factor of modern editors? Good news, you can have your cake and eat it too!

There's a Vim-mode (native or non) for almost every editor. The best I've found so far is a 3rd party plugin called [Vintageous](https://github.com/guillermooo/Vintageous) for Sublime Text, which, combined with a couple of other plugins (vintageous-surround and vintageous-origami), ports all of the movement and manipulation commands I like in Vim to the best— er… *my* favorite editor. For you Atom folks, the plugin 'vim-mode' is also quite complete. These can be useful both for those trying to climb the Vim learning-wall, and folks like me who want to merge aspects of both editors. 

Like my dad's pitching debate, I think a lot of the Vim-banter that happens in the dungeon is more about having a fun conversation than actually proving a point, but if you're having trouble deciding which side to take in the great debate, here's a little advice from someone who's spent way too much time playing with all of the options available: there's always a middle ground. Use whatever works for you.

---

David is a student in Turing's 1502 cohort. After making a career of helping software developers find jobs, he decided to make the plunge himself and hasn't looked back. When he's not playing with code, he can be found playing in the mountains and rivers of Colorado. Connect with with David on [LinkedIn](linkedin.com/in/davidjdaniel) or check out some of his projects on [GitHub](http://github.com/davedan7). 
