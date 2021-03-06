lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "booksCLI/version"

Gem::Specification.new do |spec|
  spec.name          = "booksCLI"
  spec.version       = BooksCLI::VERSION
  spec.authors       = ["Jessica Gladstone"]
  spec.email         = ["jcg321@comcast.net"]

  spec.summary       = %q{CLI app for Google Books.}
  spec.description   = %q{Assignment for 8th Light}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "http://localhost:3000"
  # spec.metadata["changelog_uri"] = ""

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "httparty"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "capybara"
end
