# Requirements

- ruby
- bundler

# Installation

- Run `bundle install`

# Edit and live reloading the docs in the browser

- Run `bundle exec rake dev`

# Running the HTML Proofer

- Run `bundle exec rake test`

# Building the docs

- Run `bundle exec rake build`

# Document conventions

## Versioning

The documents will be versioned to match each release.  Old versions will remain static with exception of fixing inaccuracies.  The process of releasing future versions is yet to be determined, but we will be attempting to make sure

1: absolute urls persist when new versions are released, ie old pages are not moved or renamed
2: the user is made aware what version of the docs they are looking at
3: the user is made aware there is a newer version, if present


## Helper Liquid filters

- `{{ 'Text' | obo_node }}` should always be used when linking to Obojobo nodes.

## Voice and Language

- Instead of "here, we are showing" and "you can set the attribute", use 'In the example' and 'Use the attribute to...'.
- Avoid use of "currently", and "in the future".  Many things will change, no need to be apologetic for what's not done yet.
