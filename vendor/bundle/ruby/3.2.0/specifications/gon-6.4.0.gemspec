# -*- encoding: utf-8 -*-
# stub: gon 6.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "gon".freeze
  s.version = "6.4.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["gazay".freeze]
  s.date = "2020-09-18"
  s.description = "If you need to send some data to your js files and you don't want to do this with long way trough views and parsing - use this force!".freeze
  s.email = ["alex.gaziev@gmail.com".freeze]
  s.homepage = "https://github.com/gazay/gon".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.0".freeze)
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Get your Rails variables in your JS".freeze

  s.installed_by_version = "3.6.1".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<actionpack>.freeze, [">= 3.0.20".freeze])
  s.add_runtime_dependency(%q<i18n>.freeze, [">= 0.7".freeze])
  s.add_runtime_dependency(%q<request_store>.freeze, [">= 1.0".freeze])
  s.add_runtime_dependency(%q<multi_json>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rabl>.freeze, ["= 0.11.3".freeze])
  s.add_development_dependency(%q<rabl-rails>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, [">= 3.0".freeze])
  s.add_development_dependency(%q<jbuilder>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<railties>.freeze, [">= 3.0.20".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<pry>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<pry-byebug>.freeze, [">= 0".freeze])
end
