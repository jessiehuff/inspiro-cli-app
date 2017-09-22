# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inspiro/version'

Gem::Specification.new do |spec|
  spec.authors       = ["Jessie Huf'"]
  spec.email         = ["huffjd1@gmail.com"]
  spec.summary       = %q{This is a inspirational collector that provides resources to motivate users.}
  spec.homepage      = "https://learn.co"

  spec.files         = 'git ls-files'.split($\)
  spec.executables   = ["inspiro"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.name          = "inspiro"
  spec.require_paths = ["lib", "lib/inspiro"]
  spec.version       = Inspiro::VERSION
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }


  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
end
