# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exists?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

# Note: The cmd option is now required due to the increasing number of ways
#       rspec may be run, below are examples of the most common uses.
#  * bundler: 'bundle exec rspec'
#  * bundler binstubs: 'bin/rspec'
#  * spring: 'bin/rspec' (This will use spring if running and you have
#                          installed the spring binstubs per the docs)
#  * zeus: 'zeus rspec' (requires the server to be started separately)
#  * 'just' rspec: 'rspec'

group :backend do
  guard :rspec, cmd: 'rspec' do
    require 'guard/rspec/dsl'
    dsl = Guard::RSpec::Dsl.new(self)

    # Feel free to open issues for suggestions and improvements

    # RSpec files
    rspec = dsl.rspec
    watch(rspec.spec_helper) { rspec.spec_dir }
    watch(rspec.feature_helper) { rspec.spec_dir }
    watch(rspec.spec_support) { rspec.spec_dir }
    watch(rspec.spec_files)

    # Ruby files
    ruby = dsl.ruby
    dsl.watch_spec_files_for(ruby.lib_files)

    # Lotus files

    # lotus ||= OpenStruct.new.tap do |lotus|
    #   exts = %w(erb haml slim)
    #
    #   rails.app_files = %r{^app/(.+)\.rb$}
    #
    #   rails.views = %r{^app/(views/.+/[^/]*\.(?:#{exts}))$}
    #   rails.view_dirs = %r{^app/views/(.+)/[^/]*\.(?:#{exts})$}
    #   rails.layouts = %r{^app/layouts/(.+)/[^/]*\.(?:#{exts})$}
    #
    #   rails.controllers = %r{^app/controllers/(.+)_controller\.rb$}
    #   rails.routes = "config/routes.rb"
    #   rails.app_controller = "app/controllers/application_controller.rb"
    #   rails.spec_helper = "#{rspec.spec_dir}/rails_helper.rb"
    # end
    #
    # dsl.watch_spec_files_for(rails.app_files)
    # dsl.watch_spec_files_for(rails.views)
    #
    # watch(rails.controllers) do |m|
    #   [
    #     rspec.spec.("routing/#{m[1]}_routing"),
    #     rspec.spec.("controllers/#{m[1]}_controller"),
    #     rspec.spec.("acceptance/#{m[1]}")
    #   ]
    # end
    #
    # # Rails config changes
    # watch(rails.spec_helper)     { rspec.spec_dir }
    # watch(rails.routes)          { "#{rspec.spec_dir}/routing" }
    # watch(rails.app_controller)  { "#{rspec.spec_dir}/controllers" }
    #
    # # Capybara features specs
    # watch(rails.view_dirs)     { |m| rspec.spec.("features/#{m[1]}") }
    # watch(rails.layouts)       { |m| rspec.spec.("features/#{m[1]}") }
  end
end

group :frontend do
  guard 'livereload' do
    watch(%r{app/web/views/.+\.rb$})
    watch(%r{app/web/templates/.+\.(erb|haml|slim)$})

    # Rails Assets Pipeline
    ## watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
  end
end
