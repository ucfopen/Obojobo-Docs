---
id: obonode_module
title: ObojoboDraft.Modules.Module
sidebar_label: ObojoboDraft.Modules.Module
---

This **MUST** be the root OboNode of every Obojobo Draft Document.

### Content Values

* `start` String: If set this is the id of where the user will be navigated to when the document is loaded. If no value is specified the user will start at the first page of the first section.
* `title` **REQUIRED** String: The title of the module.

### Children

* Expects one or more of [**ObojoboDraft.Sections.Content**](obonode_content.md) or [**ObojoboDraft.Sections.Assessment**](obonode_assessment.md)

### Variables Registered

* None

### Example

#### JSON:

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

#### XML:

```xml
<Module start="page-1" title="My Module">
  <!-- ... -->
</Module>
```
