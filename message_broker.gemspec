$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "message_broker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = 'message_broker'
  s.version = MessageBroker::VERSION
  s.authors = ['Rajeev Kannav Sharma', 'Praveen Kumar Sinha']
  s.email = ['rajeevsharma86@gmail.com']
  s.homepage = 'https://rajeevkannav.github.io/message_broker'
  s.summary = 'MessageBroker: Preview emails in browser (rails engine)'
  s.description = 'Pourable engine to observe an act on Model(s)
  instance methods. Already Configured with sidekiq for background jobs'
  s.license = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_runtime_dependency 'rails', '~> 4.2'
  s.add_runtime_dependency 'activerecord', '~> 4.2'
  s.add_runtime_dependency 'actionmailer', '~> 4.2'
  s.add_runtime_dependency 'jquery-rails', '~> 3.1'
  s.add_runtime_dependency 'bootstrap-sass', '~> 3.2'
  s.add_runtime_dependency 'sass-rails'
  s.add_runtime_dependency "sidekiq"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'sinatra'
end
