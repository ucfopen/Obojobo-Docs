---
id: obonode_list
title: ObojoboDraft.Chunks.List
sidebar_label: ObojoboDraft.Chunks.List
---

A bulleted or numeric list similar to `<ul>` or `<li>` elements in HTML.

## Content Values

* `textGroup` **REQUIRED** **[TextGroup](content_textgroup.md)**: Expects 1 or more text items.
* `listStyles` **[ListStyles](content_liststyles.md)**: This defines various options for the list

## Children

* None

## Variables Registered

* None

## Example

### JSON (Unordered list)

```json
{
	"type": "ObojoboDraft.Chunks.List",
	"id": "...",
	"content": {
		"textGroup": [
			{
				"text": {
					"value": "List item 1"
				}
			},
			{
				"text": {
					"value": "List item 2"
				},
				"data": {
					"indent": 1
				}
			}
		]
	}
}
```

### XML (Unordered list)

```xml
<List>
  <textGroup>
    <t>List item 1</t>
    <t indent="1">List item 2</t>
  </textGroup>
</List>
```

### OboHTML (Unordered list)

```xml
<ul>
  <li>List item 1</li>
  <li indent="1">List item 2</li>
</ul>
```

### JSON (Ordered list)

```json
{
	"type": "ObojoboDraft.Chunks.List",
	"id": "...",
	"content": {
		"listStyles": {
			"type": "ordered"
		},
		"textGroup": [
			{
				"text": {
					"value": "List item 1"
				}
			},
			{
				"text": {
					"value": "List item 2"
				},
				"data": {
					"indent": 1
				}
			}
		]
	}
}
```

### XML (Ordered list)

```xml
<List>
  <listStyles>
    <type>ordered</type>
  </listStyles>
  <textGroup>
    <t>List item 1</t>
    <t indent="1">List item 2</t>
  </textGroup>
</List>
```

### OboHTML (Ordered list)

```xml
<ol>
  <li>List item 1</li>
  <li indent="1">List item 2</li>
</ol>
```
