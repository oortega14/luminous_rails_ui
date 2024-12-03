# lib/load_rake_tasks.rb
require 'rake'

# Inicializa el entorno de Rake
Rake.application.init
Rake.application.load_rakefile

# Ejecuta la tarea
Rake.application['luminous_rails_ui:example'].invoke
