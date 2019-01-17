module Jekyll
  module Redirects
    def make_url_root_relative(absolute_url)
      tokens = absolute_url.split('/')
      "/#{tokens[3..-1].join('/')}"
	end
  end
end

Liquid::Template.register_filter(Jekyll::Redirects)
