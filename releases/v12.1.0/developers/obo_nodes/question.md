---
title: Question
menus: chunks
full_name: ObojoboDraft.Chunks.Question
class: obo_node
node_class: chunk
---

Either an assessment or practice question. Questions are designed to support multiple types of scoring but currently only multiple choice questions are implemented. A question is constructed using several different node types.

## Properties

| Property | Required | Type | Description |
|-
| type | no | String | Default: `default`. Must be either `default` or `survey`. `survey` will create an un-graded question, all other values will create a standard practice or assessment question.
| solution | no | {{ 'Page' | obo_node }} | A page containing a full-text description of the solution to the problem. If this is set a button will be available after the question is attempted which will reveal the solution if pressed. This button is only available for `default` type questions and is hidden when the question is used in an assessment (but will show up in a full assessment review).
| revealAnswer | no | String | Default: `default`. Determines when the "Reveal Answer" button should be displayed for practice questions.
| correctLabels | no | String | Default: `Correct!|You got it!|Great job!|That's right!` for default questions, `Response recorded` for survey questions. A `|` seperated list of labels to display when a non-assessment Question is answered correctly. One label will be selected at random. In Assessment Review this value is ignored (`'Correct!'` is always displayed instead for default questions, and `'Response recorded'` is always displayed for survey questions).
| incorrectLabels | no | String | Default: `Incorrect`. A `|` seperated list of labels to display when a non-assessment Question is answered incorrectly. One label will be selected at random. This value is ignored for survey questions.

## Supported values for `revealAnswer`

| Type Name | Description |
|-
| default | Allow the type of question to determine when/if to show the Reveal Answer button (never for Multiple Choice questions, when-incorrect for Numeric questions)
| never | The button will never be shown for this question
| always | The button will be shown when the question is unanswered or if answered incorrectly
| when-incorrect | The button will only be shown when a question is answered incorrectly

## Supported Trigger Types

| Action Type | Description
|-
| onMount | Fired when a node is added to the DOM
| onUnmount | Fired when a node is removed from the DOM

## Required Children

1.  One or more [Chunk nodes](../#chunk) ({% include obo_nodes_that_can_be_in_a_question.md %}) - This is how you create the actual question
2.  An {{ 'MCAssessment' | obo_node }} or {{ 'NumericAssessment' | obo_node }} node - this MUST be the last child.

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
