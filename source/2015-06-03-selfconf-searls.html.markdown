---
title: "Self.Conference: Searls &amp; Controllers"
date: 2015-06-03 13:07 UTC
tags:
author: Jeff Casimir
layout: post
---

Last week I was in Detroit for [Self.Conference](http://selfconference.org/). I've been working
on taking diligent notes when I attend talks and was writing like mad the whole conference. I'd like
to share some of what I heard and the ideas or questions it generated for me.

The opening keynote was by my friend [Justin Searls](https://twitter.com/searls) from [Test Double](http://testdouble.com/).
The session was titled "Sometimes a Controller is Just a Controller" and the core of the content was about
writing high-quality, boring, highly-maintainable software.

<img src='https://pbs.twimg.com/profile_images/2360535353/20120630-face.jpg' style="width:200px; float:right; margin: 20px"/>

Justin got things going with an interesting question: we've been building software for some 50 years at this point. Are we demonstrably any better at it? Sure, our code does more. We can stand on the shoulders of giants and use high level languages in tandem with amazing frameworks to produce complex systems in a short time. But is the code *better*? Is it easier or perhaps less-stressful to maintain than code of 30 years ago? The answer is probably "yes," but it isn't a slam dunk.

Justin's theory is that the pressure of evolution in development practices is *not* towards quality. Good code doesn't stamp out bad code. In fact, it seems that fighting bad or complex code is an effort to fight entropy. In a system dominated by organization and order, entropy is constantly trying to sneak in. The best implemented application could, at any minute, fall victim to "clever."

<img src='http://www.blogcdn.com/www.mandatory.com/media/2013/08/idiocracy.jpg' style="width:200px; float:left; margin: 20px"/>

Why doesn't progress push us towards quality? It reminds me of [Idiocracy](http://www.imdb.com/title/tt0387808/). The best developers, it seems, are tortured by anxiety. Contientious coders, Justin contends, doubt themselves. They worry. They second guess. That's what pushes them toward quality and simplicity.

The callous coder, on the other hand, doesn't doubt. They sling code. They move fast and break things. They ship without regard. They, effectively, spray their work across the world. It might be junk but once in awhile it works just enough. They're fast, fast, FAST.

I've long felt that the software world has troubling illusions about speed. Everything needs to happen NOW. You have to be first to market or else you might as well give up. But who spins that myth? Money people. VC people. The only way you can move crazy fast is if you start with a stockpile of cash. You accelerate as quickly as possible, ship-ship-ship, and try to convince the world that your hockey stick growth is a long-term trajectory. As quickly as possible, those investors want you to sell or IPO. That's the machine that sells "fast."

Justin then started into a theme that I'd later touch on in my own session: monoculture. Monocultures are fast. If your team thinks alike, argues alike, and laughs alike then you can effectively act like a multi-headed beast. You can move *fast* because you don't need to discuss things. You don't make space for different viewpoints. You don't worry about people who are different than you because (a) their voice isn't in the room and (b) your cacophony of agreement tricks you into thinking you're doing the obviously-right thing. As Justin said, "there's no need to normalize for feelings." Ship, ship, ship.

Looking at Turing from Justin's position, I see both strengths and weaknesses. I'm proud to see diversity grow among both our students and staff. We're seeing a larger percentage of women. Our age range has stretched from 17 up to nearly 50. We see lots of skin tones, educational backgrounds, and people from all over the country. It's perhaps a low bar, but I think Turing's community is a mixture more representative of our country than the city in which we reside.

<img src='/images/article_images/turing-full-class.jpg' style="float:right; margin: 20px"/>

We take time to disagree. For many students, the people lessons learned working through pair and team projects are just as valuable as the technical skills. I'm proud that our graduates know how real software teams work and, while they're not perfect, they are ready to be highly productive members.

But "fast." I worry about "fast." Reaching all the way back to Hungry Academy, we've always pushed for "intensity." We're trying to reap the maximum possible skill growth from a short period of time. That means working long hours and long weeks. Pushing yourself to the limit.

 Does that environment incentivize quality? Not naturally. We want to see finished software. At times, and even now occasionally, we've been willing to overlook quality issues if they led to working software. When it comes down to it, our environment trends towards the same patterns as the VC world: move fast, sacrifice quality, ship, and hope you can get out before it all comes crashing down.

<img src='http://www.devsniper.com/wp-content/uploads/gettingrealbook.jpg' style="width:200px; float:left; margin: 10px 20px 20px 0px"/>

How do we resist that tendency? Cut back on the intensity? Build smaller things over a longer period of time? One of my [all-time favorite tech readings](https://gettingreal.37signals.com/ch05_Half_Not_Half_Assed.php) comes from [Jason Fried](https://twitter.com/jasonfried). Build half a product, not a half-assed product. That's what we try to tell them. *Over and over*.

But it's so hard to believe. Everyone wants to deliver a shiny, impressive project. But if you sacrifice quality for features, what are you really learning? What are you practicing? What are you going to do next time? You've let entropy in and it's hard to recover.

To all the current and future software developers out there, please *slow down*. It's not worth it. Work hard, have high expectations, but if you need to make a sacrifice then cut scope not quality. Build a small, excellent thing that shows promise. Avoid the temptation to build an application that's shiny on the outside but rotten in the core.

Allow yourself to feel anxious. Feel self-conscious. Imagine the people you respect are going to read this code. Practice being your best self, even under difficult conditions. Wrap your myelin around excellence. Even if you see those willing to compromise themselves pull ahead in the short term, know that you won't regret quality.

You can find a version of [Justin's talk from RailsConf on YouTube](https://www.youtube.com/watch?v=MSgR-hJjdTo). I hope to share more ideas from his and other Self.Conference talks in the coming days. Thanks for reading.

You can find me [on Twitter at @j3](https://twitter.com/j3). If you spot any typos in this article, your [pull requests are greatly appreciated](https://github.com/turingschool/blog.turing.io/blob/master/source/2015-06-03-selfconf-searls.html.markdown).
