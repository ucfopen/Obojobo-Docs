
def get_release_versions
	dirs = Dir.glob('./releases/v*').select {|f| File.directory? f}
	dirs = dirs.map {|d| d.gsub("./releases/v", "")}
	dirs.sort_by { |v| Gem::Version.new(v) }
end

def get_latest_release_version
  get_release_versions().last
end

