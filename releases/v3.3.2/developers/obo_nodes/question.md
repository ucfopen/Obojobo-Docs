---
title: Question
menus: chunks
full_name: OboDraft.Chunks.Question
node_class: chunk
---
Either an assessment or practice question. Questions are designed to support multiple types of scoring but currently only multiple choice questions are implemented. A question is constructed using several different node types.

## Properties

| Property | Required | Type | Description |
|-
| solution | no | [ObojoboDraft.Chunks.Page](obonode_page.md) | A page containing a full-text description of the solution to the problem. If set a button will be available after the question is attempted which will reveal the solution if pressed.


## Required Children

1.  One or more "content type" chunk nodes (**[Break](obonode_break.md)**, **[Code](obonode_code.md)**, **[Figure](obonode_figure.md)**, **[Heading](obonode_heading.md)**, **[List](obonode_list.md)**, **[MathEquation](obonode_mathequation.md)**, **[Table](obonode_table)**, **[Text](obonode_text.md)** and/or **[YouTube](obonode_youtube)**) - This is how you create the actual question
2.  An **[ObojoboDraft.Chunks.MCAssessment](obonode_mcassessment.md)** node - this MUST be the last child.

## Variables Registered

None

## Example

### JSON

```json
{
	"type": "ObojoboDraft.Chunks.Question",
	"content": {
		"solution": {
			"type": "ObojoboDraft.Pages.Page",
			"children": [
				{
					"type": "ObojoboDraft.Chunks.Text",
					"content": {
						"textGroup": [
							{
								"text": {
									"value": "Provide a solution here..."
								}
							}
						]
					}
				}
			]
		}
	},
	"children": [
		{
			"type": "ObojoboDraft.Chunks.Text",
			"content": {
				"textGroup": [
					{
						"text": {
							"value": "What is 2+2?"
						}
					}
				]
			}
		},
		{
			"type": "ObojoboDraft.Chunks.MCAssessment",
			"content": {
				"responseType": "pick-one",
				"shuffle": false
			},
			"children": [
				{
					"type": "ObojoboDraft.Chunks.MCAssessment.MCChoice",
					"content": {
						"score": 0
					},
					"children": [
						{
							"type": "ObojoboDraft.Chunks.MCAssessment.MCAnswer",
							"content": {
								"textGroup": [
									{
										"text": {
											"value": "2"
										}
									}
								]
							}
						},
						{
							"type": "ObojoboDraft.Chunks.MCAssessment.MCFeedback",
							"content": {
								"textGroup": [
									{
										"text": {
											"value": "The correct answer is higher"
										}
									}
								]
							}
						}
					]
				},
				{
					"type": "ObojoboDraft.Chunks.MCAssessment.MCChoice",
					"content": {
						"score": 100
					},
					"children": [
						{
							"type": "ObojoboDraft.Chunks.MCAssessment.MCAnswer",
							"content": {
								"textGroup": [
									{
										"text": {
											"value": "4"
										}
									}
								]
							}
						},
						{
							"type": "ObojoboDraft.Chunks.MCAssessment.MCFeedback",
							"content": {
								"textGroup": [
									{
										"text": {
											"value": "Exactly!"
										}
									}
								]
							}
						}
					]
				}
			]
		}
	]
}
```

### XML (and OboHTML)

```xml
<Question>
  <p>What is 2+2?</p>
  <MCAssessment responseType="pick-one" shuffle="false">
    <MCChoice score="0">
      <MCAnswer>
        <p>2</p>
      </MCAnswer>
      <MCFeedback>
        <p>The correct answer is higher</p>
      </MCFeedback>
    </MCChoice>
    <MCChoice score="100">
      <MCAnswer>
        <p>4</p>
      </MCAnswer>
      <MCFeedback>
        <p>Exactly!</p>
      </MCFeedback>
    </MCChoice>
  </MCAssessment>
  <solution>
    <Page>
      <p>Provide a solution here...</p>
    </Page>
  </solution>
</Question>
```

This creates a multiple-choice question where the student is asked "What is 2+2?" and must choose between and incorrect choice of "2" and the correct choice of "4". If "2" is selected they are given the feedback of "The correct answer is higher". If "4" is selected the feedback shown is simply the word "Exactly!". Optionally after answering they can click on a button to view a more in-depth explanation of the answer (provided by the `solution` page).
