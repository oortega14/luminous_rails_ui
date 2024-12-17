# lib/tasks/luminous_rails_ui_setup.rake

namespace :luminous_rails_ui do
  desc "Copia los archivos JS de la gema a la carpeta de assets y actualiza application.js"
  task :install_js do
    # Define la ruta de los archivos JS en la gema y el destino
    source_dir = File.expand_path('../luminous_rails_ui/javascript', __dir__) # `lib/luminous_rails_ui/javascript`
    target_dir = Rails.root.join('app/javascript/luminous_rails_ui')

    # Crea la carpeta de destino si no existe
    FileUtils.mkdir_p(target_dir) unless File.exist?(target_dir)

    # Copia todos los archivos JS al directorio de destino
    Dir.glob("#{source_dir}/*.js").each do |file|
      target_file = target_dir.join(File.basename(file))
      FileUtils.cp(file, target_file)
      puts "Copy: #{file} -> #{target_file}"
    end

    # Agregar importaciones en application.js
    application_js_path = Rails.root.join('app/javascript/application.js')

    # Verificar si ya están importados, si no, agregar las líneas correspondientes
    if File.read(application_js_path).include?('luminous_rails_ui')
      puts "Ya se han agregado las importaciones a application.js."
    else
      File.open(application_js_path, 'a') do |file|
        file.puts "\n// Importaciones de luminous_rails_ui"
        Dir.glob("#{target_dir}/*.js").each do |js_file|
          file.puts "import './luminous_rails_ui/#{File.basename(js_file)}'"
        end
      end
      puts "Actualizado application.js con las importaciones necesarias."
    end
  end
end
