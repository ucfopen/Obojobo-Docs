---
title: MCAssessment > MCChoice > MCAnswer
menus: chunks
full_name: ObojoboDraft.Chunks.MCAssessment.MCAnswer
class: obo_node
node_class: chunk
---

This represents the contents of the answer portion of a multiple choice answer choice.

## Properties

None

## Supported Trigger Types

| Action Type | Description
|-
| onMount | Fired when a node is added to the DOM
| onUnmount | Fired when a node is removed from the DOM

## Required Children

{% assign chunks = (site.pages | where: "can_be_in_a_question", 'true' | sort: 'title' %}

One or more of the following Chunks: {% for chunk in chunks %} {{ chunk.title | obo_node }}{% if forloop.last == false %},{% endif %}{% endfor %}.

## Variables Registered

None

## Example

### JSON

```json
{
	"type": "ObojoboDraft.Chunks.MCAssessment.MCAnswer",
	"id": "...",
	"children": [
		{
			"type": "ObojoboDraft.Chunks.Text",
			"id": "...",
			"content": {
				"textGroup": [
					{
						"text": {
							"value": "Answer choice"
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
<MCAnswer>
  <p>Answer choice</p>
</MCAnswer>
```
