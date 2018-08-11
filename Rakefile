require 'html-proofer'


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
