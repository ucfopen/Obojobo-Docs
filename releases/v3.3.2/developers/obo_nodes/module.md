---
title: Module
menus: chunks
full_name: OboDraft.Modules.Module
node_class: module
---
This **MUST** be the root OboNode of every Obojobo Draft Document.

## Properties

| Property | Required | Type | Description |
|-
| start | no | String | If set this is the id of where the user will be navigated to when the document is loaded. If no value is specified the user will start at the first page of the first section.
| title | Required | String | The title of the module.

## Required Children

Expects one or more of {{ 'Content' | obo_node }} or {{ 'Assessment' | obo_node }}

## Variables Registered

None

## Example

### JSON

```json
{
  "type": "ObojoboDraft.Modules.Module",
  "id": "...",
  "content": {
    "start": "page-1",
    "title": "My Module"
  },
  "children": [...]
}
```

### XML

```xml
<Module start="page-1" title="My Module">
  <!-- ... -->
</Module>
```
