# require 'yaml'
require 'pathname'

require 'fileutils'
# versions = YAML.load_file('../../../_releases.yml')
# require '../../../Rakefile'

module Jekyll
  class Releases < Liquid::Tag

	# def __cur
	# 	FileUtils.cp_r Dir.glob('./releases/v3.3.2/**/*.md'), './releases/current'
	# end

		def get_latest_release_version
			contents = YAML.load_file("./latest.yml")
			if !contents["latest"]
				return nil
			end

			contents["latest"].gsub('v', '')
		end

		def get_release_versions
			dirs = Dir.glob('./releases/v*').select {|f| File.directory? f}
			dirs = dirs.map {|d| d.gsub("./releases/v", "")}
			latest_release = get_latest_release_version()
			if latest_release
				dirs.push latest_release
			end
			dirs.sort_by { |v| Gem::Version.new(v) }
		end

		# def initialize(tag_name, text, tokens)
		# 	super

		# 	# Search for a _releases.yml file:
		# 	target_file = "_releases.yml"
		# 	file = Pathname.new(target_file)
		# 	while !file.exist?
		# 		target_file = "../#{target_file}"
		# 		file = Pathname.new(target_file)
		# 	end

		# 	@versions = YAML.load_file(target_file)
		# end

		def initialize(tag_name, text, tokens)
			super
			@versions = get_release_versions
			@latest_version = get_latest_release_version
			# @versions[-1] = "Latest (#{@versions.last})"
		end

		def render(context)
			options = Array.new()

			@versions.each do |version|
				if(version == @latest_version)
					options.push "<option value='latest'>Latest (#{@latest_version})</option>"
				else
					options.push "<option value='v#{version}'>#{version}</option>"
				end
			end



			output = "<div class='styled-select'><select class='release-select'>#{options.join('')}</select></div>"
			output += "<script>\n"
			output += "var urlTokens = window.location.toString().split('/')\n"
			output += "var oboVersion = urlTokens[5]\n"
			output += "var releasesSelectEl = document.getElementsByTagName('select')[document.getElementsByTagName('select').length - 1]\n"

			output += "for (var i = 0, len = releasesSelectEl.children.length; i < len; i++) {\n"
			output += "	if (oboVersion === releasesSelectEl.children[i].value) {\n"
			output += "		releasesSelectEl.children[i].selected = true\n"
			output += "	}\n"
			output += "}\n"

			output += "releasesSelectEl.addEventListener('change', function(event) {\n"
			output += "	var urlTokens = window.location.toString().split('/')\n"
			output += "	urlTokens[5] = event.target.value\n"

			output += "	window.location = urlTokens.join('/')\n"
			output += "})\n"
			output += "</script>"

			output
		end
	end
end

Liquid::Template.register_tag('releases', Jekyll::Releases)
