require_relative 'luminous_rails_ui/version'
require "view_component"
require 'rake'
require 'luminous_rails_ui/config'
require "luminous_rails_ui/components/button"
require "luminous_rails_ui/components/accordion"
require "luminous_rails_ui/components/avatar"
require "luminous_rails_ui/icons/left_arrow"

# Luminous Rails UI
module LuminousRailsUi
  class Error < StandardError; end

  # Loading the initial rake
  def self.load_tasks
    load File.expand_path('./tasks/setup_tailwind.rake', __dir__)
    load File.expand_path('./tasks/javascript_setup.rake', __dir__)
  end
end

LuminousRailsUi.load_tasks
