require 'html-proofer'
require 'yaml'

namespace :releases do
  def update_latest_yaml_file(version)
    contents = { "latest" => "v#{version}" }
    File.open('./latest.yml', 'w') { |f| f.write contents.to_yaml }
  end

  def get_latest_release_version
    contents = YAML.load_file("./latest.yml")
    v = contents["latest"]
    if(!v)
      return nil
    end
    v.gsub('v', '')
  end

  def get_old_release_versions
    dirs = Dir.glob('./releases/v*').select {|f| File.directory? f}
    dirs = dirs.map {|d| d.gsub("./releases/v", "")}
    dirs.sort_by { |v| Gem::Version.new(v) }
  end

  def get_release_versions
    releases = get_old_release_versions()
    latest = get_latest_release_version()
    if(latest)
      releases.push latest + " (Latest)"
    end

    releases

  end

  task :list do
    # puts Dir.entries("./releases/")
    puts get_release_versions()
  end

  task :create, [:source_version, :new_version] do |task, args|
    if args.source_version === nil || args.new_version === nil
      puts "Usage:    bundle exec rake releases:create[:source_version,:new_version]"
      puts "Example:  bundle exec rake releases:create['3.3.2','3.4.0']"
      puts "Example:  bundle exec rake releases:create['latest','3.4.0']"
      abort
    end

    latest_version = get_latest_release_version()

    if args.source_version === latest_version || args.source_version === "latest"
      source_dir = './releases/latest'
    else
      source_dir = "./releases/v#{args.source_version}"
    end

    if(!File.directory?(source_dir))
      puts "No release found at '#{source_dir}'"
      puts "Must be one of:"
      puts get_old_release_versions()
      # puts get_latest_release_version()
      puts '"latest"'
      abort
    end

    FileUtils.copy_entry source_dir, "./releases/v#{args.new_version}"
    # puts "yo", args.name
  end

  task :delete, [:version] do |task, args|
    if args.version === nil
      puts "Usage:    rake releases:delete[:version]"
      puts "Example:  rake releases:delete[3.3.0]"
      abort
    end

    source_dir = "./releases/v#{args.version}"

    if(!File.directory?(source_dir))
      puts "No release found at '#{source_dir}'"
      puts "Must be one of:"
      puts get_release_versions()
      abort
    end

    FileUtils.rm_rf source_dir
  end

  task :set_latest, [:version] do |task, args|
    if args.version === nil
      puts "Usage:    bundle exec rake releases:set_latest[:version]"
      puts "Example:  bundle exec rake releases:set_latest[3.4.0]"
      abort
    end

    new_latest_folder = "./releases/v#{args.version}"
    latest_version = get_latest_release_version()

    if(!File.directory?(new_latest_folder))
      puts "No folder found at '#{new_latest_folder}'!"
      puts "Must be one of:"
      puts get_old_release_versions()
      abort
    end

    if latest_version
      if File.directory?("./releases/v#{latest_version}")
        puts "Current latest version (#{latest_version}) could not be renamed since an existing release folder with that version exists. Remove or rename the folder at './releases/v#{latest_version}' first."
        abort
      end

      puts "> Renaming 'latest' folder to 'v#{latest_version}'"
      if !File.directory?("./releases/latest")
        puts "! No 'latest' release folder found. Skipping."
      else
        FileUtils.mv "./releases/latest", "./releases/v#{latest_version}"
      end
    end

    puts "> Renaming 'v#{args.version}' to 'latest'"
    FileUtils.mv new_latest_folder, "./releases/latest"

    puts "> Updating latest file"
    update_latest_yaml_file(args.version)
  end

  task :new_version, [:new_version] do |task, args|
    sh "bundle exec rake releases:create['latest','#{args.new_version}']"
    sh "bundle exec rake releases:set_latest['#{args.new_version}']"
  end
end

task :build do
  sh "bundle exec jekyll build --trace"
end

task :dev do
  sh "bundle exec jekyll serve --livereload --trace"
end

task :dev_latest do
  sh "bundle exec jekyll serve --livereload --trace --config ./_config.yml,./_dev_config.yml"
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
