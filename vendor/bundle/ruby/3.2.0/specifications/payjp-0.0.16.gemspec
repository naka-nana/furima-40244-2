# -*- encoding: utf-8 -*-
# stub: payjp 0.0.16 ruby lib

Gem::Specification.new do |s|
  s.name = "payjp".freeze
  s.version = "0.0.16".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "source_code_uri" => "https://github.com/payjp/payjp-ruby" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["PAY.JP".freeze]
  s.date = "2024-11-14"
  s.description = "PAY.JP makes it way easier and less expensive to accept payments.".freeze
  s.email = ["support@pay.jp".freeze]
  s.homepage = "https://pay.jp".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.6".freeze
  s.summary = "Ruby bindings for the Payjp API".freeze

  s.installed_by_version = "3.6.1".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<rest-client>.freeze, ["~> 2.0".freeze])
  s.add_development_dependency(%q<mocha>.freeze, ["~> 1.2.1".freeze])
  s.add_development_dependency(%q<activesupport>.freeze, ["< 5.0".freeze, "~> 4.2.7".freeze])
  s.add_development_dependency(%q<test-unit>.freeze, ["~> 3.6.2".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 11.3.0".freeze])
  s.add_development_dependency(%q<bundler>.freeze, [">= 1.7.6".freeze])
end
