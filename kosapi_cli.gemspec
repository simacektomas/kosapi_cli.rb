
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kosapi_cli/version"

Gem::Specification.new do |spec|
  spec.name          = "kosapi_cli"
  spec.version       = KOSapiCLI::VERSION
  spec.authors       = ["Tomas Simacek"]
  spec.email         = ["simacektomas@volny.cz"]

  spec.summary       = %q{CLI utility for querying KOSapi that can be used together with external tools in line wi    th *unix philosophy.}
  spec.description   = %q{CLI utility for querying KOSapi that can be used together with external tools in line wi    th *unix philosophy.}
  spec.homepage      = "https://github.com/simactom/kosapi_cli.rb"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "thor", "~> 0.20"
end
