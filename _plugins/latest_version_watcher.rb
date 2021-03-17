require 'jekyll-watch'
require_relative './get_release_versions'

if(ENV["WATCH_VERSION"])
  module Jekyll
    module Watcher
      # replace old method by new method
      # new method is now :custom_excludes
      # overridden method is now :old_custom_excludes
      alias_method :old_custom_excludes, :custom_excludes
      def custom_excludes(options)
        versions = get_release_versions()
        exclude_versions = versions.select { |v| v != ENV["WATCH_VERSION"] }
        exclude_paths = exclude_versions.map { |v| "releases/v" + v }

        options['exclude'] = options['exclude'].concat exclude_paths

        # pass the new option array to overridden method
        old_custom_excludes(options)
      end
    end
  end
end