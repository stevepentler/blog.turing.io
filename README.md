# Turing Blog

This is the app for the Turing Blog (http://blog.turing.io).

The app is built using *middleman* (http://middlemanapp.com), therefore all
middleman commands are available.

* middleman article TITLE             # Create a new blog article
* middleman build [options]           # Builds the static site for deployment
* middleman console [options]         # Start an interactive console in the context of your Middleman application
* middleman extension NAME [options]  # Create Middleman extension scaffold NAME
* middleman server [options]          # Start the preview server
* middleman upgrade                   # Upgrade installed bundle
* middleman version                   # Show version

## Syntax Highlighting

We're using [Rouge](https://rubygems.org/gems/rouge)
to highlight syntax. This is integrated using the
[middleman-syntax](https://rubygems.org/gems/middleman-syntax)
gem.

### Configuration

Configuration is in config.rb under "Syntax Highlighting"
More options are discussed in the [Rouge readme](https://github.com/jneen/rouge#full-options).

### Styling

Styling is in `source/stylesheets/components/_syntax_highlighting.css.erb`
Because of our configuration values,
the code will be wrapped like this ("shell" is due to the language being parsed):

```html
<pre class="highlight shell">
  <code>
    <span class="gp">$ </span><span class="nb">cd </span>somewhere
  </code>
</pre>
```

CSS comes from `Rogue::Theme` classes,
[here](https://github.com/jneen/rouge/tree/eb087ceb927d5e2d27dfed4f704d8d8a270fbe85/lib/rouge/themes)
is a list.
They work by defining a palette -- a list of names that map to specific colours.
Then they map each token type to one of the values in the palette.
A token is what gives a piece of syntax its metadata.
In the code sample above, there are 2 tokens,
`Generic.Prompt` on `$ `, which gets rendered as
`<span class="gp">$ </span>`, and `Name.Builtin`, on `cd`.

You can override a theme's values for the palette,
or override values for specific tokens.

[Here](https://github.com/jneen/rouge/blob/eb087ceb927d5e2d27dfed4f704d8d8a270fbe85/lib/rouge/token.rb#L78-179)
is a list of tokens and their "shortname", which is used for their CSS class.

Here are some ways you might work with the theme:

```ruby
# See a list of themes
Rouge::Theme.registry.keys  # => ["thankful_eyes", "colorful", "base16" ...

# Get a theme to work with
theme = Rouge::Theme.find("molokai")  # => Rouge::Themes::Molokai

# render CSS from the theme.
theme.render  # => ".highlight table td { padding: 5px; ...

# See what colours it's using for the different types of tokens
theme.styles  # => {<Token Comment>=>{:fg=>:dark_blue, :italic=>true}, ...

# See a list of all the tokens at https://github.com/jneen/rouge/blob/master/lib/rouge/token.rb#L78-179
# their shortnames are used for their CSS classes.
Rouge::Token.cache  # => {"Text"=><Token Text>, "Text.Whitespace"=>...

# See what colour it's using for a specific type of token
token = Rouge::Token.cache['Operator']  # => <Token Operator>
theme.styles[token]                     # => {:fg=>:red, :bold=>true}

# What css class will that map to?
token.shortname  # => "o"

# Change the colour it uses for red
theme.palette[:red]                      # => "#f92672"
theme.render[/^[^\n]*?\.o\b.*?\{*?\}/m]  # => ".highlight .o {\n  color: #f92672; ...
theme.palette[:red] = '#f22'             # => "#f22"
theme.palette[:red]                      # => "#f22"
theme.render[/^[^\n]*?\.o\b.*?\{*?\}/m]  # => ".highlight .o {\n  color: #f22; ...

# Override one specific colour for one specific token
theme.styles[token]                      # => {:fg=>:red, :bold=>true}
theme.render[/^[^\n]*?\.o\b.*?\{*?\}/m]  # => ".highlight .o {\n  color: #f22; ...
theme.styles[token][:fg] = '#AAA'        # => "#AAA"
theme.styles[token]                      # => {:fg=>"#AAA", :bold=>true}
theme.render[/^[^\n]*?\.o\b.*?\{*?\}/m]  # => ".highlight .o {\n  color: #AAA; ...
```

### Lexing

Lexing takes a string of code and splits up into an array of strings and tokens.

```ruby
Rouge::Lexer.find('ruby').lex('$stdout.puts "hello, world!"').to_a
# => [[<Token Name.Variable.Global>, "$stdout"],
#     [<Token Punctuation>, "."],
#     [<Token Name.Function>, "puts"],
#     [<Token Text>, " "],
#     [<Token Literal.String.Double>, "\"hello, world!\""]]
```

You only need to care about this when you want to change how it lexes.
We have our own lexer for shell code, for example.
It adds the ability to display output.
In the code sample below, our highlighter will remove
the "# >> " so that only "hello, world!" is remaining,
which will be classified as Generic.Output (css class "go")

```sh
$ ruby -e 'puts "hello, world!"'
# >> hello, world!
```

Ours will lex it like this:

```ruby
$LOAD_PATH.unshift '/Users/josh/code/jsl/blog.turing.io/lib'
require 'jsl/shell_lexer'

shellcode = <<CODE
$ ruby -e 'puts "hello, world!"'
# >> hello, world!
CODE

Jsl::ShellLexer.lex(shellcode).to_a
# => [[<Token Generic.Prompt>, "$ "],
#     [<Token Text>, "ruby -e "],
#     [<Token Literal.String.Single>, "'puts \"hello, world!\"'"],
#     [<Token Text>, "\n"],
#     [<Token Generic.Output>, "hello, world!\n"]]
```

To get a better understanding of how the lexer is working, you can run the
binary with the lexer's `debug` option on. This will show its state as it
lexes the code, and will also the order it attempts to match the regexes.

```sh
$ echo 'puts "hello"' | rougify highlight -l ruby -L debug=true -
```

With a little effort, you can also override its environment a bit to get information like that on your custom lexers.

```sh
$ ruby -r rouge                          \
       -r rouge/cli                      \
       -I ~/code/jsl/blog.turing.io/lib/ \
       -r jsl/shell_lexer                \
       -e 'Rouge::CLI.parse(ARGV).run'   \
       highlight --lexer-opts debug=true --input-file f.sh
```

### Quick view of themes and languages

Rouge has a server that will render each of its themes and languages.
This is a really great way to get a good quick feel for what the language looks like,
or what the theme looks like.

```sh
$ git clone https://github.com/jneen/rouge
$ cd rouge
$ bundle
$ rackup config.ru
$ open 'http://localhost:9292/ruby?theme=molokai'
```
