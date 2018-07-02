---
id: obonode_mcanswer
title: ObojoboDraft.Chunks.MCAssessment.MCAnswer
sidebar_label: ObojoboDraft.Chunks.MCAssessment.MCAnswer
---

This represents the contents of the answer portion of a multiple choice answer choice.

### Content Values

* None

### Children

* One or more "content type" chunk nodes (**[Break](obonode_break.md)**, **[Code](obonode_code.md)**, **[Figure](obonode_figure.md)**, **[Heading](obonode_heading.md)**, **[List](obonode_list.md)**, **[MathEquation](obonode_mathequation.md)**, **[Table](obonode_table)**, **[Text](obonode_text.md)** and/or **[YouTube](obonode_youtube)**).

### Variables Registered

* None

### Example

#### JSON:

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

#### XML (With OboHTML):

```xml
<MCAnswer>
  <p>Answer choice</p>
</MCAnswer>
```
