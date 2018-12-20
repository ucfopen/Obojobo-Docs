# About

This is the repository for the Obojobo Next documentation (View the current docs at https://ucfopen.github.io/Obojobo-Docs/).

Our documentation is versioned and built off of Jekyll.

# File Structure

The actual markdown content for the releases are versioned and located in the `/releases` directory. Here's an example of the project's file structure:

```
Obojobo-Docs/
	...
	latest.yml
	releases/
		v3.3.2/
		v3.3.3/
		latest/
```

`./releases/latest/` always refers to the latest version. The actual version number of the latest release is kept in `latest.yml`. Rake commands are provided to work with this structure (read **Developing the docs** below).

The `./releases/latest` directory exists to provide permalinks to whatever the latest version is for a documentation page. Older versions are prefixed with `v` followed by the version number (like `v3.3.2` and `v3.3.3` above). This allows anyone using an older version of Obojobo Next to view the documentation relevant for that version.

# Developing the docs

## Installing

- Run `bundle install`

### Requirements

- Ruby
- Bundler

## Editing only the latest version

- Run `bundle exec rake dev_latest`
- Go to `http://127.0.0.1:4000/Obojobo-Docs/` in your browser

Updating the files in the `./releases/latest` directory should auto-update in your browser.

This command only builds the latest version. This means build times will be faster but note that the drop-down version selector will result in 404 errors if you select an older version. To develop on an older version read below:

## Editing all versions

- Run `bundle exec rake dev`
- Go to `http://127.0.0.1:4000/Obojobo-Docs/` in your browser

Updating the files in the `./releases` directory should auto-update in your browser.

Use the version selector drop-down on a documentation page to switch between versions.

## Creating a new version

- Run `bundle exec rake new_version["VERSION_NUMBER"]`
- Example: `bundle exec rake new_version["5.6.7"]`

This creates a new latest version from the previous latest version.

In detail this command does the following:

1. "Archive" the current latest version by changing the folder name to its version number (for example, `./releases/latest` becomes `./releases/v5.6.6`)
2. Copy the contents of that folder to a new `./releases/latest` release folder
3. Update `release.yml` to set the version number that the new `./releases/latest` folder refers to (`5.6.7` in this example)

You can then run `bundle exec rake dev_latest` to start editing your newly created release (See **Editing only the latest version** above for more information).

## Building for production

- Run `bundle exec rake build`

## Additional commands:

These commands are probably not as vital as those above but are provided here for reference

### Setting the latest version

- Run `bundle exec rake set_latest["VERSION_NUMBER"]`

This will change the latest version to any existing version you want. In detail: The `latest` folder will be renamed to its version (taken from `latest.yml`), the given version folder will be renamed to `latest` and the `latest.yml` file will be updated.

### Creating a new release (without changing the latest release)

- Run `bundle exec rake create["SOURCE_VERSION","DESTINATION_VERSION"]`
- Example: `bundle exec rake create["3.3.2","3.3.3"]`

This will create a new directory for the destination version based on the source version. In the example this copies the contents of `./releases/v3.3.2` to `./releases/v3.3.3`.

Note that this does not change the latest release, it is simply a shortcut to copy a directory. See **Setting the latest version** above to do this (or use the `new_version` command instead of this one).

# @TODO

## Running the HTML Proofer

- Run `bundle exec rake test`

# Building the docs

- Run `bundle exec rake build`

## Helper Liquid filters

- `{{ 'Text' | obo_node }}` should always be used when linking to Obojobo nodes.

## Voice and Language

- Instead of "here, we are showing" and "you can set the attribute", use 'In the example' and 'Use the attribute to...'.
- Avoid use of "currently", and "in the future". Many things will change, no need to be apologetic for what's not done yet.
