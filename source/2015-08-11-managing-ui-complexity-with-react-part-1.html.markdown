---
title: Managing UI Complexity with React Part 1
date: 2015-08-11 15:59 UTC
tags: React, UI
author: Alan Smith
layout: post
---
*This is Part I of a two-part post on using React to manage UI complexity. This article will be more of a case for why React is a good option and some of the guiding principles behind React. Part II will be more of tutorial/technical walkthrough of how a specific application would use React.*

![React](https://photos-2.dropbox.com/t/2/AAD3ihBuvet1-P9OsMIcMFHtglJzUtk7guukmY3Ua4nj_w/12/394682978/png/32x32/1/_/1/2/React.png/EMit4JIDGIkYIAcoBw/CpEyW9hQ9oVvVpsRTsiDoe4F-gxMKJiKApn_Hjtvd74?size=1024x768&size_mode=2)
### First, a Brief History of the Web...
The Internet is one of the few things we've created that we don't fully understand. It has changed drastically since it's inception, and we're still trying to figure out what it is and how people can use it. The [first websites](http://info.cern.ch/hypertext/WWW/TheProject.html) were designed to be archival in nature, a vast resource of static files that could be accessed anywhere. Later we discovered we could be a [bit more creative](http://www.warnerbros.com/archive/spacejam/movie/jam.htm) and expand our UIs to style by incorporating static assets. We also created sophisticated backend technologies to handle purchases and allow people to create accounts and carve out a piece of digital space they could call their own. With these rapid advancements things got really muddled. People were calling databases from HTML files. We needed structure and best practices to separate concerns and manage complexity. This was the birth of MVC. Models to handle the business logic, controllers to handle the web, and views to handle the user interface. The view layer was the most diminutive at the time, but as JavaScript and jQuery became more popular, we could sprinkle them on our sites and make things a little nicer. This worked well for a while, and still does for fairly basic things on the web.

However, as sites became more ambitious with their user interfaces, and JavaScript became the dominant language of the web, our former practices of patching JavaScript and jQuery where needed simply won't cut it for most applications. Nor were they ever intended to do so. For many it becomes crippling to maintain these systems. The web came to a point where it needed better tools, and client-side MVC frameworks, such as [Ember](http://emberjs.com/) or [Angular](https://angularjs.org/), are providing a compelling answer to this demand. However, React is another option available that has an interesting perspective on how client-side applications should behave. Much of its core philosophy flies in the face of agreed best practices for building web applications.

### Core Characteristics of React

**It's I/O, not MVC**<br>
The first thing to understand about React is that it's not a client-side MVC framework. Rather it's a *library* for building a user interface and is often described as the 'V' in MVC.

**It's backend agnostic**<br>
It doesn't care where the data comes from. This means you can use any sort of backend framework you want, or even multiple frameworks. All it does is request data and respond to it.

**React focuses on components instead of templates.**<br>
This is nice because this is typically how we already about the UI. A navbar under the hood is just a Navbar component, which is just a function that has some properties, and a state, and it renders to the page. The comment box is just a CommentBox component. This means that all the JS that affects that component is right there or in a parent component. It's not buried in a partial or in some distant JS file, it's right there. This modular style helps everything stay organized and makes it relatively easy to know what a particular component is doing and all things that affect it. This allows you to approach the code, even if you're not familiar with it, and make changes with confidence.

This idea is drastically different than accepted MVC best practices which tends to separate JS logic from the HTML it affects, with the goal of having 'dumb templates' or 'dumb views'. React argues that it's pattern of using components does a better job of actually separating concerns and not just technologies. The idea is that because the HTML being rendered and the JS affecting it have the same concern, they should be together.

**It's built to use JSX**<br>
JSX is a markup language that resembles HTML and allows you to write markup in your render function, thus keeping HTML and the JS tightly coupled. While React doesn't require the use of JSX, you'll probably find it to be the most natural way to use it.

**It renders from the top down**<br>
One-way data flow from parent components to child components, keeps things fairly simple to reason about and keeps all your data and state synchronized.

**It uses a VirtualDOM**<br>
The virtualDOM was probably React's biggest initial selling point. Instead of relying on the DOM, React renders everything to a sort of canvas that diffs components to see if they've changed and re-renders them if needed. This has the added benefit of being much faster than re-rendering the DOM for every page.

### Conclusion
React was designed as a solution for handling the ever-increasing UI complexity in web applications. It's modular and component-centered. It uses the VirtualDOM to manipulate and render components.

Stay tuned for Part II where we'll walk through the anatomy of a basic React UI. In the meantime, learn more about React [here](http://facebook.github.io/react/).

---
<a href='https://twitter.com/_alanbsmith'>
<img src='https://pbs.twimg.com/profile_images/476446734587928577/8HRk-oEm_400x400.jpeg' style="width:160px; float:left; margin: 10px 20px 20px 20px"/></a>
Alan Smith is a Turing School alumnus and mentor, developer at [Living Social](https://www.livingsocial.com), and co-organizer of [Nodebots Colorado](http://nodebotsco.herokuapp.com). This article was originally posted on his [blog](http://alanbsmith.io). You can also find Alan on [Twitter](https://twitter.com/_alanbsmith) and [GitHub](https://github.com/alanbsmith).
