# frozen_string_literal: true

require_relative "lib/helo/version"

Gem::Specification.new do |spec|
  spec.name = "helo-ruby"
  spec.version = Helo::VERSION
  spec.authors = ["Generated"]
  spec.email = ["generated@example.com"]

  spec.summary = "Helo API"
  spec.description = "Helo API"
  spec.homepage = "https://github.com/example/helo-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir["lib/**/*", "LICENSE.txt", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel", ">= 7.0"
  spec.add_dependency "activesupport", ">= 7.0"
  spec.add_dependency "faraday", ">= 2.0"

  spec.add_development_dependency "minitest", "~> 5.16"
  spec.add_development_dependency "webmock", "~> 3.0"
end
