# frozen_string_literal: true

require_relative "lib/luminous_rails_ui/version"

Gem::Specification.new do |spec|
  spec.name = "luminous_rails_ui"
  spec.version = LuminousRailsUi::VERSION
  spec.authors = ["Oscar Ortega"]
  spec.email = ["ortegaoscar14@gmail.com"]

  spec.summary = "This gem is useful for ruby developers that manage all frontend with view_component gem"
  spec.description = "A gem that contain multiple UI components"
  spec.homepage = "https://oortega.dev"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://oortega.dev/gems"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://oortega.dev/gems/pixel_rails"
  spec.metadata["changelog_uri"] = "https://github.com/oortega14/pixel_rails"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "tailwind_merge", "~> 0.13.3"
  spec.add_dependency "view_component", "~> 3.20"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
