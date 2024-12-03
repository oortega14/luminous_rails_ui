require_relative 'luminous_rails_ui/version'
require 'rake'

# Luminous Rails UI
module LuminousRailsUi
  class Error < StandardError; end

  # Loading the initial rake
  def self.load_tasks
    load File.expand_path('./tasks/setup_tailwind.rake', __dir__)
  end
end

LuminousRailsUi.load_tasks
