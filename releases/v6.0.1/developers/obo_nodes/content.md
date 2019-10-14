---
title: Content
menus: chunks
full_name: ObojoboDraft.Sections.Content
class: obo_node
node_class: section
---

The content section contains one or more pages of material.

## Properties

None

## Supported Trigger Types

| Action Type | Description
|-
| onMount | Fired when a node is added to the DOM
| onUnmount | Fired when a node is removed from the DOM

## Required Children

Expects one or more of {{ 'Page' | obo_node }}

## Variables Registered

None

## Example

### JSON

```json
{
  "type": "ObojoboDraft.Sections.Content",
  "id": "...",
  "children": [...]
}
```

### XML

```xml
<Content>
  <!-- ... -->
</Content>
```
