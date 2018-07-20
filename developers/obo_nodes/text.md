---
title: Text
menus: chunks
full_name: OboDraft.Chunks.Text
node_class: chunk
---
**Node Class:** *[{{ page.node_class | capitalize }}](/developers/obo_node_structure.html#{{ page.node_class }})*
**Full Name:** *{{ page.full_name }}*

A single block of text similar to a paragraph (`<p>`) tag in HTML.

## Properties

| Property | Required | Type | Description |
|-
| textGroup | Required | [TextGroup](content_textgroup.md) | Expects 1 or more text items.


## Required Children

None

## Variables Registered

None

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
