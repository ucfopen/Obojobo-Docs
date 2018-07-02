---
id: obonode_mcfeedback
title: ObojoboDraft.Chunks.MCAssessment.MCFeedback
sidebar_label: ObojoboDraft.Chunks.MCAssessment.MCFeedback
---

This represents the contents of the feedback of a multiple choice answer choice. It is functionally identical to an **[ObojoboDraft.Chunks.MCAssessment.MCAnswer](obonode_mcanswer.md)** node, but displays below a MCAssessment after the question has been answered

## Content Values

* None

## Children

* One or more "content type" chunk nodes (**[Break](obonode_break.md)**, **[Code](obonode_code.md)**, **[Figure](obonode_figure.md)**, **[Heading](obonode_heading.md)**, **[List](obonode_list.md)**, **[MathEquation](obonode_mathequation.md)**, **[Table](obonode_table.md)**, **[Text](obonode_text.md)** and/or **[YouTube](obonode_youtube.md)**).

## Variables Registered

* None

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
