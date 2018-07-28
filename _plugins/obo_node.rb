module Jekyll
  module OboNode

    def underscore(input)
      input.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
    end

    def version_to_use
      # look in the current page's url to figure out if we have a current version
      version = version_from_page_path

      # if not, get the current_version from the config
      version ||= @context.registers[:site].config['obo_version']
    end

    def version_from_page_path
      current_url = @context.environments.first["page"]["url"]
      pattern = /\/releases\/(v[\d\.]+)\/.+/
      match = current_url.match(pattern)
      if match
        return match[1]
      end
    end

    def current_page_markdown?
      @context.environments.first["page"]["name"].end_with? '.md'
    end

    def obo_node(node_name, render_mode = nil)
      # render_mode defaults to html, if not set
      if render_mode.nil? and current_page_markdown?
        render_mode = 'md'
      end

      base_url =  @context.registers[:site].config['baseurl']

      url = "#{base_url}/releases/#{version_to_use()}/developers/obo_nodes/#{underscore(node_name)}.html"

      if render_mode === 'md'
        '*['+node_name+']('+url+')*'
      else
        '<em><a href="'+url+'">'+node_name+'</a></em>'
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::OboNode)
