---
title: How I Learned to Stop Worrying and Love the Bomb
date: 2015-08-03 22:57 UTC
tags: errors, Stacktrace, dev school, learn Ruby
author: Marla Brizel
layout: post
---
![Halp!](http://marlabrizel.github.io/assets/img/failing_tests.png)

Errors are your friends.

This idea was difficult for me to grasp when I first started programming. A typical block of work time would consist of the following:

1. Write some tests and some code that should theoretically make those tests pass
2. Run the tests
3. Get terminal output similar to the image above
4. Panic

I would watch my screen fill up with terrifying error messages and I'd freeze. Yes, I know my code is broken thankyouverymuch. It took me a while to appreciate that what lay before me on the screen was not a pile of computer word vomit but rather a roadmap of sorts, and all I needed to do was learn how to read it.

To be completely honest, I *hated* school until I figured this out.

## One of the most important things a new developer can do is learn to read a stack trace.
So, how does one learn to read a stack trace? Read on for some tips:

**Practice.** The more error messages you read, the easier it gets. This is true for just about everything when it comes to programming, but especially so with stack traces. If you're just starting out, ask someone for help. The more you practice, the better you'll get at learning to...

**Recognize Patterns.** If one error is intimidating to a new programmer, then multiple are just downright scary. But often, a single mistake in one's code will have a cascading effect across the entire codebase. Stack traces let us see this easily. For example, if five tests are all failing with error messages that all implicate a particular method, chances are good that this is a place to start troubleshooting. In this case, the stack trace becomes a step-by-step guide to fixing errors or refactoring.

**Learn What to Ignore.** Most stack traces are several lines deep. While it's generally a good idea to start reading at the top, it's often impractical to peruse ten or twenty or more lines of error messages to figure out what's going on. Fortunately, we can cut down the number of lines we need to look at by separating out our code from the gems we're using. For example, we've been spending a lot of time with [Sinatra](http://www.sinatrarb.com) in class lately. When I write code in Sinatra and something blows up, I will immediately skip over the lines in the error message that reference the Sinatra code and instead look for where the errors are hitting my files. The odds are good that the issue is not with the Sinatra gem, but rather with my own code.

##Above all else, learning to read a stack trace takes practice. The moment I started to get the hang of this exercise was the point at which coding truly shifted from scary to fun.###
---

<a href='https://github.com/marlabrizel'>
<img src='https://avatars2.githubusercontent.com/u/6632025?v=3&s=400' style="width:160px; float:left; margin: 10px 20px 20px 20px"/></a>

Marla Brizel is a student in Turing's 1505 cohort. This article was originally published on her [blog](http://marlabrizel.github.io/blog/my-friend-the-stack-trace/). You can also find her on [Twitter](https://twitter.com/marlabrizel) and [GitHub](https://github.com/marlabrizel). Prior to Turing, Marla was a scrum master and led a full Agile transition for a local startup. In her free time she's an enthusiastic distance and trail runner.
