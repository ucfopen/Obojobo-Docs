require 'html-proofer'
require 'yaml'
require 'find'
require 'fileutils'
require_relative '_plugins/get_release_versions'

namespace :releases do

  task :list do
    puts get_release_versions()
  end

  task :create, [:source_version, :new_version] do |task, args|
    if args.source_version === nil || args.new_version === nil
      puts "Usage:    bundle exec rake releases:create[:source_version,:new_version]"
      puts "Example:  bundle exec rake releases:create['3.3.2','3.4.0']"
      puts "Example:  bundle exec rake 'releases:create[3.3.2,3.4.0]'"
      abort
    end

    release_versions = get_release_versions()
    if release_versions.include?(args.new_version)
      puts "Release #{args.new_version} already exists."
      abort
    end

    # Ensure the given new version is a valid version string:
    unless Gem::Version.correct?(args.new_version)
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
      puts "Example:  bundle exec rake 'releases:delete[3.3.0]'"
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
      puts "Example:  bundle exec rake 'releases:new_version[9.8.7]'"
      abort
    end

    sh "bundle exec rake releases:create['#{get_latest_release_version}','#{args.new_version}']"
  end

end

task :build do
  sh "bundle exec jekyll build --trace"
end

task :dev do
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
