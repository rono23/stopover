namespace :stopover do
  desc 'Creates static pages'
  task create: :environment do
    logger = Logger.new(STDOUT)
    renderer = Stopover::ApplicationController.renderer
    view_path = Rails.root.join('app', 'views', Stopover.view_path).to_s

    Dir["#{view_path}/**/*"].each do |path|
      filename = File.basename(path)
      next if File.directory?(path) || filename.index(/^_/)

      name = filename.split('.').first
      dir = path.remove(view_path).remove(filename)
      html = renderer.render_to_string("#{Stopover.view_path}#{dir}#{name}", layout: Stopover.layout_name)
      html_dir = "#{Rails.public_path}#{dir}"
      html_path = "#{html_dir}#{name}.html"

      logger.info("Writing #{html_path}")
      FileUtils.mkdir_p(html_dir)
      File.open(html_path, 'w') { |f| f.write(html) }
    end
  end
end

Rake::Task['assets:precompile'].enhance do
  Rake::Task['stopover:create'].invoke unless Stopover.disable_hook_assets_precompile
end
