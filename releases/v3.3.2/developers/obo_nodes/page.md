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


## Supported Trigger Types

| Action Type | Description
|-
| onMount | Fired when a node is added to the DOM
| onUnmount | Fired when a node is removed from the DOM
| onNavEnter | Fired when a node is navigated to
| onNavExit | Fired when a node is navigated away from

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
