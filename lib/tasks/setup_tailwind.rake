# frozen_string_literal: true

# lib/tasks/pixel_rails.rake
namespace :luminous_rails_ui do
  desc "Configure Tailwind to use LuminousRailsUI"
  task :install do
    gem_path = Gem::Specification.find_by_name("pixel_rails").gem_dir
    tailwind_config_path = File.join(Rails.root, "tailwind.config.js")

    unless File.exist?(tailwind_config_path)
      puts "Error: No se encontró tailwind.config.js"
      next
    end

    config_content = File.read(tailwind_config_path)

    if config_content.include?(gem_path)
      puts "LuminousRailsUi ya está configurado en Tailwind."
      next
    end

    config_content.gsub!(/([^\s,])\s*\]/, "\\1,\n]")

    config_content.gsub!(/\]/, "    '#{gem_path}/**/*.{html,rb}',\n]")

    File.open(tailwind_config_path, "w") do |file|
      file.puts config_content
    end

    puts "LuminousRailsUi instalado en Tailwind con éxito."
  end
end
