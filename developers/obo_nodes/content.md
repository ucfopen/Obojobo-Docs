---
title: Content
menus: chunks
full_name: OboDraft.Sections.Content
node_class: section
---
**Node Class:** *[{{ page.node_class | capitalize }}](/developers/obo_node_structure.html#{{ page.node_class }})*
**Full Name:** *{{ page.full_name }}*

The content section contains one or more pages of material.

## Properties

None

## Required Children

Expects one or more of [**ObojoboDraft.Pages.Page**](obonode_page.md)

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
