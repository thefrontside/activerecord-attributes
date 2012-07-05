# -*- encoding: utf-8 -*-
require File.expand_path('../lib/activerecord-attributes/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["The Frontside"]
  gem.email         = ["info@thefrontside.net"]
  gem.description   = %q{Add simple attribute annotations to your active records}
  gem.summary       = %q{Because not being able to see your actual class definition is a dev papercut}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "activerecord-attributes"
  gem.require_paths = ["lib"]
  gem.version       = Activerecord::Attributes::VERSION

  gem.add_dependency 'activerecord'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'sqlite3'
end
