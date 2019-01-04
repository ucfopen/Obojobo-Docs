# About

This is the repository for the Obojobo Next documentation (View the current docs at https://ucfopen.github.io/Obojobo-Docs/).

Our documentation is versioned and built off of Jekyll.

# File Structure & Versioning

The actual markdown content for the releases are versioned and located in the `/releases` directory. Since Jekyll does not support versioning natively our system of versioning is explained here. Here's an example of the project's file structure:

```
Obojobo-Docs/
	...
	docs/
	releases/
		v3.3.2/
		v3.3.3/
		...
		latest/
```

`./docs/` contain the output files. `./releases/` contain the versioned source files.

`./releases/latest/` is a copy of the files inside the most recent version (in this example, 3.3.3) except each file contains a redirect to the file in the most recent version. This creates a URL to the latest version of a file. In the example above, if a file `./releases/v3.3.3/some-page.md` exists then a redirect-only version of that file will be placed in `./releases/latest/some-page.md`. The result of this is that when the docs are built the URL `http://.../releases/latest/some-page` will redirect to `http://.../releases/v3.3.3/some-page`.

> Note: `./releases/latest` only creates redirects for files in the newest version - it will not create a redirect for any files that only exist in an older version. For example, if `./releases/v3.3.2/example.md` exists but `./releases/v3.3.3/example.md` does not then no redirect will exist in `./releases/latest`.

> The `./releases/latest` directory is updated when the docs are built or on the first run when developing. There are also rake commands to do this (see "Update the latest redirects" below).

# Getting Started

## Installing

- Run `bundle install`

### Requirements

- Ruby
- Bundler

# Developing the docs

- Run `bundle exec rake dev`
- Go to http://127.0.0.1:4000/Obojobo-Docs/ in your browser

Updating the files in the `./releases` directory should auto-update in your browser.

Use the version selector drop-down on a documentation page to switch between versions. Note that this selector is only aware of the list of versions in `./releases` and may result in a 404 if the current file does not exist in the newly selected version.

> Note regarding `latest`: The first time the `dev` command is run the `./releases/latest/` directory will be updated however it will not be ran again afterwards. You'll need to re-run this command (or run `bundle exec rake releases:dev_update_latest`) if you need this directory updated.

## Creating a new version

- Run `bundle exec rake releases:new_version["VERSION_NUMBER"]`
- Example: `bundle exec rake releases:new_version["5.6.7"]`

This creates a new latest version from the previous latest version (by copying files from the previous latest version).

> If you need to create a new release from a specific older version (instead of the current latest version) see **Creating a new release from a specific version** below

# Writing the documentation

## Helper Liquid filters

- `{{ 'Text' | obo_node }}` should always be used when linking to Obojobo nodes.

## Voice and Language

- Instead of "here, we are showing" and "you can set the attribute", use 'In the example' and 'Use the attribute to...'.
- Avoid use of "currently", and "in the future". Many things will change, no need to be apologetic for what's not done yet.

## Additional variables

The plugin file `versioning_hooks.rb` adds a few variables to `page`:

- `page.docs_versions`: An array of release versions (such as `["3.3.2", "9.8.7"]`)
- `page.docs_version`: The current version (such as `"3.3.2"`)
- `page.docs_versions_page_urls`: Hash of all versions of this page (keyed by version, for example `{ "3.3.2" => "http://.../releases/v3.3.2/this-page", ... }`)
- `page.latest_url`: The URL to the latest release version of this page (such as `"http://.../releases/v9.8.7/this-page"`)
- `page.latest_docs_version`: The latest version (such as `"9.8.7"`)
- `page.is_latest_docs_version`: `true` if this page is the latest version, `false` otherwise
- `page.is_older_docs_version`: `true` if this page is not the latest version, `false` otherwise

> Note: The `page.docs_versions_page_urls` and `page.latest_url` variables are generated simply by getting a list of the version directories in `./releases` and changing the page URL to point to those versions. Not every generated URL is guaranteed to exist and may result in a 404 error.

# Committing & Building Docs for Production

1. Run `bundle exec rake build` - This will update the `./releases/latest` folder, then build the `./docs` folder for production.
1. Run `bundle exec rake test` - This will run the HTML Proofer on the content and return any errors (such as bad links).
1. Commit

# Additional rake commands:

These commands are probably not as vital as those above but are provided here for reference

## Show list of documentation versions

- Run `bundle exec rake releases:list`

## Creating a new release from a specific version

- Run `bundle exec rake releases:create["SOURCE_VERSION","DESTINATION_VERSION"]`
- Example: `bundle exec rake releases:create["3.3.2","3.3.3"]`

This will create a new directory for the destination version based on the source version. In the example this copies the contents of `./releases/v3.3.2` to `./releases/v3.3.3`.

> If you are creating a release from the latest version you can use `bundle exec rake releases:new_version` instead.

## Deleting a release

- Run `bundle exec rake releases:delete["RELEASE_VERSION"]`
- Example: `bundle exec rake releases:delete["3.3.3"]`

Deletes all source files for the given version. In this example this command would delete the `./releases/v3.3.3` folder.

## Update the latest redirects (for production)

- Run `bundle exec rake releases:update_latest`

This will update the `./releases/latest` folder which contain redirects to the pages of the current latest version. The redirect URLs are generated using the `url` and `baseurl` values specified in `./_config.yml`.

## Update the latest redirects (for development)

- Run `bundle exec rake releases:dev_update_latest`

This is the same as above except the redirect URLs generated will be local (at `http://127.0.0.1:4000`).
