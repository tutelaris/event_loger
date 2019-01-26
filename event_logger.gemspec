$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "event_logger/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "event_logger"
  spec.version     = EventLogger::VERSION
  spec.authors     = ["Klim Markelov"]
  spec.email       = ["nunefalix@gmail.com"]
  spec.homepage    = "https://github.com/tutelaris"
  spec.summary     = "Gem which can help you to track each exception on your code."
  spec.description = "This gem is created to keep controller and model logs easier. If something goes wrong error message would be added to your database as error message with some kind of event. Moreover you can add your custom messages to each step of method execution. It will help you to catch the error without loosing functionality"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails"

  spec.add_development_dependency "sqlite3"
  spec.add_dependency "will_paginate", '~> 3.0.6'
  spec.add_dependency "will_paginate-bootstrap" 
end
