# About

This is the repository for the Obojobo Next documentation (View the current docs at https://ucfopen.github.io/Obojobo-Docs/).

Our documentation is versioned and built using Jekyll.

# File Structure & Versioning

The actual markdown content for the releases are versioned and located in the `/releases` directory. Since Jekyll does not support versioning natively, our system of versioning is explained here. Here's an example of the project's file structure:

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

`./docs/` contains the output files. `./releases/` contains the versioned source files.

`./releases/latest/` is a copy of the files inside the most recent version (in this example, 3.3.3), except each file contains a redirect to the file in the most recent version. This creates a URL to the latest version of a file. In the example above, if a file `./releases/v3.3.3/some-page.md` exists, a redirect-only version of that file will be placed in `./releases/latest/some-page.md`. When the docs are built the URL `http://.../releases/latest/some-page` will redirect to `http://.../releases/v3.3.3/some-page`.

> Note: `./releases/latest` only creates redirects for files in the newest version - it will not create a redirect for any files that only exist in an older version. For example, if `./releases/v3.3.2/example.md` exists but `./releases/v3.3.3/example.md` does not then no redirect will exist in `./releases/latest`.

> The `./releases/latest` directory is not required as the latest redirects are created automatically.

# Getting Started

## Installing

- Run `bundle install --path vendor/bundle`

### Requirements

- Ruby
- Bundler

# Developing the docs

- Run `bundle exec rake dev`
- Go to http://127.0.0.1:4000/Obojobo-Docs/ in your browser

The files in the `./releases` directory will auto-update in your browser when they are modified.

Use the version selector drop-down on a documentation page to switch between versions. Note that this selector is only aware of the list of versispaons in `./releases` and may result in a 404 if the current file does not exist in the newly selected version.

## Creating a new version

- Run `bundle exec rake releases:new_version["VERSION_NUMBER"]`
- Example: `bundle exec rake releases:new_version["5.6.7"]`

This creates a new latest version from the previous latest version (by copying files from the previous latest version).

> If you need to create a new release from a specific older version (instead of the current latest version) see **Creating a new release from a specific version** below

# Writing the documentation

## Helper Liquid Filters

### `obo_node`

- **Purpose**: Turns a string into a clickable link to that Obojobo Node's page
- **Usage Example**: `{{ 'ActionButton' | obo_node }}`
- **Value Example**: `[ActionButton]("http://.../obo_nodes/action_button.html")`

### `menu_titles`

- **Purpose**: Returns an array of title strings from a Jekyll::Menus::Drops::Menu object
- **Usage Example**: `{% assign titles = site.menus.chunks | menu_titles %}`
- **Value Example**: `["ActionButton", "Assessment", "Assessment > rubric", ...]`

### `page_titles`

- **Purpose**: Returns an array of title strings from an array of Jekyll::Page objects
- **Usage Example**: `{% assign titles = site.pages | page_titles %}`
- **Value Example**: `["ActionButton", "Assessment", "Assessment > rubric", ...]`

### `obo_node_names_for_version`

- **Purpose**: Filters an array of Obojobo node names to only include those which exist for the selected release version (as defined by `page.docs_version`). The filtered array is unique and sorted.
- **Usage Example**: `{% assign names = titles | obo_node_names_for_version %}`
- **Value Example**: `["ActionButton", "Assessment", "Assessment > rubric", ...]`

> Note: If you manually iterate over `site.menus.chunks` to get a list of Obojobo chunk nodes (for example) you may get duplicate entries since the Jekyll Menus plugin will find menu items in all release versions. This filter is provided to mitigate this issue as it will produce a unique list of items only for the current version.

## Helper Includes

### `obo_nodes_that_can_be_in_a_question.md`

- **Purpose**: Produces a comma-separated sorted list of clickable Obojobo node links for nodes which have set `can_be_in_a_question` to `true`.
- **Usage Example**: `{% include obo_nodes_that_can_be_in_a_question.md %}`
- **Value Example**: `"[ActionButton]("http://.../obo_nodes/action_button.html"), [Break]("http://.../obo_nodes/break.html"), ..."`

## Helper Variables

### `page.docs_versions`

- **Purpose**: An array of release versions
- **Usage Example**: `{{ page.docs_versions | join: "," }}`
- **Value Example**: `["3.3.2", "9.8.7"]`

### `page.docs_version`

- **Purpose**: A string of the current version
- **Usage Example**: `{{ page.docs_version }}`
- **Value Example**: `"3.3.2"`

### `page.docs_versions_page_urls`

- **Purpose**: Hash of all versions of this page (keyed by version)
- **Usage Example**: `{% for url in page.docs_versions_page_urls %} ... {% endfor %}`
- **Value Example**: `{ "3.3.2" => "http://.../releases/v3.3.2/this-page", ... }`

> Note: This variable is generated simply by getting a list of the version directories in `./releases` and changing the page URL to point to those versions. Not every generated URL is guaranteed to exist and may result in a 404 error.

### `page.latest_url`

- **Purpose**: The URL to the latest release version of this page
- **Usage Example**: `[Latest version]({{ page.latest_url }})`
- **Value Example**: `"http://.../releases/v9.8.7/this-page"`

> Note: This variable is generated simply by getting a list of the version directories in `./releases` and changing the page URL to point to those versions. Not every generated URL is guaranteed to exist and may result in a 404 error.

### `page.latest_docs_version`

- **Purpose**: The latest version string
- **Usage Example**: `{{ page.latest_docs_version }}`
- **Value Example**: `"9.8.7"`

### `page.is_latest_docs_version`

- **Purpose**: Boolean, true if this page is for the latest release version.
- **Usage Example**: `{% if page.is_latest_docs_version %} ... {% endif %}`
- **Value Example**: `true`

### `page.is_older_docs_version`

- **Purpose**: Boolean, true if this page is **not** for the latest release version.
- **Usage Example**: `{% if page.is_older_docs_version %} ... {% endif %}`
- **Value Example**: `false`

## Voice and Language

- Instead of "here, we are showing" and "you can set the attribute", use 'In the example' and 'Use the attribute to...'.
- Avoid use of "currently", and "in the future". Many things will change, no need to be apologetic for what's not done yet.

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

## Update the latest redirects

- Run `bundle exec rake releases:update_latest`

This will update the `./releases/latest` folder which contain redirects to the pages of the current latest version.
