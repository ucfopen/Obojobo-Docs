---
id: obonode_text
title: ObojoboDraft.Chunks.Text
sidebar_label: ObojoboDraft.Chunks.Text
---

A single block of text similar to a paragraph (`<p>`) tag in HTML.

## Content Values

* `textGroup` **REQUIRED** **[TextGroup](content_textgroup.md)**: Expects 1 or more text items.

## Children

* None

## Variables Registered

* None

## Example

### JSON

```json
{
	"type": "ObojoboDraft.Chunks.Text",
	"id": "...",
	"content": {
		"textGroup": [
			{
				"text": {
					"value": "Hello world!"
				}
			}
		]
	}
}
```

### XML

```xml
<Text>
  <textGroup>
    <t>Hello world!</t>
  </textGroup>
</Text>
```

### OboHTML

```xml
<p>Hello world!</p>
```
