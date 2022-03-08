# frozen_string_literal: true

require_relative "lib/viva_wallet/version"

Gem::Specification.new do |spec|
  spec.name          = "viva_wallet"
  spec.version       = VivaWallet::VERSION
  spec.authors       = ["Tom Dallimore"]
  spec.email         = ["me@tomdallimore.com"]

  spec.summary       = "Ruby wrapper for the Viva Wallet payment API."
  spec.description   = "Ruby wrapper for the Viva Wallet payment API."
  spec.homepage      = "https://github.com/Jellyfishboy/viva_wallet"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["source_code_uri"] = "https://github.com/Jellyfishboy/viva_wallet"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rest-client', '~> 2'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
