# frozen_string_literal: true

require_relative "luminous_rails_ui/version"

module LuminousRailsUi
  class Error < StandardError; end

  # Loading the initial rake
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/luminous_rails_ui.rake"
    end
  end
end
