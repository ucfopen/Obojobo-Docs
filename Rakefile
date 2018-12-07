require 'html-proofer'

namespace :releases do
  def get_releases
    dirs = Dir.glob('./releases/*').select {|f| File.directory? f}
    dirs = dirs.map {|d| d.gsub("./releases/v", "")}
    puts dirs.sort
  end

  task :list do
    # puts Dir.entries("./releases/")
    puts get_releases()
  end

  task :create, [:source_version, :new_version] do |task, args|
    if args.source_version === nil || args.new_version === nil
      puts "Usage:    rake create_release[:source_version,:new_version]"
      puts "Example:  rake create_release[3.3.2,3.4.0]"
      abort
    end

    source_dir = "./releases/v#{args.source_version}"

    if(!File.directory?(source_dir))
      puts "No release found at '#{source_dir}'"
      puts "Must be one of:"
      puts get_releases()
      abort
    end

    FileUtils.copy_entry "./releases/v#{args.source_version}", "./releases/v#{args.new_version}"
    # puts "yo", args.name
  end

  task :delete, [:version] do |task, args|
    if args.version === nil
      puts "Usage:    rake delete[:version]"
      puts "Example:  rake delete[3.3.2]"
      abort
    end

    source_dir = "./releases/v#{args.version}"

    if(!File.directory?(source_dir))
      puts "No release found at '#{source_dir}'"
      puts "Must be one of:"
      puts get_releases()
      abort
    end

    FileUtils.rm_rf source_dir
  end

end

task :build do
  sh "bundle exec jekyll build"
end

task :dev do
  sh "bundle exec jekyll serve --livereload"
end

task :test do
  # build into a test directory that has the 'baseurl' encorperated
  sh "bundle exec jekyll build -d _test/Obojobo-Docs"

  # run proofer
  options = {
    :assume_extension => true,
    :url_ignore => ['https://github.com/ucfopen/Obojobo']
  }
  HTMLProofer.check_directory("./_test", options).run
end
