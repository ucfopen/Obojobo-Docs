---
title: Break
menus: chunks
full_name: ObojoboDraft.Chunks.Break
class: obo_node
node_class: chunk
can_be_in_a_question: yes
---

Inserts a break in the document similar to a `<hr>` tag in HTML.

## Properties

| Property | Required | Type | Description |
|-
| width | no | String | Default: `normal`. Must be either `"normal"` or `"large"`. Specifies if width of the break.

## Supported Trigger Types

| Action Type | Description
|-
| onMount | Fired when a node is added to the DOM
| onUnmount | Fired when a node is removed from the DOM

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
