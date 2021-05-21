---
title: NumericAssessment
menus: chunks
full_name: ObojoboDraft.Chunks.NumericAssessment
class: obo_node
node_class: chunk
---

This is the input-a-number portion of a question containing several answer choices.

## Properties

| Property | Required | Type | Description |
|-
| units | no | {{ 'textGroup' | obo_node }} | An optional one-item TextGroup - this text will be displayed after the answer input.

## Supported Trigger Types

| Action Type | Description
|-
| onMount | Fired when a node is added to the DOM
| onUnmount | Fired when a node is removed from the DOM

## Required Children

Zero or more {{ 'NumericChoice' | obo_node }} nodes.

## Variables Registered

None

## Example

### JSON

```json
{
	"type": "ObojoboDraft.Chunks.NumericAssessment",
	"id": "...",
	"content": {
		"units": [{ "text": { "value": "grams" } }]
	},
	"children": [
		{
			"type": "ObojoboDraft.Chunks.NumericAssessment.NumericChoice",
			"id": "...",
			"content": {
				"score": 100
			},
			"children": [
				{
					"type": "ObojoboDraft.Chunks.NumericAssessment.NumericAnswer",
					"id": "...",
					"content": {
						"answer": "4",
						"requirement": "exact"
					}
				}
			]
		}
	]
}
```

### XML

```xml
<NumericAssessment>
  <units>
    <textGroup><t>grams</t></textGroup>
  </units>
  <NumericChoice score="100">
    <NumericAnswer answer="4" requirement="exact" />
  </NumericChoice>
</NumericAssessment>
```
