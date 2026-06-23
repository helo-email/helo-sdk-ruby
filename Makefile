build:
	gem build helo-ruby.gemspec

publish:
	gem push --key github --host https://rubygems.pkg.github.com/helo-email helo-ruby-$(version).gem