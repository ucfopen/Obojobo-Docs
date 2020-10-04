
versions = nil

Jekyll::Hooks.register :pages, :pre_render, priority: "high" do |page, payload|

  if versions.nil?
    versions = get_release_versions
  end

  # determine which version the current page belongs to
  this_page_version = ''
  if payload.page['url'].include? "/releases/v"
    tokens = payload.page['url'].split('/')
    if tokens[2]
      this_page_version = tokens[2].gsub('v', '')
    end
  end

  # create a hash of links to this page for each version of the docs
  # version => url
  version_page_urls = {}
  versions.each { |d| version_page_urls[d] = payload.page['url'].gsub(this_page_version, d) }

  # Export version variables to the `page` object:
  payload.page['docs_versions'] = versions # Array of versions
  payload.page['docs_version'] = this_page_version
  payload.page['docs_versions_page_urls'] = version_page_urls # Hash of all versions of this page (keyed by version)
  payload.page['latest_url'] = version_page_urls[versions.last] # The latest version of this page
  payload.page['latest_docs_version'] = versions.last # Latest version number
  payload.page['is_latest_docs_version'] = this_page_version == versions.last # True if this is the latest version
  payload.page['is_older_docs_version'] = this_page_version != versions.last # True if this is not the latest version
end
