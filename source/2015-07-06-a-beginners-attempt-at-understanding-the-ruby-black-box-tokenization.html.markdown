---
title: "A Beginner's Attempt at Understanding the Ruby Black Box: Tokenization"
date: 2015-07-06
tags:
author: Jack Yeh
layout: post
---

## Picking pieces out of the black box

As a new programmer, I write code and it works. I really don't know how or why it works. It just does. Code, and Ruby in particular, can become a black box. I put Ruby code in and magical things happen on my computer. I can't help but think "How is this working? Why am I able to do the things I am doing? How do I make sense of this?" Unfortunately, self-doubt is never far behind. It's followed by, "There's too much here. I can't make sense of this. It's too advanced and I am not nearly smart or experienced enough." 

Luckily, at some point the need to understand eventually wins out. I am able to temporarily suspend my fears and look under the hood. But, it's too much to take in at once, so, I have to go in with clear intent. Having intention is what saves me from myself. It helps me frame what I find and more importantly, it lets me know when I can stop looking. Questions are a useful way to begin shaping this lens, and what follows is my attempt at understanding Ruby through the lens, *"How does Ruby execute my code?"*

## The Short Version

The short version is that Ruby goes through a series of steps to convert your code into language a machine can understand and execute. It begins by reading your code, character by character. Then, it matches the order of those characters against a set of rules. From those rules it generates tokens. That's step 1, tokenization. Step 2 is parsing. Ruby goes through your code again using a parsing algorithm known as Look-Ahead Left Reversed Rightmost (LALR). This algorithm uses another set of rules to process the tokens to create a data structure called an Abstract Syntax Tree (AST). The final step before the machine can read and execute the code is called compilation. Compiling is the process of translating code from one programming language to another, typically from a human-friendly language to a machine-friendly language. Ruby uses both the tokens and the AST to produce bytecode instructions for YARV, Yet Another Ruby Virtual Machine. YARV instructions are finally in a format that the Ruby C source can understand and execute. If you're like me, there's a lot of new vocabulary and concepts in the description above. That means we're going to need more specific questions to tackle each of those steps.

<img src='/images/jack1.png'/>

##The Long Version

That's the short version. The long version is quite a bit longer, so the remainder of this article will focus only on the question, "How does tokenization work?"  

**Tokenization.** Ruby goes through your code three separate times, each time pulling it apart and recombining the elements into different forms. Machines and algorithms use each of these forms to process and read your Ruby text. Tokenization is the first of these transformations. Within the Ruby C source code, there exists a loop for reading your Ruby file one character at a time. As each character is read, it is grouped according to different token types. Ruby has many different token types. The following example illustrates how a few of the most commonly used token types are generated.  

<img src='/images/jack5.png'/>

Ruby reads in the code from left to right. It identifies the first character as a number. It continues reading through each character until it reaches a non-numeric character. Even though the period character is not a numeric character, it recognizes that it could be part of a floating-point value, so it continues to the next character expecting a number. Instead, it has reached the letter "t." At this point it realizes that the period character is not part of a floating-point value and should be its own token. Ruby converts the "10" into a token of type integer called "tINTEGER." The period character comprises its own token. 

<img src='/images/jack2.png'/>

Ruby continues looping through each character, creating tokens along the way. Ruby begins the process again, starting with the next character. It recognizes the character "t" and continues reading each subsequent character until it's given an indication that the token is complete, which in this case is the space character. "Times" is assigned to a token of type identifier (tIDENTIFIER). Identifier tokens consist of any words that are not reserved words within Ruby. Identifier tokens typically refer to the names given to variables, methods and classes.

<img src='/images/jack3.png'/>

Reserved words correspond to keywords within Ruby. Keywords have special meaning, as they provide the structure and framework for the Ruby language. As such, they have their own token type. The keyword "do" gets tokenized as keyword_do. 

<img src='/images/jack4.png'/>

Ruby continues to work through your code until it is completely represented as tokens. Ruby uses these tokens to perform the step in transforming your code into a machine readable language. 

## Diving deeper into Tokenization

Understanding how tokenization happens, one can go deeper still. For example, "How does Ruby know how to create tokens from code?" For that we must look within the Ruby source code at the C level. We won't go into detail here, but in the next article we'll take a look at how the C function, parser_yylex actually tokenizes your code. In that post, we'll also look at tools, such as Ripper, that allow users to see actual tokens as they're produced.

## Summary

In this article, we got a chance to take a look under the hood and see how Ruby reads the code in your programs and performs the tokenization process. It's the first of many steps before your code can be read and executed at the machine level. In the next several posts, we'll take a deeper look at how tokenization happens at the C level, as well as how Ruby parses and compiles code.

## Sources:

Shaughnessy, Pat. "Chapter 1: Tokenization and Parsing." Ruby under a Microscope: An Illustrated Guide to Ruby Internals. N.p.: William Pollock, 2014. 3-30. Print.

---

**Jack Yeh** is a student in the 1503 cohort. He started programming in December of 2014. Prior to Turing, Jack spent 10+ years in global supply chains working for multinational companies, such as Wal-mart, Groupon and China Post. When he is not staring at a screen, he is building a tiny house on wheels and exploring Colorado’s vast wilderness. Find Jack on Twitter at @tinyhousejack or github.com/jxandery.
