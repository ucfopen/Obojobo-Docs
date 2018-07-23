---
title: MCChoice
menus: chunks
full_name: OboDraft.Chunks.MCChoice
node_class: chunk
---
A single answer choice in a multiple choice question containing the contents of the answer and optional feedback. Feedback is not displayed in an Assessment Attempt Quiz but is displayed outside Assessment or in Assessment Review (when full Assessment Review is being shown).

## Properties

| Property | Required | Type | Description |
|-
| score | Required | Integer | `0` or `100`: Represents the correctness of this answer choice - i.e. A correct answer should have a `score` of `100` and incorrect answers a `score` of `0`. A future release may allow for partial credit.


## Required Children

Expects one or two children in order:

1.  **REQUIRED**: An **[ObojoboDraft.Chunks.MCAssessment.MCAnswer](obonode_mcanswer.md)** OboNode.
2.  An **[ObojoboDraft.Chunks.MCAssessment.MCFeedback](obonode_mcfeedback.md)** OboNode. This is not displayed in an Assessment Attempt Quiz but is displayed outside Assessment or in Assessment Review (when full Assessment Review is being shown).

## Variables Registered

None

## Example

### JSON

```json
{
	"type": "ObojoboDraft.Chunks.MCAssessment.MCChoice",
	"id": "...",
	"content": {
		"score": 100
	},
	"children": [
		{
			"type": "ObojoboDraft.Chunks.MCAssessment.MCAnswer",
			"id": "...",
			"content": {
				"textGroup": [
					{
						"text": {
							"value": "Fourty two"
						}
					}
				]
			}
		},
		{
			"type": "ObojoboDraft.Chunks.MCAssessment.MCFeedback",
			"id": "...",
			"content": {
				"textGroup": [
					{
						"text": {
							"value": "That is the answer!"
						}
					}
				]
			}
		}
	]
}
```

### XML (with OboHTML)

```xml
<MCChoice score="100">
  <MCAnswer>
    <p>Fourty two</p>
  </MCAnswer>
  <MCFeedback>
    <p>That is the answer!</p>
  </MCFeedback>
</MCChoice>
```
