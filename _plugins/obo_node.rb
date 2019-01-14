module Jekyll
  module OboNode

    def underscore(input)
      input.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
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
      current_url = @context.environments.first["page"]["url"]
      current_version = @context.environments.first["page"]["docs_version"]

      url = "#{base_url}/releases/v#{current_version}/developers/obo_nodes/#{underscore(node_name)}.html"

      if render_mode === 'md'
        '*['+node_name+']('+url+')*'
      else
        '<em><a href="'+url+'">'+node_name+'</a></em>'
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::OboNode)
