# -*- encoding: utf-8 -*-
# stub: request_store 1.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "request_store".freeze
  s.version = "1.7.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Steve Klabnik".freeze]
  s.date = "2024-05-01"
  s.description = "RequestStore gives you per-request global storage.".freeze
  s.email = ["steve@steveklabnik.com".freeze]
  s.homepage = "https://github.com/steveklabnik/request_store".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.5".freeze
  s.summary = "RequestStore gives you per-request global storage.".freeze

  s.installed_by_version = "3.6.1".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<rack>.freeze, [">= 1.4".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0".freeze])
end
