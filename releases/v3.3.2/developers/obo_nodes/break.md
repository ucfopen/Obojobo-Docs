---
title: Break
menus: chunks
full_name: OboDraft.Chunks.Break
node_class: chunk
can_be_in_a_question: yes
---
Inserts a break in the document similar to a `<hr>` tag in HTML.

## Properties

| Property | Required | Type | Description |
|-
| width | no | String | Default: `normal`. Must be either `"normal"` or `"large"`. Specifies if width of the break.

## Required Children

None

## Variables Registered

None

## Example

### JSON

```json
{
	"type": "ObojoboDraft.Chunks.Break",
	"id": "...",
	"content": {
		"width": "large"
	}
}
```

### XML

```xml
<Break width="large" />
```

### OboHTML

```xml
<hr width="large"/>
```
