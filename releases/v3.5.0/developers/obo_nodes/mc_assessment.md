---
title: MCAssessment
menus: chunks
full_name: ObojoboDraft.Chunks.MCAssessment
class: obo_node
node_class: chunk
---

This is the multiple choice portion of a question containing several answer choices.

## Properties

| Property | Required | Type | Description |
|-
| responseType | no | String | Default: `pick-one`. Defines what type of multiple choice question this is. Possible values are enumerated below.
| correctLabels | no | String | Default: `Correct!|You got it!|Great job!|That's right!`. A `|` seperated list of labels to display when a non-assessment Question is answered correctly. One label will be selected at random. In Assessment Review this value is ignored (`'Correct!'` is always displayed instead).
| incorrectLabels | no | String | Default: `Incorrect`. A `|` seperated list of labels to display when a non-assessment Question is answered incorrectly. One label will be selected at random.
| shuffle | no | Boolean | Default: `true`. If `false` then the answer choices will be listed in document order. Otherwise answer choices will be shuffled.

### Supported Values for 'responseType'

| Value | Description
|-
| pick-one | Student must choose the single correct answer among the other incorrect answers. Answer choices are presented as a list of radio buttons. Question prompt reads "Pick the correct answer".
| pick-one-multiple-correct | Student must choose one correct answer but more than one correct answer may be available. Answer choices are presented as a list of radio buttons. Question prompt reads "Pick one of the correct answers".
| pick-all | Student is able to choose multiple answers and must select each correct answer without selecting an incorrect answer. Answer choices are presented as a list of checkboxes. Question prompt reads "Pick **all** of the correct answers".

## Supported Trigger Types

| Action Type | Description
|-
| onMount | Fired when a node is added to the DOM
| onUnmount | Fired when a node is removed from the DOM

## Required Children

One or more {{ 'MCChoice' | obo_node }} nodes.

## Variables Registered

None

## Example

### JSON

```json
{
  "type": "ObojoboDraft.Chunks.MCAssessment",
  "id": "...",
  "content": {
    "responseType": "pick-all",
    "shuffle": false
  },
  "children": [
    {
      "type": "ObojoboDraft.Chunks.MCAssessment.MCChoice",
      "id": "...",
      "content": {
        "score": 100
      },
      "children": [ ... ]
    },
    {
      "type": "ObojoboDraft.Chunks.MCAssessment.MCChoice",
      "id": "...",
      "content": {
        "score": 0
      },
      "children": [ ... ]
    }
  ]
}
```

### XML

```xml
<MCAssessment responseType="pick-all" shuffle="false">
  <MCChoice score="100">
    <!-- ... -->
  </MCChoice>
  <MCChoice score="0">
    <!-- ... -->
  </MCChoice>
</MCAssessment>
```
