require_relative '../_util/util.rb'

module Jekyll
  module OboNode
    def current_page_markdown?
      @context.environments.first["page"]["name"].end_with? '.md'
    end

    def obo_node(node_name, render_mode = nil)
      # render_mode defaults to html, if not set
      if render_mode.nil? and current_page_markdown?
        render_mode = 'md'
      end

      base_url =  @context.registers[:site].config['baseurl']
      current_url = @context.environments.first["page"]["url"]
      current_version = @context.environments.first["page"]["docs_version"]

      url = "#{base_url}/releases/v#{current_version}/developers/obo_nodes/#{Util::underscore(node_name)}.html"

      if render_mode === 'md'
        '*['+node_name+']('+url+')*'
      else
        '<em><a href="'+url+'">'+node_name+'</a></em>'
      end
    end

    # Returns an array of titles from a list of Jekyll Menu items
    def menu_titles(input)
      titles = input.to_a().map { | item | item.title }
      titles
    end

    # Returns an array of titles from a list of Jekyll::Page items
    def page_titles(input)
      titles = []
      input.each do | item |
        if item.data["title"]
          titles.push item.data["title"]
        end
      end

      titles
    end

    # Filters an array of titles to only include items that exist for the current docs_version.
    def obo_node_names_for_version(titles)
      filtered_titles = []
      current_version = @context.environments.first["page"]["docs_version"]

      titles.each do | title |
        node_name = title.split(' ')[0]

        path = "./releases/v#{current_version}/developers/obo_nodes/#{Util::underscore(node_name)}.md"

        if File.file?(path)
          filtered_titles.push title
        end
      end

      filtered_titles = filtered_titles.uniq().sort_by { | s | s.downcase }

      filtered_titles
    end
  end
end

Liquid::Template.register_filter(Jekyll::OboNode)
