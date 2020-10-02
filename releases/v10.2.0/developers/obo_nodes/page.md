---
title: Page
menus: chunks
full_name: ObojoboDraft.Pages.Page
class: obo_node
node_class: page
---

A page is a collection of one or more Chunks which make up the primary display of the document. Usually students navigate and experience the document one page at a time.

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
