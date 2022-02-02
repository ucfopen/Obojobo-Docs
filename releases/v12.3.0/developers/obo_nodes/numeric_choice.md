---
title: NumericAssessment > NumericChoice
menus: chunks
full_name: ObojoboDraft.Chunks.NumericAssessment.NumericChoice
class: obo_node
node_class: chunk
---

A single answer choice in a multiple choice question containing the contents of the answer and optional feedback. Feedback is not displayed in an Assessment Attempt Quiz but is displayed outside Assessment or in Assessment Review (when full Assessment Review is being shown).

## Properties

| Property | Required | Type | Description |
|-
| score | Required | Integer | `0` or `100`: Represents the correctness of this answer choice - i.e. A correct answer should have a `score` of `100` and incorrect answers a `score` of `0`.

> Partial credit is not supported - values must be either `0` or `100`, not a value in-between. A future release may allow for partial credit.

## Supported Trigger Types

| Action Type | Description
|-
| onMount | Fired when a node is added to the DOM
| onUnmount | Fired when a node is removed from the DOM

## Required Children

Expects one or two children in order:

1.  **REQUIRED**: An {{ 'NumericAnswer' | obo_node }} OboNode.
2.  An {{ 'NumericFeedback' | obo_node }} OboNode. This is not displayed in an Assessment Attempt Quiz but is displayed outside Assessment or in Assessment Review (when full Assessment Review is being shown).

## Variables Registered

None

## Example

### JSON

```json
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
```

### XML (with OboHTML)

```xml
<NumericChoice score="100">
	<NumericAnswer answer="4" requirement="exact" />
</NumericChoice>
```
