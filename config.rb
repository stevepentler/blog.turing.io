# there is a root_path in this object (https://github.com/middleman/middleman/blob/ad05b33cf6c24d1c48aa9e0895d31b481b7bcf17/middleman-core/lib/middleman-core/application.rb#L57-68)
# but it uses relative paths, so I'm not very confident in it, and going to do this instead.
root = Pathname.new File.expand_path File.dirname __FILE__
$LOAD_PATH.unshift root + 'lib'
require root + "source/helpers/view_helpers"
require root + "source/helpers/comment_helpers"
helpers ViewHelpers
helpers CommentHelpers

# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

# Activate Middleman Blog
activate :blog

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
# end

# Syntax Highlighting
set :markdown_engine, :redcarpet
set :markdown,
  fenced_code_blocks: true,  # Turns on "```ruby\nsome code```" in your code
  footnotes:          true,  # "Sentence.[^1]" will link to "[^1]: Footnote." and provide a link back.
  superscript:        true,  # "^hello" will become "<sup>hello</sup>" Note that we don't have any CSS to actually make them look different.
  highlight:          true,  # "==hello==" will become "<mark>hello</mark>", which is highlighted (bg yellow)
  lax_spacing:        true,  # Not actually sure what this does. Something with making it not as strict with you placing html in the middle of your markdown.
  strikethrough:      true,  # "~~hello~~" becomes "<del>omg</del>"
  autolink:           true,  # parses links, and makes "a" tags, even when the link is not enclosed in angle brackets (sounds like it could slow down rendering, might it off in that case)
  no_intra_emphasis:  true,  # "foo_bar_baz" will not generate any "<em>" tags
  tables:             true   # GFM / PHP style tables https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#tables



require 'jsl/shell_lexer'
activate :syntax,
  wrap:          true,        # Wrap the highlighted content in a container (<pre> or <div>, depending on whether :line_numbers is on).
  css_class:     'highlight', # Wrap the highlighted content in a container. Defaults to `<pre><code>`, or `<div>` if line numbers are enabled.
  line_numbers:  false,       # Generate line numbers. Note that this changes HTML, thus styles will need to change, as well.
  lexer_options: { }          # Options for the Rouge lexers (currently only "debug", but works best to run this f

# half taken from here http://blog.leonardfactory.com/2013/05/05/code-fenced-blocks-pygments-and-line-numbers-with-jekyll/
# half taken from here https://github.com/middleman/middleman-syntax/blob/d1a49ee30f9a2ef939a00b78f3b38cca6c5bcc0c/lib/middleman-syntax/extension.rb#L20
class ::Middleman::Renderers::MiddlemanRedcarpetHTML < ::Redcarpet::Render::HTML
  def codespan(code)
    %'<code class="inline-code">#{code}</code>' # Inline code custom class
  end
end


activate :directory_indexes
set :build_dir, "tmp"

# Define assets directories
set :css_dir,    'stylesheets'
set :js_dir,     'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
