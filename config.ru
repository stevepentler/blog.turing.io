require "rack"
require "middleman/rack"
require "rack/contrib/try_static"
require "rack/rewrite"
require "honeybadger"

# Build the static site when the app boots
# `bundle exec middleman build`

# Enable proper HEAD responses
use Rack::Head

REDIRECTS = {
  "/2015/03/10/nesta-launches-in-partnership-with-the-white-house/" => "http://blog.turing.io/2015/03/10/nesta-launches/",
  "/2015/03/10/nesta-launches-in-partnership-with-the-white-house"  => "http://blog.turing.io/2015/03/10/nesta-launches/"
}

use Rack::Rewrite do
  REDIRECTS.each do |from, to|
    found from, to
  end
end

# Attempt to serve static HTML files
use Rack::TryStatic,
    root: "tmp",
    urls: %w[/],
    try:  ['.html', 'index.html', '/index.html']

# Configure and start Honeybadger
honeybadger_config = Honeybadger::Config.new(env: ENV['RACK_ENV'])
Honeybadger.start(honeybadger_config)

# And use Honeybadger's rack middleware
use Honeybadger::Rack::ErrorNotifier, honeybadger_config
use Honeybadger::Rack::MetricsReporter, honeybadger_config

# Serve a 404 page if all else fails
run -> env {
  not_found_page = File.expand_path("../build/404.html", __FILE__)

  if File.exist?(not_found_page)
    [ 404, { 'Content-Type' => 'text/html'}, [File.read(not_found_page)] ]
  else
    [ 404, { 'Content-Type' => 'text/html' }, ['404 - page not found'] ]
  end
}
