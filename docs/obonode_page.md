---
id: obonode_page
title: ObojoboDraft.Pages.Page
sidebar_label: ObojoboDraft.Pages.Page
---

A generic "page" that can be thought of as a page in a book or an online article.

### Content Values

* `title` String: The title of the page (used in the generated navigation).

### Children

* One or more **ObojoboDraft.Chunks** nodes.

### Variables Registered

* None

### Example

#### JSON

```json
{
  "type": "ObojoboDraft.Pages.Page",
  "id": "...",
  "children": [ ... ]
}
```

#### XML

```xml
<Page>
  <!-- ... -->
</Page>
```
