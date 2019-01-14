module Jekyll
  module ChunksFilter
    def underscore(input)
      input.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
    end

    # Filters an array of titles from site.menus.chunks
    # to only include items that are for the current
    # docs_version.
    def only_chunks_for_docs_version(input)
      filtered_menu_titles = []

      input = input.uniq
      input.sort_by { |s| s.downcase }

      current_version = @context.environments.first["page"]["docs_version"]

      base_url =  @context.registers[:site].config['baseurl']

      input.each do |menu_title|
        node_name = menu_title.split(' ')[0]
        path = "./releases/v#{current_version}/developers/obo_nodes/#{underscore(node_name)}.md"

        if File.file?(path)
          filtered_menu_titles.push menu_title
        end
      end

      filtered_menu_titles
    end
  end
end

Liquid::Template.register_filter(Jekyll::ChunksFilter)