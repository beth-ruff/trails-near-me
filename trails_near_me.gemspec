

require_relative 'lib/trails_near_me/version'

Gem::Specification.new do |spec|
  spec.name          = "trails_near_me"
  spec.version       = TrailsNearMe::VERSION
  spec.authors       = ["beth-ruff"]
  spec.email         = ["beth-ruff@github.com"]

  spec.summary       = "a simple Ruby CLI app"
  spec.description   = "use API data to get a list of hiking trails near the user"
  spec.homepage      = "https://github.com/beth-ruff/trails-near-me"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/beth-ruff/trails-near-me"
  spec.metadata["changelog_uri"] = "https://github.com/beth-ruff/trails-near-me"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
