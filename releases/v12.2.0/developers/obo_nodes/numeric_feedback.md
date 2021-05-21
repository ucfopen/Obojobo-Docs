---
title: NumericAssessment > NumericChoice > NumericFeedback
menus: chunks
full_name: ObojoboDraft.Chunks.NumericAssessment.NumericFeedback
class: obo_node
node_class: chunk
---

This represents the contents of the feedback of a numeric answer choice.

## Properties

None

## Supported Trigger Types

| Action Type | Description
|-
| onMount | Fired when a node is added to the DOM
| onUnmount | Fired when a node is removed from the DOM

## Required Children

One or more of the following Chunks: {% include obo_nodes_that_can_be_in_a_question.md %}.

## Variables Registered

None

## Example

### JSON

```json
{
	"type": "ObojoboDraft.Chunks.NumericAssessment.NumericFeedback",
	"id": "...",
	"children": [
		{
			"type": "ObojoboDraft.Chunks.Text",
			"id": "...",
			"content": {
				"textGroup": [
					{
						"text": {
							"value": "Example Feedback"
						}
					}
				]
			}
		}
	]
}
```

### XML (With OboHTML)

```xml
<NumericFeedback>
  <p>Example Feedback</p>
</NumericFeedback>
```
