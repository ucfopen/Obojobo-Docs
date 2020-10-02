---
title: MCAssessment > MCChoice > MCFeedback
menus: chunks
full_name: ObojoboDraft.Chunks.MCAssessment.MCFeedback
class: obo_node
node_class: chunk
---

This represents the contents of the feedback of a multiple choice answer choice. It is functionally identical to an {{ 'MCAnswer' | obo_node }}, but displays below a MCAssessment after the question has been answered

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
	"type": "ObojoboDraft.Chunks.MCAssessment.MCFeedback",
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
<MCFeedback>
  <p>Example Feedback</p>
</MCFeedback>
```
