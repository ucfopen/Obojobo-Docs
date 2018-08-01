---
title: QuestionBank
menus: chunks
full_name: ObojoboDraft.Chunks.QuestionBank
class: obo_node
node_class: chunk
---

Question banks contain one or more questions or other question banks with rules to describe how to select some subset of its children.

## Properties

| Property | Required | Type | Description |
|-
| choose | no | Integer or `Infinity` | Default: `Infinity`. The number of children (1 or greater) to "choose" when selecting which children to display. If greater then the total number of children QuestionBank will choose all children.
| select | no | String | Default: `sequential`. Describes how the question bank "selects" children - Expected to be one of the following values:

### Supported Values for `select`

| Value | Description |
|-
| sequential | Children will be selected in document order. If `choose` is less than the number of children then each attempt will start at the question after the last selected question.
| random | Children will be selected randomly.
| random-unseen | Children will be selected randomly. If `choose` is less than the number of children then each attempt will prioritize children that were not shown previously.

## Supported Trigger Types

| Action Type | Description
|-
| onMount | Fired when a node is added to the DOM
| onUnmount | Fired when a node is removed from the DOM

## Required Children

One or more of {{ 'QuestionBank' | obo_node }} and/or {{ 'Question' | obo_node }} nodes.

## Variables Registered

None

## Example

### JSON

```json
{
  "type": "ObojoboDraft.Chunks.QuestionBank",
  "id": "...",
  "content": {
    "choose": 2,
    "select": "random"
  },
  "children": [...]
}
```

### XML

```xml
<QuestionBank choose="2" select="random">
  <!-- ... -->
</QuestionBank>
```
