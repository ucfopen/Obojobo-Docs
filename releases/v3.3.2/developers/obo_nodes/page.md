---
title: Page
menus: chunks
full_name: OboDraft.Pages.Page
node_class: page
---
**Node Class:** *[{{ page.node_class | capitalize }}](/developers/obo_node_structure.html#{{ page.node_class }})*
**Full Name:** *{{ page.full_name }}*

A generic "page" that can be thought of as a page in a book or an online article.

## Properties

| Property | Required | Type | Description |
|-
| title | no | String | The title of the page displayed in the navigation menu.


## Required Children

One or more **ObojoboDraft.Chunks** nodes.

## Variables Registered

None

## Example

### JSON

```json
{
  "type": "ObojoboDraft.Pages.Page",
  "id": "...",
  "children": [ ... ]
}
```

### XML

```xml
<Page>
  <!-- ... -->
</Page>
```
