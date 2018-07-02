---
id: obonode_heading
title: ObojoboDraft.Chunks.Heading
sidebar_label: ObojoboDraft.Chunks.Heading
---

Creates headings similar to `<H1>` to `<H6>` tags in HTML.

## Content Values

* `textGroup` **REQUIRED** **[TextGroup](content_textgroup.md)**. Expects 1 text item.
* `headingLevel` Integer (Default: `1`): A value from 1-6 representing the heading level where 1 is the primary heading.

## Children

* No children

## Variables Registered

* None

## Examples

### JSON

```json
{
	"type": "ObojoboDraft.Chunks.Heading",
	"id": "...",
	"content": {
		"headingLevel": 1,
		"textGroup": [
			{
				"text": {
					"value": "Heading 1"
				}
			}
		]
	}
}
```

### XML

```xml
<Heading headingLevel="1">
  <textGroup>
    <t>Heading 1</t>
  </textGroup>
</Heading>
```

### OboHTML

```xml
<h1>Heading 1</h1>
```
