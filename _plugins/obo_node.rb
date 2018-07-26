module Jekyll
  module OboNode

    def underscore(input)
      input.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
    end

    def obo_node(node_name, force_mode = nil)
      base_url =  @context.registers[:site].config['baseurl']
      current_version = @context.registers[:site].config['obo_version']
      current_url = @context.environments.first["page"]["url"]


      # look in the current page's url to figure out if we have a current version
      pattern = /\/releases\/(v[\d\.]+)\/.+/
      match = current_url.match(pattern)
      if match
        current_version = match[1]
      end

      url = "#{base_url}/releases/#{current_version}/developers/obo_nodes/#{underscore(node_name)}.html"

      if force_mode.nil?
        render_mode = 'html'
        if @context.environments.first["page"]["name"].end_with? '.md'
          render_mode = 'md'
        end
      else
        render_mode = force_mode
      end


      if render_mode === 'md'
        '*['+node_name+']('+url+')*'
      else
        '<em><a href="'+url+'">'+node_name+'</a></em>'
      end

    end
  end
end

Liquid::Template.register_filter(Jekyll::OboNode)
