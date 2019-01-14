Jekyll::Hooks.register :pages, :pre_render, priority: "high" do |pages, payload|
  dirs = Dir.glob('./releases/v*').select {|f| File.directory? f}
  dirs = dirs.map {|d| d.gsub("./releases/v", "")}
  dirs = dirs.sort_by { |v| Gem::Version.new(v) }

  page_url = payload.page['url']
  version = ''
  if page_url.include? "/releases/v"
    tokens = page_url.split('/')
    if tokens[2]
      version = page_url.split('/')[2].gsub('v', '')
    end
  end

  version_page_urls = {}
  dirs.each { |d| version_page_urls[d] = payload.page['url'].gsub(version, d) }

  # Export version variables to the `page` object:
  payload.page['docs_versions'] = dirs # Array of versions
  payload.page['docs_version'] = version # Current version
  payload.page['docs_versions_page_urls'] = version_page_urls # Hash of all versions of this page (keyed by version)
  payload.page['latest_url'] = version_page_urls[dirs.last] # The latest version of this page
  payload.page['latest_docs_version'] = dirs.last # Latest version number
  payload.page['is_latest_docs_version'] = version == dirs.last # True if this is the latest version
  payload.page['is_older_docs_version'] = version != dirs.last # True if this is not the latest version
end