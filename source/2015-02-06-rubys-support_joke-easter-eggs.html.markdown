---
title: Ruby's SUPPORT_JOKE easter eggs!
date: 2015-02-06 01:29 UTC
tags:
author: Josh Cheek
layout: post
---

## Discovering the easter egg

I was skimming through [Ruby Under A Microscope](http://www.amazon.com/dp/1593275277),
which mentioned the YARV instructions are compiled in `iseq_compile_each` in `compile.c`.
I was already aware of the [Rubinius instructions](http://rubini.us/doc/en/virtual-machine/instructions/),
so I thought I'd try to see how they differed
(<a href="#yarv_instructions_footnote" name="yarv_instructions_link">here</a>
is how I eventually extracted them).

While looking through the method, I ran across a compiler macro called
[`SUPPORT_JOKE`](https://github.com/ruby/ruby/blob/3d775f1c6fe9f558be8c9d4a3f3db8f472fd2bae/compile.c#L4458-4521)

...Why, what's this?! Lets explore!

## Get Ruby Source Code

First, we'll need Ruby's source code:

```sh
$ curl "http://cache.ruby-lang.org/pub/ruby/ruby-2.2.0.tar.gz" > ruby-2.2.0.tar.gz
$ gunzip ruby-2.2.0.tar.gz
$ cd ruby-2.2.0/
```

## Turn SUPPORT_JOKE on

If we take a look, we'll see `SUPPORT_JOKE` comes up in various places
(<a href="#whats_ag_footnote" name="whats_ag_link">What's ag?</a>)

```sh
$ ag SUPPORT_JOKE
# >> compile.c
# >> 562:#if SUPPORT_JOKE
# >> 4455:#if SUPPORT_JOKE
# >>
# >> doc/ChangeLog-1.9.3
# >> 8470:	* template/id.h.tmpl: suppress all warning: "SUPPORT_JOKE" is not
# >>
# >> eval.c
# >> 456:#if SUPPORT_JOKE
# >>
# >> iseq.h
# >> 125:#if SUPPORT_JOKE
# >>
# >> vm_opts.h
# >> 50:#define SUPPORT_JOKE                 0
```

We can see it comes up in several places.
We'll look at each of these to see if they include anything fun :)
But first, lets turn it on!

See that last one in `vm_opts.h`? That 0 means it's off, we need to change it to a `1`.
You can do this from an editor, or run `sed -i "" /JOKE/s/0/1/ vm_opts.h`
and verify with `git diff vm_opts.h`.

## Compiling our Ruby

Now that we've set the flag, we need to compile our edited Ruby.
This will, of course, vary from environment to environment,
but on my Mac, I was able to compile it into a subdirectory "joke_ruby",
with my machine's various C libraries by using the following command.
If you don't have some of these, it probably doesn't matter for our purposes,
but you can probably also get them with `brew install <libname>`

```sh
$ optdir="--with-opt-dir=$(brew --prefix openssl)"
$ optdir="$optdir:$(brew --prefix readline)"
$ optdir="$optdir:$(brew --prefix libyaml)"
$ optdir="$optdir:$(brew --prefix gdbm)"
$ ./configure --prefix="$(pwd)/joke_ruby" "$optdir"
$ make
$ make install
```

And verify it made it in there alright:

```sh
$ cd joke_ruby
$ bin/ruby -v
# >> ruby 2.3.0dev (2015-02-05 trunk 49508) [x86_64-darwin13]
```

Now, the changes we turned on are all in the binary,
so we can't see them with ag, unless we parse the hex.
I don't know a way to do that, which is also compatible with running through grep or ag,
so lets's scan it for groups of printable characters that are at least 10 characters long.
Not perfect, but good enough.
We can then scan that output for "universe",
something I expect to be in our binary,
we'll see why in a little bit
(<a href="#explain_that_code_footnote" name="explain_that_code_link">explain this code</a>).

```sh
# check that joke is on in bin/ruby
$ ruby -Kn -e 'puts $stdin.read.scan(/\w{10,}/)' < bin/ruby | ag life
# >> the_answer_to_life_the_universe_and_everything

# and off in our system ruby
$ ruby -Kn -e 'puts $stdin.read.scan(/\w{10,}/)' < `which ruby` | ag life
```

## Now we play!

As near as I can tell from looking at the source, there are 4 easter eggs to be found.

Running `ag JOKE ..`, we get a certain amount of noise in our output.
We can turn that off by only searching C files,
and we can ignore the last match,
because that's the one we already looked at when we turned the feature on.

```sh
$ ag JOKE .. --cc
# >> ../compile.c
# >> 562:#if SUPPORT_JOKE
# >> 4455:#if SUPPORT_JOKE
# >>
# >> ../eval.c
# >> 456:#if SUPPORT_JOKE
# >>
# >> ../iseq.h
# >> 125:#if SUPPORT_JOKE
# >>
# >> ../vm_opts.h
# >> 50:#define SUPPORT_JOKE
```

## Easter Egg: bitblt

Looking at the
[first half of the second match](https://github.com/ruby/ruby/blob/3d775f1c6fe9f558be8c9d4a3f3db8f472fd2bae/compile.c#L4458-4474)
 in compile.c, we see there is apparently a command `bitblt`.

```c
if (nd_type(node) == NODE_VCALL) {
  ID id_bitblt;
  ID id_answer;

  CONST_ID(id_bitblt, "bitblt");
  CONST_ID(id_answer, "the_answer_to_life_the_universe_and_everything");

  if (mid == id_bitblt) {
    ADD_INSN(ret, line, bitblt);
    break;
  }
  else if (mid == id_answer) {
    ADD_INSN(ret, line, answer);
    break;
  }
}
```

It didn't take much playing around to figure out how to use it:

```sh
$ bin/ruby -e 'puts bitblt'
# >> a bit of bacon, lettuce and tomato
```

Searching for that string, it's apparently defined in [insns.def](https://github.com/ruby/ruby/blob/3d775f1c6fe9f558be8c9d4a3f3db8f472fd2bae/insns.def#L2208-2220)
I don't know what it means, but I'm going to choose to interpret it as an homage to \_why.


## Easter Egg: `the_answer_to_life_the_universe_and_everything`

Remember when we searched the output to make sure it looked right?
Well, now we see where that came from.
We can see that right next to `bitblt`, there is a
`the_answer_to_life_the_universe_and_everything` command.

```sh
$ bin/ruby -e 'puts the_answer_to_life_the_universe_and_everything'
# >> 42
```

Hmm... yeah, I don't get it.

## Easter Egg: Exception causes

We'll get back to `compile.c` in a bit.
I'm saving it for the finale. For now, we'll turn to
[`eval.c`](https://github.com/ruby/ruby/blob/3d775f1c6fe9f558be8c9d4a3f3db8f472fd2bae/eval.c#L457-470)

```c
#if SUPPORT_JOKE
if (NIL_P(cause)) {
  ID id_true_cause;
  CONST_ID(id_true_cause, "true_cause");

  cause = rb_attr_get(rb_eFatal, id_true_cause);
  if (NIL_P(cause)) {
    cause = rb_exc_new_cstr(rb_eFatal, "because using such Ruby");
    rb_ivar_set(cause, id_cause, INT2FIX(42)); /* the answer */
    OBJ_FREEZE(cause);
    rb_ivar_set(rb_eFatal, id_true_cause, cause);
  }
}
#endif
```

So, it turns out there's a method,
[`Exception#cause`](http://ruby-doc.org/core-2.2.0/Exception.html#cause-method).
I didn't know this, so it took me like seven and a half million years to figure out.
But, eventually I got it.
Apparently `cause` gets set when you raise an exception in a rescue block.
The cause is the exception that you initially rescued (could be useful, e.g. if
you use a lib that wraps exceptions of the libs it uses, you might need to know
what initially got raised as part of troubleshooting or something). So, we can just
raise and catch an exception, and it won't have a cause.

```sh
$ ruby -e 'raise rescue p $!.cause'
# >> nil
```

But in Joke Ruby!

```sh
$ bin/ruby -e 'raise rescue p $!.cause'
# >> #<fatal: because using such Ruby>
```

## EasterEgg: Goto

Alright, this is the one we've all secretly (and [not so secretly](https://twitter.com/josh_cheek/status/292674031017148417))
been waiting for!

In the second half of that code from `compile.c`, we see that it adds support for labels and gotos.
I'll omit most of the code, b/c it gets a little long, but
[here](https://github.com/ruby/ruby/blob/3d775f1c6fe9f558be8c9d4a3f3db8f472fd2bae/compile.c#L4475-4521)'s
the fun part:

```c
CONST_ID(goto_id, "__goto__");
CONST_ID(label_id, "__label__");
```

This is also what's going on in [the first compile.c match](https://github.com/ruby/ruby/blob/3d775f1c6fe9f558be8c9d4a3f3db8f472fd2bae/compile.c#L562-566),
and the [iseq.h match](https://github.com/ruby/ruby/blob/3d775f1c6fe9f558be8c9d4a3f3db8f472fd2bae/iseq.h#L125-127).

Now, I know a lot of y'all think `if` statements and `while` statements are these
underlying atoms that every programming language needs, and couldn't do without.
You probably even think they're pretty low-level, what with the Corey Haineses
(YES THAT coreyhaines) of the world saying things like
["an if statement is a failure to pattern match"](http://legit-quotes.com/Corey%20Haines,%20as%20envisioned%20in%20the%20brain%20of%20Josh%20Cheek,%20since%20IDK%20how%20to%20request%20archive%20of%20his%20tweets%20to%20quote%20mine/an%20if%20statement%20is%20a%20failure%20to%20pattern%20match)
(Side note: [shameless plug](https://rubygems.org/gems/overloaded_methods)).
But back in the day, people didn't even have `if` statements! They had something way better:
**gotos**.

Gotos are better than if statements, because you can make if statements out of them.
Sort of like how yarn is better than a sweater, because you can make a sweater out of it,
or a hat, or a [scarf](https://s3.amazonaws.com/josh.cheek/images/scratch/knitting-scarf.png),
or a ["square"](http://images4.ravelry.com/uploads/joshuacheek/141473428/knitting-square.jpg).
Well... to be fair, Ruby doesn't give you the corresponding jump commands, but still...

Gotos were so awesome that no one wanted to lose them.
Devs had to be ripped from their gotos by this misanthropic grinch
who wanted to spoil everyone's good time: Edsger Dijkstra.

Now, theoretically Dijkstra was a physicist.
But then he made a shortest path algorithm for weighted graphs,
which of course nobody gives a shit about -- except for academics, which of course nobody gives a shit about.
So by the transitive property of not giving a shit, you'd think no one would have given a shit.
But, through the underhanded tactics of [rhetorical warfare](http://www.u.arizona.edu/~rubinson/copyright_violations/Go_To_Considered_Harmful.html),
he successfully deposed the beloved king of control flow.

He renamed "if statements" to "structured programming",
a fancy way to say that ["gotos are replaced by indentation"](http://www.fang.ece.ufl.edu/reject.html).
The one upside is that if anyone tells you your code
has no structure, you can "well actually" them.
Thanks, Dijkstra, the world needed that.

Alright, enough true facts about the goto, lets make a while loop!

```ruby
count = 0  # => 0

__label__ :while
__goto__ :condition_met if count == 5

p count: count += 1

__goto__ :while
__label__ :condition_met

# >> {:count=>1}
# >> {:count=>2}
# >> {:count=>3}
# >> {:count=>4}
# >> {:count=>5}
```

Brilliant! Ignore the segfaults.

Now lets address a persistent problem in Ruby. How do we get out of deeply nested loops?
Check this code out: Not a flag. Not a method. Not a care in the world!

```ruby
a = 0
while a <= 10
  b = 0
  while b <= 10
    c = 0
    while c <= 10
      __goto__ :done if a + b + c > 25
      c += 1
    end
    b += 1
  end
  a += 1
end
__label__ :done
p a: a, b: b, c: c

# >> {:a=>6, :b=>10, :c=>10}
```

Normally you'd have to wrap that code in a method and use a `return` which is really
just a nerfed goto. Notice that you can only return to one place!
Why is it `return` instead of `returnto`?
Ehh? Ehh? You're programming with half a toolbox, my friends. Where's your `setlongjump`?
Where's your Duff's Device?

**STOP!** Do you want your code to be readable? Well, what's more readable than a book?
Books know about the power of gotos, that's how you [choose your own adventure](http://weirdcanada.com/tag/choose-your-own-adventure/).

Lets do something about all those underscores around the label and goto:

```sh
$ sed -i "" -E 's/__(goto|label)__/\\1/' compile.c &&
  make &&
  make install &&
  echo 'success!'
```

This allows us to write a program as beautiful as it is practical: a number guessing game.

```ruby
secret = rand 100
goto :get_guess

label :get_guess
  print 'Enter your guess: '
  guess = gets.to_i
  goto :prompt_until_correct

label :prompt_until_correct
  goto :correct if secret == guess
  goto :incorrect

label :correct
  puts "You got it!"
  goto :finished

label :incorrect
  puts "Your guess is too #{guess < secret ? 'low' : 'high'}!"
  goto :get_guess

label :finished
```

I love it. I want it in all my programs.

## Oh! The places you'll goto!

<em>
So, that's probably everything there is to be found,<br />
we looked through the code, we looked all around.

And sure some features are just for the laughs,<br />
provided on the compiling comedian's behalf.

But you, dear reader, with your attention that spans<br />
approximately infinite volumes, since this blog first began,<br />
think what you could achieve if this was what ran<br />
on production servers in the cloud or on land.
<a href="#no_warranty_footnote" name="no_warranty_link"><sup>[disclaimer]</sup></a>

With your instruction pointer, pointing at places anew.<br />
And your locations all labeled and ready to ensue.<br />
No need for a `break`, a `retry`, a `redo`<br />
Will you be control flowed? No! That won't happen to you!<br />
Just think of it! Oh! The places you'll goto!
</em>

## Footnotes

-------------

### Finding the YARV instructions <a name="yarv_instructions_footnote" href="#yarv_instructions_link">[return]</a>

I eventually found a better way than the approach I mentioned above:

```sh
ruby -ane 'puts $F[2] if /^\s*enum\s*node_type/../\}/ and /#define/' node.h
```

-------------

### What's ag?  <a name="whats_ag_footnote" href="#whats_ag_link">[return]</a>
I'm using `ag` to search through the files.
If you're on a mac, you can get it with `brew install ag`
If you don't want to install it, you can use grep: `grep SUPPORT_JOKE -r .`

-------------

### Explain that code! <a href="#explain_that_code_link" name="explain_that_code_footnote">[Return]</a>

So we ran this command, what does it mean?

```sh
ruby -Kn -e 'puts $stdin.read.scan(/\w{10,}/)' < bin/ruby | ag life
```

There are two programs being run here, `ruby`, and `ag`.
The vertical line between them is called a pipe,
and it means that the output `ruby` would normally print to our screen
is going to be the input of ag. If you remove the `| ag life`,
you'll see what Ruby is printing out. Since we didn't give `ag` a file,
it's going to search the input for lines that match.

Normally if we ran `ruby`, it would pull its input from our keyboard,
but since we wrote `< bin/ruby`,
we've set the contents of our compiled executable to be the input to the program,
this is called redirecting.

We want to scan that input for printable characters,
but it expects the input to be in a certian format called an encoding.
Since our input is a compiled program, it's "binary" data
(machine instructions, 1s and 0s), and won't be the correct encoding,
so we need to tell Ruby to treat it this way,
which we do with the `-Kn`

Now, we're into the program, we just read the entire contents of `$stdin`
(the body of our `bin/ruby`), which is about 3M, and returns a string.
We can then scan the string with our regex, which will give us an array of matches.
The regex `/\w{10,}/` means to match any set of "word characters"
(letters, basically, as opposed to giberish binary bytes),
that are at least 10 characters long. We don't have to do the 10 characters thing,
but I like that I can delete the `| ag life` and see it's working,
this removes all the spam from binary data that happens to be a
valid ascii character.

Once we have the array of matches, we pass it to `puts`,
which prints each element of the array on its own line.
These lines are fed into `ag`, and it locates our match.

-------------

### DISCLAIMER: NO WARRANTY <a href="#no_warranty_link" name="no_warranty_footnote">[return]</a>

THE POEM IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF STATEMENTS ACTUALLY BEING TRUE,
OR ADVOCATIONS BEING ADVISABLE. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE POEM OR INTERPRETATIONS AND INSPIRATIONS OF THE STATEMENTS WHICH MAY
APPEAR TO BE ADVOCATIONS THEREIN, BUT ARE REALLY SELECTED FOR RHETORIC AND RHYME.
