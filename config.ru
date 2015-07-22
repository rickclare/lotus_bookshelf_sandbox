# rubocop:disable HandleExceptions
begin
  require 'rack-livereload'
  use Rack::LiveReload, no_swf: true
rescue LoadError
  # ignore (we probably aren't in development environment)
end

require './config/environment'

run Lotus::Container.new
