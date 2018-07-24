---
title: Page
menus: chunks
full_name: OboDraft.Pages.Page
node_class: page
---
A generic "page" that can be thought of as a page in a book or an online article.

## Properties

| Property | Required | Type | Description |
|-
| title | no | String | The title of the page displayed in the navigation menu.


## Required Children

One or more Chunk nodes.

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
