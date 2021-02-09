---
title: Heading
menus: chunks
full_name: ObojoboDraft.Chunks.Heading
class: obo_node
node_class: chunk
can_be_in_a_question: yes
---

Creates headings similar to `<H1>` to `<H6>` tags in HTML.

## Properties

| Property | Required | Type | Description |
|-
| textGroup | Required | {{ 'textGroup' | obo_node }} | Expects 1 text item.
| headingLevel | no | Integer | Default: `1`. A value from 1 to 6 representing the heading level where 1 is the primary heading.

## Supported Trigger Types

| Action Type | Description
|-
| onMount | Fired when a node is added to the DOM
| onUnmount | Fired when a node is removed from the DOM

## Required Children

None

## Variables Registered

None

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
