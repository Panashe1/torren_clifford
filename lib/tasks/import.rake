namespace :projects do
  desc "Import design projects from folders in storage_import/. " \
       "Each subfolder becomes a Project; every image inside is attached in filename order. " \
       "Usage: bin/rails projects:import [DIR=storage_import]"
  task import: :environment do
    root = Rails.root.join(ENV.fetch("DIR", "storage_import"))

    unless Dir.exist?(root)
      abort "Import directory not found: #{root}\n" \
            "Create it and add one subfolder per project, e.g.:\n" \
            "  #{root}/speleothem-chair/01.jpg"
    end

    image_exts = %w[.jpg .jpeg .png .webp .gif .avif]
    folders = Dir.children(root).select { |c| File.directory?(root.join(c)) }.sort

    if folders.empty?
      abort "No project folders found in #{root}"
    end

    folders.each_with_index do |folder, index|
      title = folder.tr("-_", "  ").split.map(&:capitalize).join(" ")

      images = Dir.children(root.join(folder))
                  .select { |f| image_exts.include?(File.extname(f).downcase) }
                  .sort

      if images.empty?
        puts "  ⚠  #{folder}: no images, skipping"
        next
      end

      project = Project.find_or_initialize_by(title: title)
      project.assign_attributes(
        architect: project.architect.presence || "Old Four Legs",
        category:  "architecture",
        featured:  project.featured || index.zero?,
        position:  project.position || (index + 1),
        image_url: project.image_url.presence || "" # legacy column, unused once attached
      )
      project.save!

      # Replace any existing attachments so re-running is idempotent
      project.photos.purge if project.photos.attached?

      images.each do |filename|
        path = root.join(folder, filename)
        project.photos.attach(
          io:           File.open(path),
          filename:     filename,
          content_type: Marcel::MimeType.for(path)
        )
      end

      puts "  ✓  #{title} — #{images.size} image#{'s' unless images.size == 1} attached"
    end

    puts "\nDone. Imported #{folders.size} project folder(s) from #{root}."
  end
end
