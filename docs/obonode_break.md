---
id: obonode_break
title: ObojoboDraft.Chunks.Break
sidebar_label: ObojoboDraft.Chunks.Break
---

Inserts a break in the document similar to a `<hr>` tag in HTML.

### Content Values

* `width` String (Default: `"normal"`): Must be either `"normal"` or `"large"`. Specifies if width of the break.

### Children

* No children

### Variables Registered

* None

### Example

#### JSON

```json
{
	"type": "ObojoboDraft.Chunks.Break",
	"id": "...",
	"content": {
		"width": "large"
	}
}
```

#### XML

```xml
<Break width="large" />
```

#### OboHTML:

```xml
<hr />
```
