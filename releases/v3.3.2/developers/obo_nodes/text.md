---
title: Text
menus: chunks
full_name: ObojoboDraft.Chunks.Text
class: obo_node
node_class: chunk
can_be_in_a_question: yes
---

A single block of text similar to a paragraph (`<p>`) tag in HTML.

Learn more about using text in [Text Content Conventions](../text_content.html)

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
