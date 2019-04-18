---
title: Code
menus: chunks
full_name: ObojoboDraft.Chunks.Code
class: obo_node
node_class: chunk
can_be_in_a_question: yes
---

This chunk is fundamentally identical to the {{ 'Text' | obo_node }} node except the styling of the rendered output is mono-spaced.

## Properties

| Property | Required | Type | Description |
|-
| textGroup | Required | {{ 'textGroup' | obo_node }} | Expects 1 or more text items.

## Supported Trigger Types

| Action Type | Description
|-
| onMount | Fired when a node is added to the DOM
| onUnmount | Fired when a node is removed from the DOM

## Required Children

None

## Variables Registered

None

## Example JSON

```json
{
	"type": "ObojoboDraft.Chunks.Code",
	"id": "...",
	"content": {
		"textGroup": [
			{
				"text": {
					"value": "let x = 2;"
				}
			},
			{
				"text": {
					"value": "return x * 4;"
				}
			}
		]
	}
}
```

## Example XML

```xml
<Code>
  <textGroup>
    <t>let x = 2;</t>
    <t>return x * 4;</t>
  </textGroup>
</Code>
```

## Example OboHTML

```xml
<pre>let x = 2;
return x * 4;</pre>
```
