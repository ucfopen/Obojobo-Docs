require 'html-proofer'
require 'yaml'
require 'find'
require 'fileutils'

namespace :releases do
  def get_release_versions
    dirs = Dir.glob('./releases/v*').select {|f| File.directory? f}
    dirs = dirs.map {|d| d.gsub("./releases/v", "")}
    dirs.sort_by { |v| Gem::Version.new(v) }
  end

  def get_latest_release_version
    get_release_versions().last
  end

  def update_latest()
    latest_release_dir = "/releases/v#{get_latest_release_version}"
    redirect_base_url = "#{latest_release_dir}"

    if File.directory? "./releases/latest"
      FileUtils.remove_dir "./releases/latest"
    end

    Find.find(".#{latest_release_dir}") do |path|
      if path.downcase =~ /.*\.md$/
        contents = YAML.load_file(path)
        new_url = path.gsub(".#{latest_release_dir}", "").gsub(/\.md$/, "")
        new_contents = { "title" => contents["title"], "redirect_to" => "#{redirect_base_url}#{new_url}" }
        new_md_file_path = path.gsub(latest_release_dir, "/releases/latest")
        new_md_file_dir = File.dirname(new_md_file_path)

        # Make directories (if they don't exist):
        FileUtils.mkdir_p new_md_file_dir
        # Write new md file
        File.open(new_md_file_path, 'w') { |f| f.write "#{new_contents.to_yaml}---" }
      end
    end
  end

  task :list do
    puts get_release_versions()
  end

  task :create, [:source_version, :new_version] do |task, args|
    if args.source_version === nil || args.new_version === nil
      puts "Usage:    bundle exec rake releases:create[:source_version,:new_version]"
      puts "Example:  bundle exec rake releases:create['3.3.2','3.4.0']"
      abort
    end

    release_versions = get_release_versions()
    if release_versions.include?(args.new_version)
      puts "Release #{args.new_version} already exists."
      abort
    end

    # Ensure the given new version is a valid version string:
    begin
      Gem::Version.new(args.new_version)
    rescue
      puts "#{args.new_version} is not a valid version number."
      abort
    end

    source_dir = "./releases/v#{args.source_version}"

    if(!File.directory?(source_dir))
      puts "No release found at '#{source_dir}'"
      puts "Must be one of:"
      puts release_versions
      abort
    end

    FileUtils.copy_entry source_dir, "./releases/v#{args.new_version}"
  end

  task :delete, [:version] do |task, args|
    if args.version === nil
      puts "Usage:    bundle exec rake releases:delete[:version]"
      puts "Example:  bundle exec rake releases:delete['3.3.0']"
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

  task :new_version, [:new_version] do |task, args|
    if args.new_version === nil
      puts "Usage:    bundle exec rake releases:new_version[:version]"
      puts "Example:  bundle exec rake releases:new_version['9.8.7']"
      abort
    end

    sh "bundle exec rake releases:create['#{get_latest_release_version}','#{args.new_version}']"
  end

  task :update_latest do
    update_latest
  end
end

task :build do
  sh "bundle exec rake releases:update_latest"
  sh "bundle exec jekyll build --trace"
end

task :dev do
  sh "bundle exec rake releases:update_latest"
  sh "bundle exec jekyll serve --livereload --trace"
end

task :test do
  # build into a test directory that has the 'baseurl' encorperated
  sh "bundle exec rake build"
  sh "bundle exec jekyll build -d _test/Obojobo-Docs"

  # run proofer
  options = {
    :assume_extension => true,
    :url_ignore => ['https://github.com/ucfopen/Obojobo']
  }
  HTMLProofer.check_directory("./_test", options).run
end
