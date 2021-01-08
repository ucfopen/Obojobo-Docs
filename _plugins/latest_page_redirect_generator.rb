module Jekyll
  class LatestPageRedirectGenerator < Generator
    safe true

    def generate(site)
      latest_release_dir = "/releases/v#{get_latest_release_version}"
      latest_release_base_url = "#{latest_release_dir}"

      site.pages.each do |page|
        if page.dir.start_with? latest_release_base_url
          new_dir = page.dir.gsub(latest_release_base_url, '/releases/latest')
          site.pages << LatestPage.new(site, site.source, new_dir, page.name, page.data["title"], page.url)
        end
      end
    end

  end

  # A Page subclass used in the `CategoryPageGenerator`
  class LatestPage < PageWithoutAFile
    def initialize(site, base, dir, name, title, redirect_to)
      @site = site
      @base = base
      @dir  = dir
      @name = name
      @data = { "title" => title, "redirect_to" => redirect_to, "layout" => "redirect" }
      self.process(@name)
    end
  end
end