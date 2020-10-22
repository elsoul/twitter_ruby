require_relative "lib/twitter_ruby/version"

Gem::Specification.new do |spec|
  spec.name          = "twitter_ruby"
  spec.version       = TwitterRuby::VERSION
  spec.authors       = ["FUMI-POPPIN"]
  spec.email         = ["fumitake.kawasaki@el-soul.com"]

  spec.summary       = "Twitter Ruby wrapper for Microservice"
  spec.description   = "Twitter Ruby wrapper for Microservice."
  spec.homepage      = "https://github.com/elsoul/twitter_ruby"
  spec.license       = "Apache-2.0"
  spec.metadata = { "source_code_uri" => "https://github.com/elsoul/twitter_ruby" }
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/elsoul/twitter_ruby"
  spec.metadata["changelog_uri"] = "https://github.com/elsoul/twitter_ruby"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
