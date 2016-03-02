$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "message_broker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "message_broker"
  s.version = MessageBroker::VERSION
  s.authors = ['Rajeev Kannav Sharma', 'Praveen Kumar Sinha']
  s.email = ["rajeevsharma86@gmail.com"]
  s.homepage = ""
  s.summary = "MessageBroker: Preview emails in browser (rails engine)"
  s.description = "MessageBroker"
  s.license = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5.1"
  s.add_dependency "jquery-rails", "~> 3.1.1"
  s.add_dependency "activerecord"
  s.add_dependency "sidekiq"
  s.add_dependency "mail"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'sinatra'
end
